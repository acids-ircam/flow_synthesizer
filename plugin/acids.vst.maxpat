{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 3,
			"revision" : 5,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ -959.0, -1001.0, 1437.0, 937.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 363.833374, 229.797119, 73.0, 22.0 ],
					"style" : "",
					"text" : "read init.fxb"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 388.333374, 90.364746, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 429.333374, 52.0, 81.0, 22.0 ],
					"style" : "",
					"text" : "prepend plug"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-20",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 429.333374, 13.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-19",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 131.666626, 457.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-18",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ -5.333374, 457.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 83.666626, 457.5, 44.0, 22.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}
,
					"style" : "",
					"text" : "out~ 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 31.666626, 457.5, 44.0, 22.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}
,
					"style" : "",
					"text" : "out~ 1"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-14",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 423.666626, 511.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 423.666626, 457.5, 95.0, 22.0 ],
					"style" : "",
					"text" : "r #0_vst_values"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 31.666626, 107.5, 71.0, 22.0 ],
					"style" : "",
					"text" : "s #0_vst_in"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-12",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 31.666626, 60.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 928.5, 240.0, 58.0, 22.0 ],
					"style" : "",
					"text" : "route 1 0"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.792157, 0.219608, 0.133333, 1.0 ],
					"fontname" : "Helvetica Neue",
					"fontsize" : 12.0,
					"id" : "obj-10",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1103.666626, 113.364746, 106.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 6.666626, 4.5, 85.0, 27.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[1]",
							"parameter_shortname" : "live.text",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ]
						}

					}
,
					"text" : "Plug",
					"varname" : "live.text[1]"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.792157, 0.219608, 0.133333, 1.0 ],
					"fontname" : "Helvetica Neue",
					"fontsize" : 12.0,
					"id" : "obj-9",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 928.5, 194.932373, 106.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 6.666626, 35.0, 85.0, 27.0 ],
					"rounded" : 32.0,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text",
							"parameter_shortname" : "live.text",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ]
						}

					}
,
					"text" : "Interface",
					"texton" : "Hide",
					"varname" : "live.text"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-4",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 312.666626, 511.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 312.666626, 457.5, 96.0, 22.0 ],
					"style" : "",
					"text" : "r #0_vst_names"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1036.0, 533.0, 116.0, 22.0 ],
					"style" : "",
					"text" : "prepend showname"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 18.0,
					"id" : "obj-5",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 513.0, 288.0, 216.0, 27.0 ],
					"style" : "",
					"text" : "VST Parameters"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 18.0,
					"id" : "obj-3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 31.666626, 16.0, 216.0, 27.0 ],
					"style" : "",
					"text" : "VST Section"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-165",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 886.833374, 456.5, 71.0, 22.0 ],
					"style" : "",
					"text" : "s #0_vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-166",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 886.833374, 425.0, 164.0, 22.0 ],
					"style" : "",
					"text" : "prepend \"VCF1: Resonance\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-167",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 886.833374, 357.0, 44.0, 36.0 ],
					"presentation_rect" : [ 0.0, 0.0, 44.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.dial[2]",
							"parameter_shortname" : "live.dial",
							"parameter_type" : 0,
							"parameter_mmax" : 1.0,
							"parameter_unitstyle" : 0
						}

					}
,
					"showname" : 0,
					"varname" : "live.dial[2]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-164",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1036.0, 477.5, 74.0, 22.0 ],
					"style" : "",
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-163",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 748.333374, 595.5, 98.0, 22.0 ],
					"style" : "",
					"text" : "prepend append"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-160",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 903.333374, 588.5, 85.0, 22.0 ],
					"style" : "",
					"text" : "r param_bang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-161",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 903.333374, 621.5, 37.0, 22.0 ],
					"style" : "",
					"text" : "clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-162",
					"items" : [ "main: Output", ",", "main: Active #FX1", ",", "main: Active #FX2", ",", "PCore: LED Colour", ",", "VCC: Voices", ",", "VCC: Voice Stack", ",", "VCC: Mode", ",", "VCC: GlideMode", ",", "VCC: Glide", ",", "VCC: Glide2", ",", "VCC: GlideRange", ",", "VCC: PitchBend Up", ",", "VCC: PitchBend Down", ",", "VCC: TuningMode", ",", "VCC: Transpose", ",", "VCC: FineTuneCents", ",", "VCC: Note Priority", ",", "VCC: MultiCore", ",", "OPT: Accuracy", ",", "OPT: OfflineAcc", ",", "OPT: TuneSlop", ",", "OPT: CutoffSlop", ",", "OPT: GlideSlop", ",", "OPT: PWSlop", ",", "OPT: EnvrateSlop", ",", "OPT: V1Mod", ",", "OPT: V2Mod", ",", "OPT: V3Mod", ",", "OPT: V4Mod", ",", "OPT: V5Mod", ",", "OPT: V6Mod", ",", "OPT: V7Mod", ",", "OPT: V8Mod", ",", "ENV1: Attack", ",", "ENV1: Decay", ",", "ENV1: Sustain", ",", "ENV1: Release", ",", "ENV1: Velocity", ",", "ENV1: Model", ",", "ENV1: Trigger", ",", "ENV1: Quantise", ",", "ENV1: Curve", ",", "ENV1: Release On", ",", "ENV1: KeyFollow", ",", "ENV2: Attack", ",", "ENV2: Decay", ",", "ENV2: Sustain", ",", "ENV2: Release", ",", "ENV2: Velocity", ",", "ENV2: Model", ",", "ENV2: Trigger", ",", "ENV2: Quantise", ",", "ENV2: Curve", ",", "ENV2: Release On", ",", "ENV2: KeyFollow", ",", "LFO1: Sync", ",", "LFO1: Restart", ",", "LFO1: Waveform", ",", "LFO1: Phase", ",", "LFO1: Delay", ",", "LFO1: DepthMod Src1", ",", "LFO1: DepthMod Dpt1", ",", "LFO1: Rate", ",", "LFO1: FreqMod Src1", ",", "LFO1: FreqMod Dpt", ",", "LFO2: Sync", ",", "LFO2: Restart", ",", "LFO2: Waveform", ",", "LFO2: Phase", ",", "LFO2: Delay", ",", "LFO2: DepthMod Src1", ",", "LFO2: DepthMod Dpt1", ",", "LFO2: Rate", ",", "LFO2: FreqMod Src1", ",", "LFO2: FreqMod Dpt", ",", "MOD: Quantise", ",", "MOD: Slew Rate", ",", "MOD: RectifySource", ",", "MOD: InvertSource", ",", "MOD: QuantiseSource", ",", "MOD: LagSource", ",", "MOD: AddSource1", ",", "MOD: AddSource2", ",", "MOD: MulSource1", ",", "MOD: MulSource2", ",", "OSC: Model", ",", "OSC: Tune1", ",", "OSC: Tune2", ",", "OSC: Tune3", ",", "OSC: Vibrato", ",", "OSC: PulseWidth", ",", "OSC: Shape1", ",", "OSC: Shape2", ",", "OSC: Shape3", ",", "OSC: FM", ",", "OSC: Sync2", ",", "OSC: OscMix", ",", "OSC: Volume1", ",", "OSC: Volume2", ",", "OSC: Volume3", ",", "OSC: PulseShape", ",", "OSC: SawShape", ",", "OSC: SuboscShape", ",", "OSC: Tune1ModSrc", ",", "OSC: Tune1ModDepth", ",", "OSC: Tune2ModSrc", ",", "OSC: Tune2ModDepth", ",", "OSC: PWModSrc", ",", "OSC: PWModDepth", ",", "OSC: ShapeSrc", ",", "OSC: ShapeDepth", ",", "OSC: Triangle1On", ",", "OSC: Sine2On", ",", "OSC: Saw1On", ",", "OSC: Pwm1On", ",", "OSC: Triangle2On", ",", "OSC: Saw2On", ",", "OSC: Pulse2On", ",", "OSC: PWM2On", ",", "OSC: Noise1On", ",", "OSC: ShapeModel", ",", "OSC: Sync3", ",", "OSC: NoiseVol", ",", "OSC: NoiseColor", ",", "OSC: TuneModOsc1", ",", "OSC: TuneModOsc2", ",", "OSC: TuneModOsc3", ",", "OSC: ShapeModOsc1", ",", "OSC: ShapeModOsc2", ",", "OSC: ShapeModOsc3", ",", "OSC: TuneModMode", ",", "OSC: EcoWave1", ",", "OSC: EcoWave2", ",", "OSC: RingmodPulse", ",", "OSC: Drift", ",", "OSC: FmModSrc", ",", "OSC: FmModDepth", ",", "OSC: NoiseVolModSrc", ",", "OSC: NoiseVolModDepth", ",", "HPF: Model", ",", "HPF: Frequency", ",", "HPF: Resonance", ",", "HPF: Revision", ",", "HPF: KeyFollow", ",", "HPF: FreqModSrc", ",", "HPF: FreqModDepth", ",", "HPF: Post-HPF Freq", ",", "VCF1: Model", ",", "VCF1: Frequency", ",", "VCF1: Resonance", ",", "VCF1: FreqModSrc", ",", "VCF1: FreqModDepth", ",", "VCF1: FreqMod2Src", ",", "VCF1: FreqMod2Depth", ",", "VCF1: KeyFollow", ",", "VCF1: FilterFM", ",", "VCF1: LadderMode", ",", "VCF1: LadderColor", ",", "VCF1: SlnKyRevision", ",", "VCF1: SvfMode", ",", "VCF1: Feedback", ",", "VCF1: ResModSrc", ",", "VCF1: ResModDepth", ",", "VCF1: FmAmountModSrc", ",", "VCF1: FmAmountModDepth", ",", "VCF1: FeedbackModSrc", ",", "VCF1: FeedbackModDepth", ",", "VCA1: Pan", ",", "VCA1: Volume", ",", "VCA1: VCA", ",", "VCA1: Modulation", ",", "VCA1: ModDepth", ",", "VCA1: PanModulation", ",", "VCA1: PanModDepth", ",", "VCA1: Mode", ",", "VCA1: Offset", ",", "Scope1: Frequency", ",", "Scope1: Scale", ",", "FX1: Module", ",", "Chrs1: Type", ",", "Chrs1: Rate", ",", "Chrs1: Depth", ",", "Chrs1: Wet", ",", "Phase1: Type", ",", "Phase1: Rate", ",", "Phase1: Feedback", ",", "Phase1: Stereo", ",", "Phase1: Sync", ",", "Phase1: Phase", ",", "Phase1: Wet", ",", "Plate1: PreDelay", ",", "Plate1: Diffusion", ",", "Plate1: Damp", ",", "Plate1: Decay", ",", "Plate1: Size", ",", "Plate1: Dry", ",", "Plate1: Wet", ",", "Delay1: Left Delay", ",", "Delay1: Center Delay", ",", "Delay1: Right Delay", ",", "Delay1: Side Vol", ",", "Delay1: Center Vol", ",", "Delay1: Feedback", ",", "Delay1: HP", ",", "Delay1: LP", ",", "Delay1: Dry", ",", "Delay1: Wow", ",", "Rtary1: Mode", ",", "Rtary1: Mix", ",", "Rtary1: Balance", ",", "Rtary1: Drive", ",", "Rtary1: Stereo", ",", "Rtary1: Out", ",", "Rtary1: Slow", ",", "Rtary1: Fast", ",", "Rtary1: RiseTime", ",", "Rtary1: Controller", ",", "FX2: Module", ",", "Chrs2: Type", ",", "Chrs2: Rate", ",", "Chrs2: Depth", ",", "Chrs2: Wet", ",", "Phase2: Type", ",", "Phase2: Rate", ",", "Phase2: Feedback", ",", "Phase2: Stereo", ",", "Phase2: Sync", ",", "Phase2: Phase", ",", "Phase2: Wet", ",", "Plate2: PreDelay", ",", "Plate2: Diffusion", ",", "Plate2: Damp", ",", "Plate2: Decay", ",", "Plate2: Size", ",", "Plate2: Dry", ",", "Plate2: Wet", ",", "Delay2: Left Delay", ",", "Delay2: Center Delay", ",", "Delay2: Right Delay", ",", "Delay2: Side Vol", ",", "Delay2: Center Vol", ",", "Delay2: Feedback", ",", "Delay2: HP", ",", "Delay2: LP", ",", "Delay2: Dry", ",", "Delay2: Wow", ",", "Rtary2: Mode", ",", "Rtary2: Mix", ",", "Rtary2: Balance", ",", "Rtary2: Drive", ",", "Rtary2: Stereo", ",", "Rtary2: Out", ",", "Rtary2: Slow", ",", "Rtary2: Fast", ",", "Rtary2: RiseTime", ",", "Rtary2: Controller", ",", "CLK: Multiply", ",", "CLK: TimeBase", ",", "CLK: Swing", ",", "ARP: Direction", ",", "ARP: Octaves", ",", "ARP: Multiply", ",", "ARP: Restart", ",", "ARP: OnOff", ",", "OSC: DigitalShape2", ",", "OSC: DigitalShape3", ",", "OSC: DigitalShape4", ",", "VCF1: ShapeMix", ",", "VCF1: ShapeModSrc", ",", "VCF1: ShapeModDepth", ",", "VCF1: UhbieBandpass", ",", "ARP: Order", ",", "LFO1: Polarity", ",", "LFO2: Polarity", ",", "Phase1: Depth", ",", "Phase1: Center", ",", "Phase2: Depth", ",", "Phase2: Center", ",", "OSC: DigitalType1", ",", "OSC: DigitalType2", ",", "OSC: DigitalAntiAlias" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 748.333374, 640.067627, 100.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-159",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 270.666626, 177.797119, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-158",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 270.666626, 205.797119, 87.0, 22.0 ],
					"style" : "",
					"text" : "s param_bang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-157",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 645.333374, 595.5, 85.0, 22.0 ],
					"style" : "",
					"text" : "r param_bang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-156",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 645.333374, 457.5, 85.0, 22.0 ],
					"style" : "",
					"text" : "r param_bang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-155",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 645.333374, 486.0, 37.0, 22.0 ],
					"style" : "",
					"text" : "set 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-153",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 645.333374, 628.5, 37.0, 22.0 ],
					"style" : "",
					"text" : "clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-149",
					"items" : [ 0, "main: Output", ",", 1, "main: Active #FX1", ",", 2, "main: Active #FX2", ",", 3, "PCore: LED Colour", ",", 4, "VCC: Voices", ",", 5, "VCC: Voice Stack", ",", 6, "VCC: Mode", ",", 7, "VCC: GlideMode", ",", 8, "VCC: Glide", ",", 9, "VCC: Glide2", ",", 10, "VCC: GlideRange", ",", 11, "VCC: PitchBend Up", ",", 12, "VCC: PitchBend Down", ",", 13, "VCC: TuningMode", ",", 14, "VCC: Transpose", ",", 15, "VCC: FineTuneCents", ",", 16, "VCC: Note Priority", ",", 17, "VCC: MultiCore", ",", 18, "OPT: Accuracy", ",", 19, "OPT: OfflineAcc", ",", 20, "OPT: TuneSlop", ",", 21, "OPT: CutoffSlop", ",", 22, "OPT: GlideSlop", ",", 23, "OPT: PWSlop", ",", 24, "OPT: EnvrateSlop", ",", 25, "OPT: V1Mod", ",", 26, "OPT: V2Mod", ",", 27, "OPT: V3Mod", ",", 28, "OPT: V4Mod", ",", 29, "OPT: V5Mod", ",", 30, "OPT: V6Mod", ",", 31, "OPT: V7Mod", ",", 32, "OPT: V8Mod", ",", 33, "ENV1: Attack", ",", 34, "ENV1: Decay", ",", 35, "ENV1: Sustain", ",", 36, "ENV1: Release", ",", 37, "ENV1: Velocity", ",", 38, "ENV1: Model", ",", 39, "ENV1: Trigger", ",", 40, "ENV1: Quantise", ",", 41, "ENV1: Curve", ",", 42, "ENV1: Release On", ",", 43, "ENV1: KeyFollow", ",", 44, "ENV2: Attack", ",", 45, "ENV2: Decay", ",", 46, "ENV2: Sustain", ",", 47, "ENV2: Release", ",", 48, "ENV2: Velocity", ",", 49, "ENV2: Model", ",", 50, "ENV2: Trigger", ",", 51, "ENV2: Quantise", ",", 52, "ENV2: Curve", ",", 53, "ENV2: Release On", ",", 54, "ENV2: KeyFollow", ",", 55, "LFO1: Sync", ",", 56, "LFO1: Restart", ",", 57, "LFO1: Waveform", ",", 58, "LFO1: Phase", ",", 59, "LFO1: Delay", ",", 60, "LFO1: DepthMod Src1", ",", 61, "LFO1: DepthMod Dpt1", ",", 62, "LFO1: Rate", ",", 63, "LFO1: FreqMod Src1", ",", 64, "LFO1: FreqMod Dpt", ",", 65, "LFO2: Sync", ",", 66, "LFO2: Restart", ",", 67, "LFO2: Waveform", ",", 68, "LFO2: Phase", ",", 69, "LFO2: Delay", ",", 70, "LFO2: DepthMod Src1", ",", 71, "LFO2: DepthMod Dpt1", ",", 72, "LFO2: Rate", ",", 73, "LFO2: FreqMod Src1", ",", 74, "LFO2: FreqMod Dpt", ",", 75, "MOD: Quantise", ",", 76, "MOD: Slew Rate", ",", 77, "MOD: RectifySource", ",", 78, "MOD: InvertSource", ",", 79, "MOD: QuantiseSource", ",", 80, "MOD: LagSource", ",", 81, "MOD: AddSource1", ",", 82, "MOD: AddSource2", ",", 83, "MOD: MulSource1", ",", 84, "MOD: MulSource2", ",", 85, "OSC: Model", ",", 86, "OSC: Tune1", ",", 87, "OSC: Tune2", ",", 88, "OSC: Tune3", ",", 89, "OSC: Vibrato", ",", 90, "OSC: PulseWidth", ",", 91, "OSC: Shape1", ",", 92, "OSC: Shape2", ",", 93, "OSC: Shape3", ",", 94, "OSC: FM", ",", 95, "OSC: Sync2", ",", 96, "OSC: OscMix", ",", 97, "OSC: Volume1", ",", 98, "OSC: Volume2", ",", 99, "OSC: Volume3", ",", 100, "OSC: PulseShape", ",", 101, "OSC: SawShape", ",", 102, "OSC: SuboscShape", ",", 103, "OSC: Tune1ModSrc", ",", 104, "OSC: Tune1ModDepth", ",", 105, "OSC: Tune2ModSrc", ",", 106, "OSC: Tune2ModDepth", ",", 107, "OSC: PWModSrc", ",", 108, "OSC: PWModDepth", ",", 109, "OSC: ShapeSrc", ",", 110, "OSC: ShapeDepth", ",", 111, "OSC: Triangle1On", ",", 112, "OSC: Sine2On", ",", 113, "OSC: Saw1On", ",", 114, "OSC: Pwm1On", ",", 115, "OSC: Triangle2On", ",", 116, "OSC: Saw2On", ",", 117, "OSC: Pulse2On", ",", 118, "OSC: PWM2On", ",", 119, "OSC: Noise1On", ",", 120, "OSC: ShapeModel", ",", 121, "OSC: Sync3", ",", 122, "OSC: NoiseVol", ",", 123, "OSC: NoiseColor", ",", 124, "OSC: TuneModOsc1", ",", 125, "OSC: TuneModOsc2", ",", 126, "OSC: TuneModOsc3", ",", 127, "OSC: ShapeModOsc1", ",", 128, "OSC: ShapeModOsc2", ",", 129, "OSC: ShapeModOsc3", ",", 130, "OSC: TuneModMode", ",", 131, "OSC: EcoWave1", ",", 132, "OSC: EcoWave2", ",", 133, "OSC: RingmodPulse", ",", 134, "OSC: Drift", ",", 135, "OSC: FmModSrc", ",", 136, "OSC: FmModDepth", ",", 137, "OSC: NoiseVolModSrc", ",", 138, "OSC: NoiseVolModDepth", ",", 139, "HPF: Model", ",", 140, "HPF: Frequency", ",", 141, "HPF: Resonance", ",", 142, "HPF: Revision", ",", 143, "HPF: KeyFollow", ",", 144, "HPF: FreqModSrc", ",", 145, "HPF: FreqModDepth", ",", 146, "HPF: Post-HPF Freq", ",", 147, "VCF1: Model", ",", 148, "VCF1: Frequency", ",", 149, "VCF1: Resonance", ",", 150, "VCF1: FreqModSrc", ",", 151, "VCF1: FreqModDepth", ",", 152, "VCF1: FreqMod2Src", ",", 153, "VCF1: FreqMod2Depth", ",", 154, "VCF1: KeyFollow", ",", 155, "VCF1: FilterFM", ",", 156, "VCF1: LadderMode", ",", 157, "VCF1: LadderColor", ",", 158, "VCF1: SlnKyRevision", ",", 159, "VCF1: SvfMode", ",", 160, "VCF1: Feedback", ",", 161, "VCF1: ResModSrc", ",", 162, "VCF1: ResModDepth", ",", 163, "VCF1: FmAmountModSrc", ",", 164, "VCF1: FmAmountModDepth", ",", 165, "VCF1: FeedbackModSrc", ",", 166, "VCF1: FeedbackModDepth", ",", 167, "VCA1: Pan", ",", 168, "VCA1: Volume", ",", 169, "VCA1: VCA", ",", 170, "VCA1: Modulation", ",", 171, "VCA1: ModDepth", ",", 172, "VCA1: PanModulation", ",", 173, "VCA1: PanModDepth", ",", 174, "VCA1: Mode", ",", 175, "VCA1: Offset", ",", 176, "Scope1: Frequency", ",", 177, "Scope1: Scale", ",", 178, "FX1: Module", ",", 179, "Chrs1: Type", ",", 180, "Chrs1: Rate", ",", 181, "Chrs1: Depth", ",", 182, "Chrs1: Wet", ",", 183, "Phase1: Type", ",", 184, "Phase1: Rate", ",", 185, "Phase1: Feedback", ",", 186, "Phase1: Stereo", ",", 187, "Phase1: Sync", ",", 188, "Phase1: Phase", ",", 189, "Phase1: Wet", ",", 190, "Plate1: PreDelay", ",", 191, "Plate1: Diffusion", ",", 192, "Plate1: Damp", ",", 193, "Plate1: Decay", ",", 194, "Plate1: Size", ",", 195, "Plate1: Dry", ",", 196, "Plate1: Wet", ",", 197, "Delay1: Left Delay", ",", 198, "Delay1: Center Delay", ",", 199, "Delay1: Right Delay", ",", 200, "Delay1: Side Vol", ",", 201, "Delay1: Center Vol", ",", 202, "Delay1: Feedback", ",", 203, "Delay1: HP", ",", 204, "Delay1: LP", ",", 205, "Delay1: Dry", ",", 206, "Delay1: Wow", ",", 207, "Rtary1: Mode", ",", 208, "Rtary1: Mix", ",", 209, "Rtary1: Balance", ",", 210, "Rtary1: Drive", ",", 211, "Rtary1: Stereo", ",", 212, "Rtary1: Out", ",", 213, "Rtary1: Slow", ",", 214, "Rtary1: Fast", ",", 215, "Rtary1: RiseTime", ",", 216, "Rtary1: Controller", ",", 217, "FX2: Module", ",", 218, "Chrs2: Type", ",", 219, "Chrs2: Rate", ",", 220, "Chrs2: Depth", ",", 221, "Chrs2: Wet", ",", 222, "Phase2: Type", ",", 223, "Phase2: Rate", ",", 224, "Phase2: Feedback", ",", 225, "Phase2: Stereo", ",", 226, "Phase2: Sync", ",", 227, "Phase2: Phase", ",", 228, "Phase2: Wet", ",", 229, "Plate2: PreDelay", ",", 230, "Plate2: Diffusion", ",", 231, "Plate2: Damp", ",", 232, "Plate2: Decay", ",", 233, "Plate2: Size", ",", 234, "Plate2: Dry", ",", 235, "Plate2: Wet", ",", 236, "Delay2: Left Delay", ",", 237, "Delay2: Center Delay", ",", 238, "Delay2: Right Delay", ",", 239, "Delay2: Side Vol", ",", 240, "Delay2: Center Vol", ",", 241, "Delay2: Feedback", ",", 242, "Delay2: HP", ",", 243, "Delay2: LP", ",", 244, "Delay2: Dry", ",", 245, "Delay2: Wow", ",", 246, "Rtary2: Mode", ",", 247, "Rtary2: Mix", ",", 248, "Rtary2: Balance", ",", 249, "Rtary2: Drive", ",", 250, "Rtary2: Stereo", ",", 251, "Rtary2: Out", ",", 252, "Rtary2: Slow", ",", 253, "Rtary2: Fast", ",", 254, "Rtary2: RiseTime", ",", 255, "Rtary2: Controller", ",", 256, "CLK: Multiply", ",", 257, "CLK: TimeBase", ",", 258, "CLK: Swing", ",", 259, "ARP: Direction", ",", 260, "ARP: Octaves", ",", 261, "ARP: Multiply", ",", 262, "ARP: Restart", ",", 263, "ARP: OnOff", ",", 264, "OSC: DigitalShape2", ",", 265, "OSC: DigitalShape3", ",", 266, "OSC: DigitalShape4", ",", 267, "VCF1: ShapeMix", ",", 268, "VCF1: ShapeModSrc", ",", 269, "VCF1: ShapeModDepth", ",", 270, "VCF1: UhbieBandpass", ",", 271, "ARP: Order", ",", 272, "LFO1: Polarity", ",", 273, "LFO2: Polarity", ",", 274, "Phase1: Depth", ",", 275, "Phase1: Center", ",", 276, "Phase2: Depth", ",", 277, "Phase2: Center", ",", 278, "OSC: DigitalType1", ",", 279, "OSC: DigitalType2", ",", 280, "OSC: DigitalAntiAlias" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 531.333374, 673.067627, 100.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-145",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 608.333374, 486.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-141",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 695.833374, 549.567627, 50.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-140",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 531.333374, 590.067627, 55.0, 22.0 ],
					"style" : "",
					"text" : "prepend"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-139",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 608.333374, 549.567627, 74.0, 22.0 ],
					"style" : "",
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-138",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 608.333374, 515.5, 61.0, 22.0 ],
					"style" : "",
					"text" : "counter"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-137",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 531.333374, 544.0, 59.0, 22.0 ],
					"style" : "",
					"text" : "tosymbol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-135",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 531.333374, 628.5, 98.0, 22.0 ],
					"style" : "",
					"text" : "prepend append"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-133",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 531.333374, 449.5, 96.0, 22.0 ],
					"style" : "",
					"text" : "r #0_vst_names"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-129",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.833374, 839.0, 51.0, 22.0 ],
					"style" : "",
					"text" : "s vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-130",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 652.833374, 808.0, 164.0, 22.0 ],
					"style" : "",
					"text" : "prepend \"VCF1: Resonance\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-131",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 652.833374, 745.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.dial[1]",
							"parameter_shortname" : "live.dial",
							"parameter_type" : 0,
							"parameter_mmax" : 1.0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "live.dial[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-128",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 465.0, 839.0, 71.0, 22.0 ],
					"style" : "",
					"text" : "s #0_vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-127",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 465.0, 808.0, 160.0, 22.0 ],
					"style" : "",
					"text" : "prepend \"VCF1: Frequency\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-126",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 465.0, 745.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.dial",
							"parameter_shortname" : "live.dial",
							"parameter_type" : 0,
							"parameter_mmax" : 1.0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "live.dial"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-123",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1155.0, 337.0, 95.0, 22.0 ],
					"style" : "",
					"text" : "r #0_vst_values"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-122",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 106.666626, 380.5, 97.0, 22.0 ],
					"style" : "",
					"text" : "s #0_vst_values"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-121",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 81.666626, 410.5, 98.0, 22.0 ],
					"style" : "",
					"text" : "s #0_vst_names"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-115",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 588.5, 236.932373, 51.0, 22.0 ],
					"style" : "",
					"text" : "s vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-114",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 243.333252, 233.364746, 71.0, 22.0 ],
					"style" : "",
					"text" : "s #0_vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-112",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1032.5, 318.0, 71.0, 22.0 ],
					"style" : "",
					"text" : "s #0_vst_in"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-113",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1032.5, 283.0, 50.0, 23.0 ],
					"style" : "",
					"text" : "wclose"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-111",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 928.5, 318.0, 71.0, 22.0 ],
					"style" : "",
					"text" : "s #0_vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-108",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1103.666626, 218.0, 71.0, 22.0 ],
					"style" : "",
					"text" : "s #0_vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-107",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 31.666626, 239.5, 69.0, 22.0 ],
					"style" : "",
					"text" : "r #0_vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-106",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 388.333374, 177.797119, 71.0, 22.0 ],
					"style" : "",
					"text" : "s #0_vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-104",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1103.666626, 187.0, 81.0, 22.0 ],
					"style" : "",
					"text" : "prepend plug"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-103",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 1103.666626, 155.432373, 69.0, 22.0 ],
					"style" : "",
					"text" : "opendialog"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-102",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 388.333374, 118.364746, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-91",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 131.666626, 349.067627, 130.0, 23.0 ],
					"style" : "",
					"text" : "print midi @popup 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-95",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 388.333374, 148.364746, 147.0, 23.0 ],
					"style" : "",
					"text" : "plug ~/Desktop/Diva.vst"
				}

			}
, 			{
				"box" : 				{
					"autosave" : 1,
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-96",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 8,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "", "list", "int", "", "", "" ],
					"patching_rect" : [ 31.666626, 272.067627, 194.0, 23.0 ],
					"save" : [ "#N", "vst~", "loaduniqueid", 0, ";" ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_invisible" : 1,
							"parameter_longname" : "vst~[2]",
							"parameter_shortname" : "vst~[2]",
							"parameter_type" : 3
						}

					}
,
					"saved_object_attributes" : 					{
						"annotation_name" : "",
						"parameter_enable" : 1
					}
,
					"snapshot" : 					{
						"filetype" : "C74Snapshot",
						"version" : 2,
						"minorversion" : 0,
						"name" : "snapshotlist",
						"origin" : "vst~",
						"type" : "list",
						"subtype" : "Undefined",
						"embed" : 1,
						"snapshot" : 						{
							"pluginname" : "Diva.vst",
							"plugindisplayname" : "Diva",
							"pluginsavedname" : "~/Desktop/Diva.vst",
							"pluginsaveduniqueid" : 0,
							"version" : 1,
							"isbank" : 0,
							"isbase64" : 1,
							"blob" : "5645.CMlaKA....fQPMDZ....APTZVEF...P.....AjlaoQWZgwVZ5UF..........................TQzunBPMUFcgofBAUGcn8lb5nvI00BZkchBJnxKJnvHA0TODklcgovHVUlby0SLv.CLwnvHE4FYoEla8vVZzQGakovHt0VOxPiBiz1b831atUlBiz1b8zzajcEZrovHsMWOPkFcig1UJLRay0yPzIGaAovHsMWOCQmbrIjBiz1b8bTXzUlBiz1b8XUYr81XoQWdJLRay0CTxU1byUmbkovHsMWOKUVdF8Far81cJLRay0yRkkmQuwFaucmLJLRay0SPrQWYx4VXzUlBiz1b8HUXtQ1asovHsMWOSQWXislUuk1XkovHsMWOV8VZiUVSgAmBiz1b8Tja1EiBiz1b8Tja1IiBiz1b8vjQOEiBiz1b8vjQOIiBiz1b8HUYiQWZlkmBiz1b8jja1UlbzovHsMWOQUWXtQmBiz1b8vTXmovHsMWOAQFYkImBiz1b8zTcrQWZvwVdJLha10iLJLRa10yQgQWYJLRa10SQtYWLJLxXs0SagklaJLzXOAWO2PiKv.iBiXDVwzCLJLhQXISOwnvHi0VOPMzaxUlBSITXyUVOznvT2klam0CLt.CLJLEUxk1Y8DiBPM0atcVOvn.TF8Faj0CLJ.kQowVY8DiBGYTZrUVOxnvQSMVXrUVOvnvPnwTX40CLJLUcxI2S8DiBRUlc8bCMxHiBLUDQ8.iKv.iBPEzQE0CLJ.UXmU1bO4VOvnvPuIWYN0yLJLEaoMVY8PiBUkzWuAWOvnPSoQVZA0SMJzTZjkFT8XiBDYzarQVO2nvPzIGaA0iLJLDcxwlP8DSLJLxXs0yPLsjBMUGaz0SLv.iKv.iBBE1bk0iLJL0co41Y8.iKv.iBSQmboMFc8DiBiLVa8DjTPo.QoIWOwnvSiQWOwnvPDklc8.iBRMGcxQWOvnvSt8jYl0CLJ7jbjUlb8.iBiLVa8X0PCofUuk1XkMWOznfUuk1Xo41Y8DiBM8FYk0CLJ.0axQWXM0CLJ.0axQWX8fiKv.iBP8lbzElL8.iKv.iBPIUXtcVY8DCLv3BLvn.TB0yLJ.kPD0yMJPjblQWOvnPSTUmaS0CLJzDU04lS8fiBMQUctQUO4n.UxMGb8zRLxnfQTUma8.iKv.iBVMVL8.iKv.iBVMlL8.iKv.iBVM1L8.iKv.iBVMFM8.iKv.iBVMVM8.iKv.iBVMlM8.iKv.iBVM1M8.iKv.iBVMFN8.iKv.iBPIWZuIWOvnPS0MzaxUVOvnvPu4FcE4VOwnfbMcUOv3BLvnfbPcUOv3BLvnvHi0VOOAEUJDzXi0iLJ7jYlEzXi0CLJXULTESOsDCLv3BLvnfUxPUL8zBNtTyMJX0LTESO2XiKv.iBVQCUwzSL33hM4nfU0PUL8zhL43RM4nfU1PUL8DCLv3BLvnfU2PUL8zBMv3BL2nfU3PUL8PiMtfSNJXULTISOwXiK1HiBVICUxziLy3BMznfUyPkL8LiKwjiBVQCUxzSKwLiKwfiBVUCUxzCMv3RNxnfU1PkL8zBM33BLvnfU2PkL8DCMtPSLJXENTISOzDiK1LiBVECUyzSK0biKyfiBVICUyzSKyDiK1DiBVMCUyzSK0XiK4DiBVQCUyzSK4HiKzLiBVUCUyzSK4TiK1XiBVYCUyzSKwXiKyPiBVcCUyzSK1LiK0DiBVgCUyzSK1TiKwPiBTMEauAWOxTiKv.iBTA0azMWOw.iBR4FYC0CLJLzTr8Fb8DiMt.CLJHkajcTOvnvQSw1av0iLz3BLvnfTtQFT8.iBPMEauAWOyLiKv.iBR4FYE0CLJTzTr8Fb8HiMt.CLJXULM8FY8.iKv.iBVISSuQVOv3BLvnfUyzzaj0CLt.CLJXEMM8FY8.iKv.iBVUSSuQVOv3BLvnfU1zzaj0CLt.CLJX0MM8FY8.iKv.iBVgSSuQVOv3BLvn.UxElay0TOvnvPzIGTmUVOvnvHi0VOE4jUwnPPzsVOwTiKv.iBDU1X8LyLtTCLJLUcy0CNv3BLvnfTkwVOyTiKv.iBVUFa8.iKv.iBM8FYkwVOvn.Uxk1Y8.iBQUWXtQWOvnvPxYWY8.iBRUFaO4VOwnvRkkmQrcWOv3BLvnvHi0VOE4jUxnPPzsVOv3BLvn.QkMVOzTiKv.iBSU2b8LiLt.CLJHUYr0yL23BLvnfUkwVO3TiKv.iBM8FYkwVOvn.Uxk1Y8.iBQUWXtQWOvnvPxYWY8.iBRUFaO4VOvnvRkkmQrcWOxPiKv.iBiLVa8vjQOEiBSkmai0SKxn.Uxk1Y8LiBWElck0CLJ.EZyUVOv3BLvn.TuwVXx0CLJPDa40iL13BLvn.QMMUL8DiBD0DQwzSNv3BLvnfTgQWY8DiK1.iBF0zTwzSLJXTSDESOv3hMvnvHi0VOLYzSxnvT441X8zhLJPkbocVOwnvUgYWY8DiBPg1bk0CLt.CLJ.0arElb8.iBDwVd8XCLt.CLJPTSSESOvn.QMQTL8.iKv.iBREFck0CLt.CLJXTSSESOvnfQMQTL8.iKv.iBiLVa8zzSDoPT0Elaz0iLt.CLJLEakcWO0.iKv.iBRMkbi0CLJjzTxMVOvnPTSI2X8.iBLMkbi0SL0nPPwLkbi0iMJDjLSI2X8biBMEyTxMVOvnPSxLkbi0CLJLxXs0ySSMjBM8FYkwVOvn.U04VYwzCLt.CLJPUctUlL8.iKv.iBTUmakMSOv3BLvnfUz8FQ8TCLt.CLJ.0U8TCLt.CLJLEZgAWYwzSMt.CLJLEZgAWYxzSMtHCLJLEZgAWYyzSMt.CLJXTS8.iKv.iBSkmaiISOvnvSyMVSogWOv3BLvnfUuwVL8.iKv.iBV8FaxzSLv.iKv.iBV8FayzCLt.CLJ.0USgFb8.iBSE1cSgFb8DiBSUmXSgFb8.iBT0TLSI2X8DSMJPUSwPDbz0CLt.CLJPUSxLkbi0SL2n.UMICQvQWOv3BLvn.TW0zTxMVOwbiBPcUSDAGc8.iKv.iBSgVLSI2X8DyMJLEZwPDbz0CLt.CLJPkboESOvnvTo4lL8.iBSE1cwzSLJ.0UMESOvn.UxklL8.iBSE1cxzCLJ.0UxzSLJ.0UMISOwnfSuk1bkESOvn.cxk1Tv0SLJLUdtM1L8.iBN8VZyUVOv3BLvnfSuk1bkMTOvn.UMEySt0CLJPUSx7ja8.iBT0zLO4VOvnvTMEySt0CLJLUSx7ja8.iBS0zLO4VOvn.UM01ajUVOynvUgYWYwzSLt.CLJbUX1UlL8DiKv.iBR0DT20VOvn.QxklYz0CMx3BLvnfQsMkbi0CLJXTaDAGc8.iKv.iBN8VZyMkbi0CLJ3zaoMGQvQWOv3BLvnfRvMEbwzSLJnDbSAmL8DiBBAmSuk1bk0SLJH0bzAEZwzCLt.CLJH0bzAEZxzCLt.CLJH0bzAEZyzCLt.CLJPzYzwFUvESOvn.QmQGaSAmL8.iKv.iBDcFcrQEbxzCLJPzYzw1TvMSO0.iKv.iBDcFcrMEbzzCLt.CLJPjSuEDaoEVOvnvHi0VOHAkQJzzajUFa8.iBFIWYw0yLv3BLvnfTkMWOv3BLvnfTkYWOwnvRkk2TiwVOv3BLvnfQMMkbi0SL0nfQMQDbz0CLt.CLJ.kQxUVb8zRLJLxXs0iUCYTLJzzajUFa8.iBFIWYw0CMw3BLvnfTkMWOv3BLvnfQMMkbi0iLwnfQMQDbz0SLx.iKv.iBF0jLSI2X8HiLJXTSxPDbz0CNt.CLJrTY4M0Xr0CMv3BLvnfQF0TOv3BLvn.SM8FYk0CLJvzPuw1ax0SLJL0ZRUlc8DiBSYmYM8FYk0CLJXjXgM1Z8HCLt.CLJHUYyMkbi0CLJHUYyQDbz0CLt.CLJXjYsMkbi0CLJXjYsQDbz0CLt.CLJXjXSI2X8.iBFIFQvQWOv3BLvnPRtQUctUVOwnvTnAWSogWOv3BLvnvTMMkbi0SL2nvTMQDbz0CLt.CLJHDbUIVZk0CLJLxXs0iUCETLJ.UXt0CLt.CLJX0ar0CM33RMvnfUCETOwnPSuQ1TxMVOwXiBM8FYDAGc8zRLz3BLvn.Tg41TxMVOvn.Tg4FQvQWOx3BLvnPSuQVY8.iBOYlYyUFc8zBLtDiLJLxXs0yTi8FbkEiBM8FYk0CLJXlbw0SK03BLvnvbiwVOw3BLvnPRtAWOvnvXyESOv3BLvnvXyISOv3BLvn.bi0CLJzzaj0CLJLxXs0iQXEiBM8FY0wVY8bxPn8lb0MWLmnvHi0VOCglbyEiBTkGbk0SLJHUXzUVOwHiKv.iBDUFbzgVOwTiK0.iBWUFc8biLtTCLJLxXs0CTnE1bkEiBTkGbk0CLJHUXzUVO0.iKv.iBFITOv3BLvnvTzUlbk8VOv3BLvnvT441X8.iBPgVXyUVOv3BLvnvUkQWOw.CLt.CLJPTYvQGZ8DCLv3BLvnvPk4FckIWO0.iKv.iBiLVa8.EagQWYwn.TxUVOv3BLvn.QoYlY8DCLv3BLvn.Qg0Fb8fCLt.CLJPTYiEVd8TCLt.CLJLUZ5UVOwTCLt.CLJPjb40SNv3BLvnvUkQWOz.iKv.iBiLVa8PTYrEVdwn.SDUFa8HiKv.iBCQTYr0CMt.CLJHEQkwVOz3BLvnvTV8Fa8HCLt.CLJLjUuwVOv3BLvnfQkUFYB0iL03BLvn.RP0CLt.CLJvDT8DCLv3BLvn.QxkWOw.CLt.CLJb0a20SMv3BLvnvHi0VORQWXxkWLJzzajUVOvnPSogWOw.CLt.CLJHTXr0SMv3BLvn.Qxklck0CLt.CLJLEckIWYu0SLv.iKv.iBOUGc8.iKv.iBSw1a20yLv3BLvnfQgMGc8fSMt.CLJHEUo0VY8TCLt.CLJLzatQWOvnvHi0VOFgkLJzzajUGak0yIPwVXzUlLmnvHi0VOCglbyIiBTkGbk0CLJHUXzUVO0.iKv.iBDUFbzgVO0.iKv.iBWUFc8DCLv3BLvnvHi0VOPgVXyUlLJPUdvUVOvnfTgQWY8TCLt.CLJXjP8.iKv.iBSQWYxU1a8.iKv.iBSkmai0CLJ.EZgMWY8.iKv.iBWUFc8DCLv3BLvn.QkAGcn0SLv.iKv.iBCUlazUlb8TCLt.CLJLxXs0CTrEFckIiBPIWY8.iKv.iBDklYl0SNx3BLvn.Qg0Fb8fiMt.CLJPTYiEVd8PSMt.CLJLUZ5UVOwTCMt.CLJPjb40CNv3BLvnvUkQWOw.iKv.iBiLVa8PTYrEVdxn.SDUFa8HiKv.iBCQTYr0CMt.CLJHEQkwVOz3BLvnvTV8Fa8HCLt.CLJLjUuwVOv3BLvnfQkUFYB0iL03BLvn.RP0CLt.CLJvDT8DCLv3BLvn.QxkWOw.CLt.CLJb0a20SMv3BLvnvHi0VORQWXxkmLJzzajUVOvnPSogWOw.CLt.CLJHTXr0SMv3BLvn.Qxklck0CLt.CLJLEckIWYu0SLv.iKv.iBOUGc8.iKv.iBSw1a20yLv3BLvnfQgMGc8fSMt.CLJHEUo0VY8TCLt.CLJLzatQWOvnfBJnvKu.xTkMFco8lafX1axARcmwVdfL1asAmbkM2bkQFHhklagIWdfPTXzElBu7BHD8jSmPEHT8TUCgDHTgTRSofBjPBIjHSLv.iB+bFYmMVYtUlX5DVXgEVaoU1X5DVXgIVXgEVX5TVXgEVXgEVX5DVXgEVZgQFb5DVXgEVXgUVX5DVXgEVYgUVX5nPXgEVXoEVYgoSXgEVXqEVYgoSXgEVXsEVYgoSXgoSYioSYhoSaioyYhoyYpoSahoCaooSYgoyXgoyXtoyYloyYJblNmklNm0lNnElNnMlNnYlNsklNuElNgUlNhUlNi8lNlMlNmUlNmAWHwMWP2TVaZcFYE8TPxLCMRsjSLETLwDmBzEzMFc1aFgVYFUzSFg1ZLckSjMFTAQSNwQWP2DSbzEzMiYlXp0FbiYlamAmXqs1XnYjapYVXKg1ahQFbuM1ZjofYqwVZkw1XgsFTkAGajI1ZUolZh0lanMlXL4FahslZj4lXMMFatIVXiQFZkYVXt4VZnAmQpA2avgUXl0jagsFaJ.2ahAGbg4lYMY1ZtslQkoVTl81PwUUPw.iRtgVPwD2bAcSYooEZnUTTYojYjcFYEEULAICMyDWZgETLvTVYFglBmUzRYwTSEI0SnU1RZc1aK8jVEk0UNQ1XPETLvLSbyEjL1LSbzEDMyTmc2gWd5ETLTkTbAE1XAUScAMSc1cGd4ofdAECUzMTPwHVXCETLJMTPwPVXCETLIMTPwXVXCETLmE1PAECTCETLoE1PAESZoMTPwnVXCETLpk1PAEyZgMTPJDyZoMTPwvVXCETLHMTPwzVXCETLSMTPw3VXCETLtk1PAECUCETLuk1PAECbgMTPw.WZCEjLBETLUITPwDVZBEjBwDVaBETLhElPAEiUBETLhklPAEiXsITPwnjPAEyXkITPwLVZBETLi0lPAECYgITPwPVYBETLjklPAECYsITPwnPRBETLkUlPAESYoITPwTVaBETLlElPAEiYkITPwXVZBETLl0lPAEyYgITPwjkPAEiSBETLOITPw.kPAECZkITPJDCZoITPwfVaBETLoElPAESZiITPwjVYBETLoclPAESZoITPwj1ZBETLo0lPAESZuITPwnVXBETLpMlPAEiZkIjBAEiZmITPwnVZBETLpslPAEiZsITPwn1aBETLqElPAEyZiITPwrVYBETLqclPAEyZoITPwr1ZBETLq0lPAEyZuofPAECagITPwv1XBETLrUlPAECamITPwfjPAECaqITPwvVaBETLr8lPAESagITPwPjPAESakITPwz1YBIWPwz1ZJHTPwzVaBETLs8lPAEiagITPw31XBETLtUlPAEiamITPw3VZBETLtslPAEiasITPw31aBETLTITPw71XBETLuUlBBETLuclPAEyaoITPw71ZBETLu0lPAEyauITPw.WXBETLvMlPAECbkITPw.2YBETLvklPAECbqITPw.WaBETLvovaBE2bAMScAEyTDgjXuElZGETLpklPhAWZlolYCgERu01Qxs1akglRDYVaoAGYrIDQvYVZkMjXuklYrw1PvY1XJjVYskTYn8lXXcjUq81XjITPwjDQjAmZg0zPqcVZiM1YBU1YoIFSDolausFbsczXnsVZmQFQV4laHQzYgYVYrAmBD81ZHk1XG81XgsFZuQjZqUlZoMFQgwlXnglXGI2UpIVZqQTZoYFbns1QvwFYrkVXBIUYjw1XCETLSQzXiolZlofZC0lYqoVZucTamYjXnIDYmgjXrIDYjUTYuQDYmQlXQMjUWw1YCQlat8VQD41ajwFYjMjXiQEZmQTYpIVXoUlPJfVZSI1aBMEah81asEFbkslZEMTXjMFavQ1PiMVUnkFQkclYtoVZG4TZmg1ZDImZvwVakclPh0lXrs1aDs1ZiQlBlc1PR01YXQjTDEEQxEzLwzSLwXCMwDiB..."
						}
,
						"snapshotlist" : 						{
							"current_snapshot" : 0,
							"entries" : [ 								{
									"filetype" : "C74Snapshot",
									"version" : 2,
									"minorversion" : 0,
									"name" : "Diva",
									"origin" : "Diva.vst",
									"type" : "VST",
									"subtype" : "Instrument",
									"embed" : 0,
									"snapshot" : 									{
										"pluginname" : "Diva.vst",
										"plugindisplayname" : "Diva",
										"pluginsavedname" : "~/Desktop/Diva.vst",
										"pluginsaveduniqueid" : 0,
										"version" : 1,
										"isbank" : 0,
										"isbase64" : 1,
										"blob" : "5645.CMlaKA....fQPMDZ....APTZVEF...P.....AjlaoQWZgwVZ5UF..........................TQzunBPMUFcgofBAUGcn8lb5nvI00BZkchBJnxKJnvHA0TODklcgovHVUlby0SLv.CLwnvHE4FYoEla8vVZzQGakovHt0VOxPiBiz1b831atUlBiz1b8zzajcEZrovHsMWOPkFcig1UJLRay0yPzIGaAovHsMWOCQmbrIjBiz1b8bTXzUlBiz1b8XUYr81XoQWdJLRay0CTxU1byUmbkovHsMWOKUVdF8Far81cJLRay0yRkkmQuwFaucmLJLRay0SPrQWYx4VXzUlBiz1b8HUXtQ1asovHsMWOSQWXislUuk1XkovHsMWOV8VZiUVSgAmBiz1b8Tja1EiBiz1b8Tja1IiBiz1b8vjQOEiBiz1b8vjQOIiBiz1b8HUYiQWZlkmBiz1b8jja1UlbzovHsMWOQUWXtQmBiz1b8vTXmovHsMWOAQFYkImBiz1b8zTcrQWZvwVdJLha10iLJLRa10yQgQWYJLRa10SQtYWLJLxXs0SagklaJLzXOAWO2PiKv.iBiXDVwzCLJLhQXISOwnvHi0VOPMzaxUlBSITXyUVOznvT2klam0CLt.CLJLEUxk1Y8DiBPM0atcVOvn.TF8Faj0CLJ.kQowVY8DiBGYTZrUVOxnvQSMVXrUVOvnvPnwTX40CLJLUcxI2S8DiBRUlc8bCMxHiBLUDQ8.iKv.iBPEzQE0CLJ.UXmU1bO4VOvnvPuIWYN0yLJLEaoMVY8PiBUkzWuAWOvnPSoQVZA0SMJzTZjkFT8XiBDYzarQVO2nvPzIGaA0iLJLDcxwlP8DSLJLxXs0yPLsjBMUGaz0SLv.iKv.iBBE1bk0iLJL0co41Y8.iKv.iBSQmboMFc8DiBiLVa8DjTPo.QoIWOwnvSiQWOwnvPDklc8.iBRMGcxQWOvnvSt8jYl0CLJ7jbjUlb8.iBiLVa8X0PCofUuk1XkMWOznfUuk1Xo41Y8DiBM8FYk0CLJ.0axQWXM0CLJ.0axQWX8fiKv.iBP8lbzElL8.iKv.iBPIUXtcVY8DCLv3BLvn.TB0yLJ.kPD0yMJPjblQWOvnPSTUmaS0CLJzDU04lS8fiBMQUctQUO4n.UxMGb8zRLxnfQTUma8.iKv.iBVMVL8.iKv.iBVMlL8.iKv.iBVM1L8.iKv.iBVMFM8.iKv.iBVMVM8.iKv.iBVMlM8.iKv.iBVM1M8.iKv.iBVMFN8.iKv.iBPIWZuIWOvnPS0MzaxUVOvnvPu4FcE4VOwnfbMcUOv3BLvnfbPcUOv3BLvnvHi0VOOAEUJDzXi0iLJ7jYlEzXi0CLJXULTESOsDCLv3BLvnfUxPUL8zBNtTyMJX0LTESO2XiKv.iBVQCUwzSL33hM4nfU0PUL8zhL43RM4nfU1PUL8DCLv3BLvnfU2PUL8zBMv3BL2nfU3PUL8PiMtfSNJXULTISOwXiK1HiBVICUxziLy3BMznfUyPkL8LiKwjiBVQCUxzSKwLiKwfiBVUCUxzCMv3RNxnfU1PkL8zBM33BLvnfU2PkL8DCMtPSLJXENTISOzDiK1LiBVECUyzSK0biKyfiBVICUyzSKyDiK1DiBVMCUyzSK0XiK4DiBVQCUyzSK4HiKzLiBVUCUyzSK4TiK1XiBVYCUyzSKwXiKyPiBVcCUyzSK1LiK0DiBVgCUyzSK1TiKwPiBTMEauAWOxTiKv.iBTA0azMWOw.iBR4FYC0CLJLzTr8Fb8DiMt.CLJHkajcTOvnvQSw1av0iLz3BLvnfTtQFT8.iBPMEauAWOyLiKv.iBR4FYE0CLJTzTr8Fb8HiMt.CLJXULM8FY8.iKv.iBVISSuQVOv3BLvnfUyzzaj0CLt.CLJXEMM8FY8.iKv.iBVUSSuQVOv3BLvnfU1zzaj0CLt.CLJX0MM8FY8.iKv.iBVgSSuQVOv3BLvn.UxElay0TOvnvPzIGTmUVOvnvHi0VOE4jUwnPPzsVOwTiKv.iBDU1X8LyLtTCLJLUcy0CNv3BLvnfTkwVOyTiKv.iBVUFa8.iKv.iBM8FYkwVOvn.Uxk1Y8.iBQUWXtQWOvnvPxYWY8.iBRUFaO4VOwnvRkkmQrcWOv3BLvnvHi0VOE4jUxnPPzsVOv3BLvn.QkMVOzTiKv.iBSU2b8LiLt.CLJHUYr0yL23BLvnfUkwVO3TiKv.iBM8FYkwVOvn.Uxk1Y8.iBQUWXtQWOvnvPxYWY8.iBRUFaO4VOvnvRkkmQrcWOxPiKv.iBiLVa8vjQOEiBSkmai0SKxn.Uxk1Y8LiBWElck0CLJ.EZyUVOv3BLvn.TuwVXx0CLJPDa40iL13BLvn.QMMUL8DiBD0DQwzSNv3BLvnfTgQWY8DiK1.iBF0zTwzSLJXTSDESOv3hMvnvHi0VOLYzSxnvT441X8zhLJPkbocVOwnvUgYWY8DiBPg1bk0CLt.CLJ.0arElb8.iBDwVd8XCLt.CLJPTSSESOvn.QMQTL8.iKv.iBREFck0CLt.CLJXTSSESOvnfQMQTL8.iKv.iBiLVa8zzSDoPT0Elaz0iLt.CLJLEakcWO0.iKv.iBRMkbi0CLJjzTxMVOvnPTSI2X8.iBLMkbi0SL0nPPwLkbi0iMJDjLSI2X8biBMEyTxMVOvnPSxLkbi0CLJLxXs0ySSMjBM8FYkwVOvn.U04VYwzCLt.CLJPUctUlL8.iKv.iBTUmakMSOv3BLvnfUz8FQ8TCLt.CLJ.0U8TCLt.CLJLEZgAWYwzSMt.CLJLEZgAWYxzSMtHCLJLEZgAWYyzSMt.CLJXTS8.iKv.iBSkmaiISOvnvSyMVSogWOv3BLvnfUuwVL8.iKv.iBV8FaxzSLv.iKv.iBV8FayzCLt.CLJ.0USgFb8.iBSE1cSgFb8DiBSUmXSgFb8.iBT0TLSI2X8DSMJPUSwPDbz0CLt.CLJPUSxLkbi0SL2n.UMICQvQWOv3BLvn.TW0zTxMVOwbiBPcUSDAGc8.iKv.iBSgVLSI2X8DyMJLEZwPDbz0CLt.CLJPkboESOvnvTo4lL8.iBSE1cwzSLJ.0UMESOvn.UxklL8.iBSE1cxzCLJ.0UxzSLJ.0UMISOwnfSuk1bkESOvn.cxk1Tv0SLJLUdtM1L8.iBN8VZyUVOv3BLvnfSuk1bkMTOvn.UMEySt0CLJPUSx7ja8.iBT0zLO4VOvnvTMEySt0CLJLUSx7ja8.iBS0zLO4VOvn.UM01ajUVOynvUgYWYwzSLt.CLJbUX1UlL8DiKv.iBR0DT20VOvn.QxklYz0CMx3BLvnfQsMkbi0CLJXTaDAGc8.iKv.iBN8VZyMkbi0CLJ3zaoMGQvQWOv3BLvnfRvMEbwzSLJnDbSAmL8DiBBAmSuk1bk0SLJH0bzAEZwzCLt.CLJH0bzAEZxzCLt.CLJH0bzAEZyzCLt.CLJPzYzwFUvESOvn.QmQGaSAmL8.iKv.iBDcFcrQEbxzCLJPzYzw1TvMSO0.iKv.iBDcFcrMEbzzCLt.CLJPjSuEDaoEVOvnvHi0VOHAkQJzzajUFa8.iBFIWYw0yLv3BLvnfTkMWOv3BLvnfTkYWOwnvRkk2TiwVOv3BLvnfQMMkbi0SL0nfQMQDbz0CLt.CLJ.kQxUVb8zRLJLxXs0iUCYTLJzzajUFa8.iBFIWYw0CMw3BLvnfTkMWOv3BLvnfQMMkbi0iLwnfQMQDbz0SLx.iKv.iBF0jLSI2X8HiLJXTSxPDbz0CNt.CLJrTY4M0Xr0CMv3BLvnfQF0TOv3BLvn.SM8FYk0CLJvzPuw1ax0SLJL0ZRUlc8DiBSYmYM8FYk0CLJXjXgM1Z8HCLt.CLJHUYyMkbi0CLJHUYyQDbz0CLt.CLJXjYsMkbi0CLJXjYsQDbz0CLt.CLJXjXSI2X8.iBFIFQvQWOv3BLvnPRtQUctUVOwnvTnAWSogWOv3BLvnvTMMkbi0SL2nvTMQDbz0CLt.CLJHDbUIVZk0CLJLxXs0iUCETLJ.UXt0CLt.CLJX0ar0CM33RMvnfUCETOwnPSuQ1TxMVOwXiBM8FYDAGc8zRLz3BLvn.Tg41TxMVOvn.Tg4FQvQWOx3BLvnPSuQVY8.iBOYlYyUFc8zBLtDiLJLxXs0yTi8FbkEiBM8FYk0CLJXlbw0SK03BLvnvbiwVOw3BLvnPRtAWOvnvXyESOv3BLvnvXyISOv3BLvn.bi0CLJzzaj0CLJLxXs0iQXEiBM8FY0wVY8bxPn8lb0MWLmnvHi0VOCglbyEiBTkGbk0SLJHUXzUVOwHiKv.iBDUFbzgVOwTiK0.iBWUFc8biLtTCLJLxXs0CTnE1bkEiBTkGbk0CLJHUXzUVO0.iKv.iBFITOv3BLvnvTzUlbk8VOv3BLvnvT441X8.iBPgVXyUVOv3BLvnvUkQWOw.CLt.CLJPTYvQGZ8DCLv3BLvnvPk4FckIWO0.iKv.iBiLVa8.EagQWYwn.TxUVOv3BLvn.QoYlY8DCLv3BLvn.Qg0Fb8fCLt.CLJPTYiEVd8TCLt.CLJLUZ5UVOwTCLt.CLJPjb40SNv3BLvnvUkQWOz.iKv.iBiLVa8PTYrEVdwn.SDUFa8HiKv.iBCQTYr0CMt.CLJHEQkwVOz3BLvnvTV8Fa8HCLt.CLJLjUuwVOv3BLvnfQkUFYB0iL03BLvn.RP0CLt.CLJvDT8DCLv3BLvn.QxkWOw.CLt.CLJb0a20SMv3BLvnvHi0VORQWXxkWLJzzajUVOvnPSogWOw.CLt.CLJHTXr0SMv3BLvn.Qxklck0CLt.CLJLEckIWYu0SLv.iKv.iBOUGc8.iKv.iBSw1a20yLv3BLvnfQgMGc8fSMt.CLJHEUo0VY8TCLt.CLJLzatQWOvnvHi0VOFgkLJzzajUGak0yIPwVXzUlLmnvHi0VOCglbyIiBTkGbk0CLJHUXzUVO0.iKv.iBDUFbzgVO0.iKv.iBWUFc8DCLv3BLvnvHi0VOPgVXyUlLJPUdvUVOvnfTgQWY8TCLt.CLJXjP8.iKv.iBSQWYxU1a8.iKv.iBSkmai0CLJ.EZgMWY8.iKv.iBWUFc8DCLv3BLvn.QkAGcn0SLv.iKv.iBCUlazUlb8TCLt.CLJLxXs0CTrEFckIiBPIWY8.iKv.iBDklYl0SNx3BLvn.Qg0Fb8fiMt.CLJPTYiEVd8PSMt.CLJLUZ5UVOwTCMt.CLJPjb40CNv3BLvnvUkQWOw.iKv.iBiLVa8PTYrEVdxn.SDUFa8HiKv.iBCQTYr0CMt.CLJHEQkwVOz3BLvnvTV8Fa8HCLt.CLJLjUuwVOv3BLvnfQkUFYB0iL03BLvn.RP0CLt.CLJvDT8DCLv3BLvn.QxkWOw.CLt.CLJb0a20SMv3BLvnvHi0VORQWXxkmLJzzajUVOvnPSogWOw.CLt.CLJHTXr0SMv3BLvn.Qxklck0CLt.CLJLEckIWYu0SLv.iKv.iBOUGc8.iKv.iBSw1a20yLv3BLvnfQgMGc8fSMt.CLJHEUo0VY8TCLt.CLJLzatQWOvnfBJnvKu.xTkMFco8lafX1axARcmwVdfL1asAmbkM2bkQFHhklagIWdfPTXzElBu7BHD8jSmPEHT8TUCgDHTgTRSofBjPBIjHSLv.iB+bFYmMVYtUlX5DVXgEVaoU1X5DVXgIVXgEVX5TVXgEVXgEVX5DVXgEVZgQFb5DVXgEVXgUVX5DVXgEVYgUVX5nPXgEVXoEVYgoSXgEVXqEVYgoSXgEVXsEVYgoSXgoSYioSYhoSaioyYhoyYpoSahoCaooSYgoyXgoyXtoyYloyYJblNmklNm0lNnElNnMlNnYlNsklNuElNgUlNhUlNi8lNlMlNmUlNmAWHwMWP2TVaZcFYE8TPxLCMRsjSLETLwDmBzEzMFc1aFgVYFUzSFg1ZLckSjMFTAQSNwQWP2DSbzEzMiYlXp0FbiYlamAmXqs1XnYjapYVXKg1ahQFbuM1ZjofYqwVZkw1XgsFTkAGajI1ZUolZh0lanMlXL4FahslZj4lXMMFatIVXiQFZkYVXt4VZnAmQpA2avgUXl0jagsFaJ.2ahAGbg4lYMY1ZtslQkoVTl81PwUUPw.iRtgVPwD2bAcSYooEZnUTTYojYjcFYEEULAICMyDWZgETLvTVYFglBmUzRYwTSEI0SnU1RZc1aK8jVEk0UNQ1XPETLvLSbyEjL1LSbzEDMyTmc2gWd5ETLTkTbAE1XAUScAMSc1cGd4ofdAECUzMTPwHVXCETLJMTPwPVXCETLIMTPwXVXCETLmE1PAECTCETLoE1PAESZoMTPwnVXCETLpk1PAEyZgMTPJDyZoMTPwvVXCETLHMTPwzVXCETLSMTPw3VXCETLtk1PAECUCETLuk1PAECbgMTPw.WZCEjLBETLUITPwDVZBEjBwDVaBETLhElPAEiUBETLhklPAEiXsITPwnjPAEyXkITPwLVZBETLi0lPAECYgITPwPVYBETLjklPAECYsITPwnPRBETLkUlPAESYoITPwTVaBETLlElPAEiYkITPwXVZBETLl0lPAEyYgITPwjkPAEiSBETLOITPw.kPAECZkITPJDCZoITPwfVaBETLoElPAESZiITPwjVYBETLoclPAESZoITPwj1ZBETLo0lPAESZuITPwnVXBETLpMlPAEiZkIjBAEiZmITPwnVZBETLpslPAEiZsITPwn1aBETLqElPAEyZiITPwrVYBETLqclPAEyZoITPwr1ZBETLq0lPAEyZuofPAECagITPwv1XBETLrUlPAECamITPwfjPAECaqITPwvVaBETLr8lPAESagITPwPjPAESakITPwz1YBIWPwz1ZJHTPwzVaBETLs8lPAEiagITPw31XBETLtUlPAEiamITPw3VZBETLtslPAEiasITPw31aBETLTITPw71XBETLuUlBBETLuclPAEyaoITPw71ZBETLu0lPAEyauITPw.WXBETLvMlPAECbkITPw.2YBETLvklPAECbqITPw.WaBETLvovaBE2bAMScAEyTDgjXuElZGETLpklPhAWZlolYCgERu01Qxs1akglRDYVaoAGYrIDQvYVZkMjXuklYrw1PvY1XJjVYskTYn8lXXcjUq81XjITPwjDQjAmZg0zPqcVZiM1YBU1YoIFSDolausFbsczXnsVZmQFQV4laHQzYgYVYrAmBD81ZHk1XG81XgsFZuQjZqUlZoMFQgwlXnglXGI2UpIVZqQTZoYFbns1QvwFYrkVXBIUYjw1XCETLSQzXiolZlofZC0lYqoVZucTamYjXnIDYmgjXrIDYjUTYuQDYmQlXQMjUWw1YCQlat8VQD41ajwFYjMjXiQEZmQTYpIVXoUlPJfVZSI1aBMEah81asEFbkslZEMTXjMFavQ1PiMVUnkFQkclYtoVZG4TZmg1ZDImZvwVakclPh0lXrs1aDs1ZiQlBlc1PR01YXQjTDEEQxEzLwzSLwXCMwDiB..."
									}
,
									"fileref" : 									{
										"name" : "Diva",
										"filename" : "Diva.maxsnap",
										"filepath" : "~/Documents/Max 7/Snapshots",
										"filepos" : -1,
										"snapshotfileid" : "0180eba688c971cb91ada8bbed192774"
									}

								}
 ]
						}

					}
,
					"style" : "",
					"text" : "vst~",
					"varname" : "vst~[2]",
					"viewvisibility" : 0
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-67",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 693.0, 54.932373, 138.0, 25.0 ],
					"style" : "",
					"text" : "list program names"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-68",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 611.0, 57.932373, 75.0, 23.0 ],
					"style" : "",
					"text" : "pgmnames"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-69",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 611.0, 197.932373, 78.0, 23.0 ],
					"style" : "",
					"text" : "set BigGain"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-72",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 611.0, 162.932373, 75.0, 23.0 ],
					"style" : "",
					"text" : "write"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-73",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 611.0, 127.932373, 75.0, 23.0 ],
					"style" : "",
					"text" : "read"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-74",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 611.0, 92.932373, 29.5, 23.0 ],
					"style" : "",
					"text" : "2"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-81",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 693.0, 89.932373, 260.0, 25.0 ],
					"style" : "",
					"text" : "change program (1 is the first program)"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-82",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 693.0, 124.932373, 134.0, 25.0 ],
					"style" : "",
					"text" : "load program files"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-83",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 693.0, 159.932373, 137.0, 25.0 ],
					"style" : "",
					"text" : "save program files"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-84",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 693.0, 194.932373, 126.0, 25.0 ],
					"style" : "",
					"text" : "rename program"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 156.5, 318.0, 91.0, 23.0 ],
					"style" : "",
					"text" : "s #0_vst_pgm"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"format" : 6,
					"id" : "obj-63",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1265.0, 400.0, 54.0, 23.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-64",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1155.0, 400.0, 53.0, 23.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "float" ],
					"patching_rect" : [ 1155.0, 370.0, 129.0, 23.0 ],
					"style" : "",
					"text" : "unpack 0 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-70",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1150.0, 425.0, 105.0, 21.0 ],
					"style" : "",
					"text" : "parameter index"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-71",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1260.0, 425.0, 72.0, 21.0 ],
					"style" : "",
					"text" : "value (0-1)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-59",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 243.0, 148.364746, 59.0, 23.0 ],
					"style" : "",
					"text" : "params"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-30",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 928.5, 283.0, 70.0, 23.0 ],
					"style" : "",
					"text" : "open"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-167", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"midpoints" : [ 397.833374, 145.39856, 252.5, 145.39856 ],
					"order" : 2,
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"midpoints" : [ 397.833374, 144.047119, 373.333374, 144.047119 ],
					"order" : 1,
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"order" : 0,
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-104", 0 ],
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-108", 0 ],
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"source" : [ "obj-11", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 0 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 0 ],
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-129", 0 ],
					"source" : [ "obj-130", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-130", 0 ],
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 0 ],
					"order" : 1,
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-145", 0 ],
					"order" : 0,
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 0 ],
					"source" : [ "obj-135", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"order" : 1,
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-163", 0 ],
					"order" : 0,
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-139", 0 ],
					"order" : 1,
					"source" : [ "obj-138", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-141", 0 ],
					"order" : 0,
					"source" : [ "obj-138", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"source" : [ "obj-139", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-135", 0 ],
					"source" : [ "obj-140", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-138", 0 ],
					"source" : [ "obj-145", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 0 ],
					"source" : [ "obj-153", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-138", 0 ],
					"source" : [ "obj-155", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-155", 0 ],
					"source" : [ "obj-156", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-153", 0 ],
					"source" : [ "obj-157", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-158", 0 ],
					"source" : [ "obj-159", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-161", 0 ],
					"source" : [ "obj-160", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 0 ],
					"source" : [ "obj-161", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"order" : 0,
					"source" : [ "obj-162", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-164", 0 ],
					"order" : 1,
					"source" : [ "obj-162", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 0 ],
					"source" : [ "obj-163", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-166", 0 ],
					"source" : [ "obj-164", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-165", 0 ],
					"source" : [ "obj-166", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-166", 0 ],
					"source" : [ "obj-167", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"order" : 1,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 1 ],
					"order" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-114", 0 ],
					"midpoints" : [ 252.5, 188.932373, 252.833252, 188.932373 ],
					"order" : 1,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 0 ],
					"order" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"source" : [ "obj-65", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 0 ],
					"midpoints" : [ 620.5, 82.932373, 598.0, 82.932373, 598.0, 229.932373, 598.0, 229.932373 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 0 ],
					"midpoints" : [ 620.5, 223.932373, 604.0, 223.932373, 604.0, 229.932373, 598.0, 229.932373 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 0 ],
					"midpoints" : [ 620.5, 187.932373, 598.0, 187.932373, 598.0, 229.932373, 598.0, 229.932373 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 0 ],
					"midpoints" : [ 620.5, 151.932373, 598.0, 151.932373, 598.0, 229.932373, 598.0, 229.932373 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 0 ],
					"midpoints" : [ 620.5, 118.932373, 598.0, 118.932373, 598.0, 229.932373, 598.0, 229.932373 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"midpoints" : [ 373.333374, 266.432373, 41.166626, 266.432373 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-106", 0 ],
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"source" : [ "obj-96", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"source" : [ "obj-96", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"order" : 0,
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"midpoints" : [ 66.166626, 445.783814, 93.166626, 445.783814 ],
					"order" : 1,
					"source" : [ "obj-96", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"midpoints" : [ 41.166626, 447.783814, 4.166626, 447.783814 ],
					"order" : 1,
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"midpoints" : [ 66.166626, 445.783814, 141.166626, 445.783814 ],
					"order" : 0,
					"source" : [ "obj-96", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"midpoints" : [ 166.166626, 296.5, 166.0, 296.5 ],
					"source" : [ "obj-96", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"source" : [ "obj-96", 4 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-131" : [ "live.dial[1]", "live.dial", 0 ],
			"obj-10" : [ "live.text[1]", "live.text", 0 ],
			"obj-9" : [ "live.text", "live.text", 0 ],
			"obj-167" : [ "live.dial[2]", "live.dial", 0 ],
			"obj-96" : [ "vst~[2]", "vst~[2]", 0 ],
			"obj-126" : [ "live.dial", "live.dial", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "Diva.maxsnap",
				"bootpath" : "~/Documents/Max 7/Snapshots",
				"patcherrelativepath" : "../../../../../Documents/Max 7/Snapshots",
				"type" : "mx@s",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "AudioStatus_Menu",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "color",
						"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
						"color1" : [ 0.454902, 0.462745, 0.482353, 0.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "ksliderWhite",
				"default" : 				{
					"color" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBlue-1",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-1",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "numberGold-1",
				"default" : 				{
					"accentcolor" : [ 0.764706, 0.592157, 0.101961, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
