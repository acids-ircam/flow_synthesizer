# -*- coding: utf-8 -*-

import os
import json, codecs
import torch

# Turn counts into IDx
def turn_count_to_idx(l):
    final_dict = {}
    for i in range(len(l)):
        final_dict[l[i][0]] = i + 1
    return final_dict

def define_dataset():
    with codecs.open("dataset.json", encoding="utf-8") as f:
        diva_dataset = json.load(f)
    characters = []
    features = []
    categories = []
    cat_large = []
    for k_hash, v in diva_dataset.items():
        if (v['Meta'].get('Character') is not None):
            [characters.append(x) for x in v['Meta'].get('Character')]
        if (v['Meta'].get('Features') is not None):
            [features.append(x) for x in v['Meta'].get('Features')]
        if (v['Meta'].get('Categories') is not None):
            [categories.append(x) for x in v['Meta'].get('Categories')]
            [cat_large.append(x.split(':')[0]) for x in v['Meta'].get('Categories')]
    # Characters (Dark, Clean, Aggressive)
    char_count = [[x,characters.count(x)] for x in set(characters)]
    char_count = sorted(char_count,key=lambda x: x[1])
    # Count features (Arp, Mono, Poly, Chord)
    feat_count = [[x,features.count(x)] for x in set(features)]
    feat_count = sorted(feat_count,key=lambda x: x[1])
    # Sort categories (large: Keys, FX, Drums)
    cat_large_count = [[x,cat_large.count(x)] for x in set(cat_large)]
    cat_large_count = sorted(cat_large_count,key=lambda x: x[1])
    # Sort categories (precise)
    cat_count = [[x,categories.count(x)] for x in set(categories)]
    cat_count = sorted(cat_count,key=lambda x: x[1])
    char_idx = turn_count_to_idx(char_count)
    feat_idx = turn_count_to_idx(feat_count)
    cat_large_idx = turn_count_to_idx(cat_large_count)
    cat_idx = turn_count_to_idx(cat_count)
    antonyms = [("Bright", "Dark"), ("Clean", "Dirty"), ("Modern", "Vintage"), ("Thin", "Phat"), ("Soft", "Aggressive"), ("Constant", "Moving"),
                ("Natural", "Synthetic"), ("Narrow", "Wide"), ("Harmonic", "Inharmonic"), ("Static", "Dynamic")]
    antonyms_defs = []
    for a in range(len(antonyms)):
        antonyms_defs.append(antonyms[a][1].lower())
    return diva_dataset, char_idx, feat_idx, cat_large_idx, cat_idx, antonyms, antonyms_defs

def generate_dataset(target_file, loaders, model_analysis):
    # First retrieve dataset definitions
    diva_dataset, char_idx, feat_idx, cat_large_idx, cat_idx, antonyms, antonyms_defs = define_dataset()
    # Create new field
    model_analysis['hash_loaders'] = {}
    if (not os.path.exists(target_file)):
        with open(target_file, 'w') as f:
            cur_id = 0
            loader_id = 0
            sets_len = 0
            for loader in loaders:
                sets_len += len(loader)
            f.write('\t(\n')
            f.write('\t\t( presets\n')
            f.write('\t\t\t( hash s )\n')
            f.write('\t\t\t( features s )\n')
            f.write('\t\t\t( category s )\n')
            f.write('\t\t\t( categories s )\n')
            for c in range(len(antonyms_defs)):
                f.write('\t\t\t( %s i )\n'%(antonyms_defs[c]))
            for d in range(len(loaders[0].dataset.final_params)):
                f.write('\t\t\t( x%d f )\n'%(d))
            f.write('\t\t)\n')              
            f.write('\t\t(\n')    
            for loader in loaders:
                cur_l_id = 0
                for (x, y, meta, _) in loader:
                    for b in range(x.shape[0]):           
                        f.write('\t\t\t(\n')               
                        f.write('\t\t\t\t( preset_id %d )\n'%(cur_id + 1) ) 
                        fname = os.path.basename(loader.dataset.data_files[cur_l_id]).split('_')[0]
                        f.write('\t\t\t\t( hash %s )\n'%(fname))
                        v = diva_dataset[fname]
                        feat_str = 'None'
                        if (v['Meta'].get('Features') is not None):
                            cur_f = 0
                            for x in v['Meta'].get('Features'):
                                if (feat_idx[x] > cur_f):
                                    cur_f = feat_idx[x]
                                    feat_str = x
                        f.write('\t\t\t\t( features %s )\n'%(feat_str))
                        cat_large_str = 'None'
                        cat_str = 'None'
                        if (v['Meta'].get('Categories') is not None):
                            cur_c = 0
                            cur_l = 0
                            for x in v['Meta'].get('Categories'):
                                if (cat_idx[x] > cur_c):
                                    cur_c = cat_idx[x]
                                    cat_str = x
                                x = x.split(':')[0]
                                if (cat_large_idx[x] > cur_l):
                                    cur_l = cat_large_idx[x]
                                    cat_large_str = x
                        f.write('\t\t\t\t( category %s )\n'%(cat_large_str))
                        f.write('\t\t\t\t( categories %s )\n'%(cat_str))
                        for c in range(len(antonyms_defs)):
                            val_c = 0
                            if (v['Meta'].get('Character') is not None):                    
                                if (antonyms[c][0] in v['Meta'].get('Character')):
                                    val_c = 1                    
                                if (antonyms[c][1] in v['Meta'].get('Character')):
                                    val_c = 2
                            f.write('\t\t\t\t( %s %d )\n'%(antonyms_defs[c], val_c))
                        for d in range(model_analysis['final_z'].shape[1]):
                            f.write('\t\t\t\t( x%d %f )\n'%(d, model_analysis['final_z'][cur_id, model_analysis['d_idx'][d]]))
                        model_analysis['hash_loaders'][fname] = [loader_id, cur_l_id, cur_id]
                        f.write('\t\t\t)\n')          
                        cur_l_id += 1
                        cur_id += 1
                loader_id += 1
            f.write('\t\t)\n')    
            f.write('/t)\n')
    else:
        loader_id = 0
        for loader in loaders:
            cur_l_id = 0
            for (x, y, meta, _) in loader:
                for b in range(x.shape[0]):           
                    fname = os.path.basename(loader.dataset.data_files[cur_l_id]).split('_')[0]
                    model_analysis['hash_loaders'][fname] = [loader_id, cur_l_id]
                    cur_l_id += 1
            loader_id += 1
    return model_analysis
                        
