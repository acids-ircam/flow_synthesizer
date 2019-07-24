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
		"rect" : [ 34.0, 79.0, 1228.0, 937.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
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
					"id" : "obj-77",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1486.0, 238.5, 37.0, 22.0 ],
					"style" : "",
					"text" : "clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1328.0, 242.5, 37.0, 22.0 ],
					"style" : "",
					"text" : "clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1152.0, 242.5, 37.0, 22.0 ],
					"style" : "",
					"text" : "clear"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.792157, 0.219608, 0.133333, 1.0 ],
					"id" : "obj-28",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1565.416748, 319.5, 93.166626, 25.5 ],
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
					"text" : "Import model",
					"varname" : "live.text"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2080.0, 622.0, 100.0, 22.0 ],
					"style" : "",
					"text" : "print params_set"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-27",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 120.166626, 236.932373, 121.0, 23.0 ],
					"style" : "",
					"text" : "read diva_reset.fxb"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 334.0, 1451.0, 66.0, 22.0 ],
					"style" : "",
					"text" : "s mubu_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 15.0, 1762.923096, 64.0, 22.0 ],
					"style" : "",
					"text" : "r mubu_in"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-2",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 244.0, 1443.0, 56.0, 23.0 ],
					"sig" : 0.0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-303",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 217.5, 1222.923096, 71.0, 22.0 ],
					"style" : "",
					"text" : "r mubu_out"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-302",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 217.5, 1278.846191, 76.0, 22.0 ],
					"style" : "",
					"text" : "unpack 0. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-301",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 98.0, 1922.0, 73.0, 22.0 ],
					"style" : "",
					"text" : "s mubu_out"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-300",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 217.5, 1251.846191, 75.0, 22.0 ],
					"style" : "",
					"text" : "route region"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-299",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 334.0, 1392.0, 83.0, 22.0 ],
					"style" : "",
					"text" : "snapshot~ 30"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-298",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 334.0, 1420.0, 91.0, 22.0 ],
					"style" : "",
					"text" : "prepend cursor"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-297",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 23.0, 1922.0, 63.0, 22.0 ],
					"style" : "",
					"text" : "print yeup"
				}

			}
, 			{
				"box" : 				{
					"channels" : 1,
					"clip_size" : 1,
					"display_range" : [ -70.0, 30.0 ],
					"focusbordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"id" : "obj-296",
					"maxclass" : "live.gain~",
					"numinlets" : 1,
					"numoutlets" : 4,
					"orientation" : 1,
					"outlettype" : [ "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 86.0, 1409.0, 137.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 78.0, 190.0, 21.0 ],
					"prototypename" : "M4L.live.gain~.H.extended",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "Audio[1]",
							"parameter_shortname" : "Audio",
							"parameter_type" : 0,
							"parameter_mmin" : -70.0,
							"parameter_mmax" : 30.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_unitstyle" : 4,
							"parameter_speedlim" : 0.0
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"slidercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"textcolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"trioncolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"varname" : "Audio[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-295",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 86.0, 1447.5, 45.0, 45.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-294",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 86.0, 1159.923096, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-286",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 153.0, 1249.923096, 36.0, 22.0 ],
					"style" : "",
					"text" : "sel 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-287",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 153.0, 1280.923096, 20.0, 20.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-288",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 153.0, 1308.923096, 43.0, 22.0 ],
					"style" : "",
					"text" : "float 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-292",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 85.25, 1306.923096, 46.0, 23.0 ],
					"style" : "",
					"text" : "sig~ 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-293",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 86.0, 1348.0, 177.0, 23.0 ],
					"saved_object_attributes" : 					{
						"basictuning" : 440,
						"followglobaltempo" : 0,
						"formantcorrection" : 0,
						"loopend" : [ 0.0, "ms" ],
						"loopstart" : [ 0.0, "ms" ],
						"mode" : "basic",
						"originallength" : [ 0.0, "ticks" ],
						"originaltempo" : 120.0,
						"phase" : [ 0.0, "ticks" ],
						"pitchcorrection" : 0,
						"quality" : "basic",
						"timestretch" : [ 0 ]
					}
,
					"style" : "",
					"text" : "groove~ flow_target @loop 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-283",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 524.0, 1946.0, 70.0, 22.0 ],
					"style" : "",
					"text" : "s to_server"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-284",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 524.0, 1916.0, 101.0, 22.0 ],
					"style" : "",
					"text" : "prepend /encode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-282",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 354.5, 1680.0, 70.0, 22.0 ],
					"style" : "",
					"text" : "s to_server"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-281",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 354.5, 1650.0, 101.0, 22.0 ],
					"style" : "",
					"text" : "prepend /encode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-280",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 280.0, 1762.923096, 37.0, 22.0 ],
					"style" : "",
					"text" : "clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-279",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 212.5, 1718.0, 65.0, 22.0 ],
					"style" : "",
					"text" : "r start_rec"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-276",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 750.25, 1629.0, 67.0, 22.0 ],
					"style" : "",
					"text" : "s start_rec"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-275",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 580.5, 1859.0, 114.0, 22.0 ],
					"style" : "",
					"text" : "record~ flow_target"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-270",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 439.0, 1392.0, 52.0, 22.0 ],
					"style" : "",
					"text" : "record~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-264",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1120.5, 1650.0, 20.0, 20.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-265",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1120.5, 1686.0, 50.0, 21.0 ],
					"style" : "",
					"text" : "local $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-266",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1167.5, 1754.0, 34.0, 19.0 ],
					"style" : "",
					"text" : "Ch 2"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.407843, 0.407843, 0.407843, 1.0 ],
					"coldcolor" : [ 0.0, 0.658824, 0.0, 1.0 ],
					"id" : "obj-17",
					"maxclass" : "meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 1167.5, 1833.0, 15.0, 62.0 ],
					"style" : "",
					"tepidcolor" : [ 0.6, 0.729412, 0.0, 1.0 ],
					"warmcolor" : [ 0.85098, 0.85098, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.407843, 0.407843, 0.407843, 1.0 ],
					"coldcolor" : [ 0.0, 0.658824, 0.0, 1.0 ],
					"id" : "obj-267",
					"maxclass" : "meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 1193.5, 1833.0, 15.0, 62.0 ],
					"style" : "",
					"tepidcolor" : [ 0.6, 0.729412, 0.0, 1.0 ],
					"warmcolor" : [ 0.85098, 0.85098, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-268",
					"local" : 1,
					"maxclass" : "ezadc~",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 1120.5, 1719.0, 45.0, 45.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-269",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1086.5, 1754.0, 34.0, 19.0 ],
					"style" : "",
					"text" : "Ch 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-170",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 655.5, 1455.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "int"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-239",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 524.0, 1687.0, 48.0, 22.0 ],
					"style" : "",
					"text" : "route 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-240",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 524.0, 1751.0, 116.0, 49.0 ],
					"style" : "",
					"text" : "/tmp/recorded.target.2019-07-23.16h30_33.aif"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-241",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 732.25, 1780.0, 85.0, 22.0 ],
					"style" : "",
					"text" : "prepend open"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-242",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 724.0, 1398.0, 55.0, 22.0 ],
					"style" : "",
					"text" : "route 32"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-243",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 724.0, 1424.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-244",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 655.5, 1424.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-245",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 524.0, 1718.0, 20.0, 20.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-246",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 732.25, 1589.5, 20.0, 20.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-247",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 732.25, 1557.0, 48.0, 22.0 ],
					"style" : "",
					"text" : "route 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-248",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 732.25, 1724.0, 59.0, 22.0 ],
					"style" : "",
					"text" : "tosymbol"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-249",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 732.25, 1751.0, 103.0, 22.0 ],
					"style" : "",
					"text" : "sprintf %s_%d.aif"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-250",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 732.25, 1659.0, 94.0, 22.0 ],
					"style" : "",
					"text" : "counter 0 0 512"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-101",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 732.25, 1687.0, 164.0, 35.0 ],
					"style" : "",
					"text" : "/tmp/recorded.target.2019-07-24.1h30"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-251",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 877.25, 1611.0, 80.0, 22.0 ],
					"style" : "",
					"text" : "buddy 3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-252",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 877.25, 1638.0, 269.0, 22.0 ],
					"style" : "",
					"text" : "sprintf /tmp/recorded.target.%d-0%d-%d.%dh%d"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-253",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "int", "int" ],
					"patching_rect" : [ 877.25, 1584.0, 79.0, 22.0 ],
					"style" : "",
					"text" : "unpack 0 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-254",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 877.25, 1501.5, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-255",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "int", "int" ],
					"patching_rect" : [ 1045.25, 1611.0, 103.0, 22.0 ],
					"style" : "",
					"text" : "unpack 0 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-256",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 926.25, 1532.0, 33.0, 22.0 ],
					"style" : "",
					"text" : "time"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-257",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 877.25, 1532.0, 34.0, 22.0 ],
					"style" : "",
					"text" : "date"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-258",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "list", "list", "int" ],
					"patching_rect" : [ 877.25, 1561.0, 270.0, 22.0 ],
					"style" : "",
					"text" : "date"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-259",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 706.75, 1859.0, 71.0, 22.0 ],
					"style" : "",
					"text" : "sfrecord~ 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-260",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 655.5, 1398.0, 55.0, 22.0 ],
					"style" : "",
					"text" : "route 32"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-132",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 4,
					"outlettype" : [ "int", "int", "int", "int" ],
					"patching_rect" : [ 724.0, 1372.0, 59.5, 22.0 ],
					"style" : "",
					"text" : "keyup"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-261",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 4,
					"outlettype" : [ "int", "int", "int", "int" ],
					"patching_rect" : [ 655.5, 1372.0, 59.5, 22.0 ],
					"style" : "",
					"text" : "key"
				}

			}
, 			{
				"box" : 				{
					"clickedimage" : 1,
					"hint" : "Record target",
					"id" : "obj-262",
					"maxclass" : "pictctrl",
					"mode" : 1,
					"name" : "button.record.png",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 580.5, 1557.0, 33.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 269.0, 31.0, 17.0, 17.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-236",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 342.0, 1911.0, 103.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"externalfiles" : 1
					}
,
					"style" : "",
					"text" : "mubu flow_target"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-235",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 98.0, 1762.923096, 97.0, 22.0 ],
					"style" : "",
					"text" : "refer flow_target"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-233",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 342.0, 1883.100586, 110.0, 22.0 ],
					"style" : "",
					"text" : "buffer~ flow_target"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-231",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 212.5, 1762.923096, 49.0, 22.0 ],
					"style" : "",
					"text" : "clearall"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-228",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 98.0, 1718.0, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-227",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 364.0, 1833.0, 82.0, 22.0 ],
					"style" : "",
					"text" : "prepend read"
				}

			}
, 			{
				"box" : 				{
					"alignviewbounds" : 1,
					"autobounds" : 1,
					"autoupdate" : 120.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"bufferchooser_bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"bufferchooser_fgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bufferchooser_position" : 1,
					"bufferchooser_shape" : "buttons",
					"bufferchooser_size" : 12,
					"bufferchooser_visible" : 0,
					"cursor_color" : [ 1.0, 1.0, 1.0, 1.0 ],
					"cursor_followmouse" : 0,
					"cursor_position" : -1.0,
					"cursor_shape" : "bar",
					"cursor_size" : 3,
					"cursor_visible" : 1,
					"domain_bounds" : [ 0.0, 1.0 ],
					"domainruler_bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"domainruler_fgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"domainruler_grid" : 0,
					"domainruler_position" : 0,
					"domainruler_size" : 15,
					"domainruler_unit" : 0,
					"domainruler_visible" : 0,
					"domainscrollbar_color" : [ 1.0, 1.0, 1.0, 1.0 ],
					"domainscrollbar_size" : 10,
					"domainscrollbar_visible" : 0,
					"embed" : 0,
					"externalfiles" : 1,
					"id" : "obj-223",
					"layout" : 0,
					"maxclass" : "imubu",
					"name" : "flow_target",
					"numinlets" : 1,
					"numoutlets" : 1,
					"opacity" : 0.0,
					"opacityprogressive" : 1,
					"orientation" : 0,
					"outlettype" : [ "" ],
					"outputkeys" : 0,
					"outputmouse" : 0,
					"outputselection" : 0,
					"outputtimeselection" : 0,
					"outputvalues" : 0,
					"patching_rect" : [ 98.0, 1818.899414, 215.5, 82.201172 ],
					"presentation" : 1,
					"presentation_rect" : [ 210.642456, 55.969357, 230.715149, 111.950928 ],
					"rangeruler_grid" : 0,
					"rangeruler_size" : 35,
					"rangeruler_visible" : 0,
					"region_bounds" : [ 0.0, 0.0 ],
					"region_color" : [ 0.8, 0.7, 0.7, 1.0 ],
					"region_visible" : 1,
					"split_color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"split_size" : 2,
					"split_visible" : 1,
					"tabs_position" : 0,
					"tabs_size" : 20,
					"tabs_visible" : 0,
					"toolbar_bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"toolbar_position" : 2,
					"toolbar_size" : 22,
					"toolbar_visible" : 1,
					"useplaceholders" : 1,
					"windresize" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-218",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1880.0, 581.0, 29.5, 22.0 ],
					"style" : "",
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-219",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1880.0, 552.0, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-220",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1880.0, 674.0, 50.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-221",
					"maxclass" : "dial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1880.0, 621.0, 40.0, 40.0 ],
					"size" : 32.0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-217",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1804.0, 581.0, 29.5, 22.0 ],
					"style" : "",
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-212",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1804.0, 552.0, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-211",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1804.0, 674.0, 50.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-210",
					"maxclass" : "dial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1804.0, 621.0, 40.0, 40.0 ],
					"size" : 32.0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-209",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2011.0, 621.0, 51.0, 22.0 ],
					"style" : "",
					"text" : "s vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-207",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 2011.0, 545.0, 49.0, 22.0 ],
					"style" : "",
					"text" : "zl iter 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-206",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 2011.0, 508.0, 85.0, 22.0 ],
					"style" : "",
					"text" : "route /params"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-205",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 1664.0, 667.0, 47.0, 22.0 ],
					"style" : "",
					"text" : "/ 1000."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-204",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 1599.0, 667.0, 47.0, 22.0 ],
					"style" : "",
					"text" : "/ 1000."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-203",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1172.5, 547.0, 87.0, 22.0 ],
					"style" : "",
					"text" : "print to_server"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-202",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1518.5, 327.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 1518.5, 394.0, 130.0, 22.0 ],
					"style" : "",
					"text" : "conformpath max boot"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-200",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 1518.5, 361.0, 69.0, 22.0 ],
					"style" : "",
					"text" : "opendialog"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-201",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1518.5, 425.0, 63.0, 22.0 ],
					"style" : "",
					"text" : "/model $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-199",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1166.0, 475.5, 70.0, 22.0 ],
					"style" : "",
					"text" : "s to_server"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-198",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1599.0, 773.5, 70.0, 22.0 ],
					"style" : "",
					"text" : "s to_server"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-197",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1599.0, 738.5, 101.0, 22.0 ],
					"style" : "",
					"text" : "prepend /decode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-196",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1276.0, 480.0, 68.0, 22.0 ],
					"style" : "",
					"text" : "r to_server"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-195",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1599.0, 706.5, 83.0, 22.0 ],
					"style" : "",
					"text" : "pack 0. 0. 0 0"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-193",
					"maxclass" : "rbfi",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 2006.75, 706.5, 200.0, 200.0 ],
					"spaces" : [ "space", 0 ],
					"varname" : "rbfi",
					"xmax" : 3.0,
					"xmin" : -3.0,
					"ymax" : -3.0,
					"ymin" : 3.0
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bottomvalue" : -3000,
					"color" : [ 0.941176, 0.690196, 0.196078, 1.0 ],
					"elementcolor" : [ 0.792157, 0.219608, 0.133333, 1.0 ],
					"id" : "obj-192",
					"invisiblebkgnd" : 1,
					"leftvalue" : -3000,
					"maxclass" : "pictslider",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1599.0, 466.5, 185.0, 175.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 460.0, 54.15638, 182.0, 175.343628 ],
					"rightvalue" : 3000,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "pictslider",
							"parameter_shortname" : "pictslider",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"topvalue" : 3000,
					"varname" : "pictslider"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-187",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1381.0, 201.0, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-188",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1381.0, 296.0, 98.0, 22.0 ],
					"style" : "",
					"text" : "prepend append"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-189",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1381.0, 269.432373, 49.0, 22.0 ],
					"style" : "",
					"text" : "zl iter 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-190",
					"items" : [ 1, ",", 2, ",", 4 ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1381.0, 337.0, 100.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-191",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1381.0, 238.5, 37.0, 22.0 ],
					"style" : "",
					"text" : "1 2 4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-186",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1166.0, 380.0, 87.0, 22.0 ],
					"style" : "",
					"text" : "pak flow mel 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-184",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1203.0, 201.0, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-180",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1203.0, 300.0, 98.0, 22.0 ],
					"style" : "",
					"text" : "prepend append"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-181",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1203.0, 273.432373, 49.0, 22.0 ],
					"style" : "",
					"text" : "zl iter 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-182",
					"items" : [ "mel", ",", "mfcc", ",", "mel_mfcc" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1203.0, 337.0, 100.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-183",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1203.0, 242.5, 113.0, 22.0 ],
					"style" : "",
					"text" : "mel mfcc mel_mfcc"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-179",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1055.0, 201.0, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-178",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1166.0, 411.0, 117.0, 22.0 ],
					"style" : "",
					"text" : "prepend /set_model"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-176",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1055.0, 300.0, 98.0, 22.0 ],
					"style" : "",
					"text" : "prepend append"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-175",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1055.0, 273.432373, 49.0, 22.0 ],
					"style" : "",
					"text" : "zl iter 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-174",
					"items" : [ "wae", ",", "vae", ",", "flow" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1055.0, 337.0, 100.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-172",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1055.0, 242.5, 80.0, 22.0 ],
					"style" : "",
					"text" : "wae vae flow"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-152",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 2139.5, 543.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-154",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2139.5, 449.0, 92.0, 22.0 ],
					"style" : "",
					"text" : "r #0-port_out"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-168",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2139.5, 488.0, 124.0, 22.0 ],
					"style" : "",
					"text" : "udpreceive 1235 flow"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-146",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1834.0, 508.0, 87.0, 22.0 ],
					"style" : "",
					"text" : "print server_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-134",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1939.5, 508.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-136",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1834.0, 420.0, 92.0, 22.0 ],
					"style" : "",
					"text" : "r #0-port_out"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-142",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1834.0, 459.0, 99.0, 22.0 ],
					"style" : "",
					"text" : "udpreceive 1235"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-94",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1482.0, 508.0, 37.0, 22.0 ],
					"style" : "",
					"text" : "/stop"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-116",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1381.0, 508.0, 84.0, 22.0 ],
					"style" : "",
					"text" : "r #0-port_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-118",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1301.0, 508.0, 70.0, 22.0 ],
					"style" : "",
					"text" : "r #0-host"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-119",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1276.0, 547.0, 162.0, 22.0 ],
					"style" : "",
					"text" : "udpsend localhost 1234 flow"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1888.25, 239.432373, 33.0, 22.0 ],
					"style" : "",
					"text" : "front"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1888.25, 273.432373, 67.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1779.0, 273.432373, 94.0, 22.0 ],
					"style" : "",
					"text" : "s #0-port_out"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1779.0, 250.432373, 48.0, 22.0 ],
					"style" : "",
					"text" : "port $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-62",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1614.25, 182.432373, 150.0, 20.0 ],
					"style" : "",
					"text" : "Options"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1673.0, 273.432373, 86.0, 22.0 ],
					"style" : "",
					"text" : "s #0-port_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1578.25, 273.432373, 72.0, 22.0 ],
					"style" : "",
					"text" : "s #0-host"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-88",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1673.0, 250.432373, 48.0, 22.0 ],
					"style" : "",
					"text" : "port $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-90",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1578.25, 246.432373, 50.0, 22.0 ],
					"style" : "",
					"text" : "host $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-92",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1578.25, 181.432373, 30.0, 22.0 ],
					"style" : "",
					"text" : "in 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 1578.25, 211.432373, 181.0, 22.0 ],
					"style" : "",
					"text" : "route host port_in port_out open"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 18.0,
					"id" : "obj-23",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1011.0, 22.0, 216.0, 27.0 ],
					"style" : "",
					"text" : "OSC Server"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1632.0, 89.0, 435.0, 22.0 ],
					"style" : "",
					"text" : "/add_projection dimsort_4d DimensionSliceSort n_components=4 descending=1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1632.0, 128.0, 127.0, 22.0 ],
					"style" : "",
					"text" : "/projection dimsort_4d"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1632.0, 60.0, 511.0, 22.0 ],
					"style" : "",
					"text" : "/add_projection dimsort_4d DimensionSliceSort n_components=4 descending=0 n_points=100"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1327.0, 136.0, 107.0, 22.0 ],
					"style" : "",
					"text" : "/projection pca_4d"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1214.0, 97.0, 250.0, 22.0 ],
					"style" : "",
					"text" : "/add_projection ica_4d ICA n_components=4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1214.0, 136.0, 107.0, 22.0 ],
					"style" : "",
					"text" : "/projection pca_2d"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1214.0, 68.0, 325.0, 22.0 ],
					"style" : "",
					"text" : "/add_projection ica_2d ICA n_components=2 n_points=100"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1011.0, 121.0, 37.0, 22.0 ],
					"style" : "",
					"text" : "/stop"
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
					"id" : "obj-4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 31.666626, 566.0, 216.0, 27.0 ],
					"style" : "",
					"text" : "Automatic player"
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
					"patching_rect" : [ 886.833374, 451.0, 51.0, 22.0 ],
					"style" : "",
					"text" : "s vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-166",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 886.833374, 420.0, 164.0, 22.0 ],
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
					"patching_rect" : [ 886.833374, 357.0, 44.0, 47.0 ],
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
					"patching_rect" : [ 1034.333374, 475.5, 74.0, 22.0 ],
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
					"patching_rect" : [ 789.333374, 621.5, 98.0, 22.0 ],
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
					"patching_rect" : [ 789.333374, 666.067627, 100.0, 22.0 ],
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
					"patching_rect" : [ 331.333374, 66.5, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-158",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 331.333374, 94.5, 87.0, 22.0 ],
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
					"id" : "obj-144",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 217.166626, 742.432373, 24.0, 24.0 ],
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
					"patching_rect" : [ 531.333374, 457.5, 76.0, 22.0 ],
					"style" : "",
					"text" : "r vst_names"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-129",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 695.833374, 431.0, 51.0, 22.0 ],
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
					"patching_rect" : [ 695.833374, 400.0, 164.0, 22.0 ],
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
					"patching_rect" : [ 695.833374, 337.0, 44.0, 47.0 ],
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
					"patching_rect" : [ 518.333374, 431.0, 51.0, 22.0 ],
					"style" : "",
					"text" : "s vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-127",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 518.333374, 400.0, 160.0, 22.0 ],
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
					"patching_rect" : [ 518.333374, 337.0, 44.0, 47.0 ],
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
					"patching_rect" : [ 201.0, 361.5, 75.0, 22.0 ],
					"style" : "",
					"text" : "r vst_values"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-122",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 106.666626, 361.5, 77.0, 22.0 ],
					"style" : "",
					"text" : "s vst_values"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-121",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 81.666626, 391.5, 78.0, 22.0 ],
					"style" : "",
					"text" : "s vst_names"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-120",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 31.666626, 604.432373, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-117",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 31.666626, 640.432373, 71.0, 22.0 ],
					"style" : "",
					"text" : "metro 4000"
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
					"patching_rect" : [ 311.0, 263.5, 51.0, 22.0 ],
					"style" : "",
					"text" : "s vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-112",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 223.5, 195.0, 51.0, 22.0 ],
					"style" : "",
					"text" : "s vst_in"
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
					"patching_rect" : [ 223.5, 160.0, 50.0, 23.0 ],
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
					"patching_rect" : [ 31.666626, 201.5, 51.0, 22.0 ],
					"style" : "",
					"text" : "s vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-110",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 31.666626, 836.932373, 51.0, 22.0 ],
					"style" : "",
					"text" : "s vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-109",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 167.38092, 830.5, 51.0, 22.0 ],
					"style" : "",
					"text" : "s vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-108",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 31.666626, 119.0, 51.0, 22.0 ],
					"style" : "",
					"text" : "s vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-107",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 31.666626, 239.5, 49.0, 22.0 ],
					"style" : "",
					"text" : "r vst_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-106",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 167.38092, 115.864746, 51.0, 22.0 ],
					"style" : "",
					"text" : "s vst_in"
				}

			}
, 			{
				"box" : 				{
					"decodemode" : 1,
					"id" : "obj-105",
					"legend" : "Drop soundfile",
					"maxclass" : "live.drop",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 306.0, 1492.576904, 221.0, 116.923096 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.drop",
							"parameter_shortname" : "live.drop",
							"parameter_type" : 4,
							"parameter_invisible" : 1
						}

					}
,
					"textcolor" : [ 0.792157, 0.219608, 0.133333, 1.0 ],
					"varname" : "live.drop"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-104",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 31.666626, 88.0, 81.0, 22.0 ],
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
					"patching_rect" : [ 31.666626, 56.432373, 69.0, 22.0 ],
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
					"patching_rect" : [ 167.38092, 56.432373, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 167.38092, 757.5, 50.0, 22.0 ],
					"style" : "",
					"text" : "midiin"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 8,
					"outlettype" : [ "", "", "", "int", "int", "", "int", "" ],
					"patching_rect" : [ 167.38092, 792.5, 143.0, 22.0 ],
					"style" : "",
					"text" : "midiparse"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"local" : 1,
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 31.666626, 361.5, 44.0, 44.0 ],
					"style" : ""
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
					"patching_rect" : [ 131.666626, 311.067627, 130.0, 23.0 ],
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
					"patching_rect" : [ 167.38092, 86.432373, 147.0, 23.0 ],
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
							"blob" : "5640.CMlaKA....fQPMDZ....APTZVEF...P.....AjlaoQWZgwVZ5UF..........................TAyunBPMUFcgofBAUGcn8lb5nvI00BZkchBJnxKJnvHA0TODklcgovHVUlby0SLv.CLwnvHE4FYoEla8vVZzQGakovHt0VOxPiBiz1b831atUlBiz1b8zzajcEZrovHsMWOPkFcig1UJLRay0yPzIGaAovHsMWOCQmbrIjBiz1b8bTXzUlBiz1b8XUYr81XoQWdJLRay0CTxU1byUmbkovHsMWOKUVdF8Far81cJLRay0yRkkmQuwFaucmLJLRay0SPrQWYx4VXzUlBiz1b8HUXtQ1asovHsMWOSQWXislUuk1XkovHsMWOV8VZiUVSgAmBiz1b8Tja1EiBiz1b8Tja1IiBiz1b8vjQOEiBiz1b8vjQOIiBiz1b8HUYiQWZlkmBiz1b8jja1UlbzovHsMWOQUWXtQmBiz1b8vTXmovHsMWOAQFYkImBiz1b8zTcrQWZvwVdJLha10iLJLRa10yQgQWYJLRa10SQtYWLJLxXs0SagklaJLzXOAWO2PiKv.iBiXDVwzCLJLhQXISOwnvHi0VOPMzaxUlBSITXyUVOznvT2klam0CLt.CLJLEUxk1Y8DiBPM0atcVOvn.TF8Faj0CLJ.kQowVY8DiBGYTZrUVOxnvQSMVXrUVOvnvPnwTX40CLJLUcxI2S8DiBRUlc8bCMxHiBLUDQ8.iKv.iBPEzQE0CLJ.UXmU1bO4VOvnvPuIWYN0yLJLEaoMVY8PiBUkzWuAWOvnPSoQVZA0SMJzTZjkFT8XiBDYzarQVO2nvPzIGaA0iLJLDcxwlP8DSLJLxXs0yPLsjBMUGaz0SLv.iKv.iBBE1bk0iLJL0co41Y8.iKv.iBSQmboMFc8DiBiLVa8DjTPo.QoIWOwnvSiQWOwnvPDklc8.iBRMGcxQWOvnvSt8jYl0CLJ7jbjUlb8.iBiLVa8X0PCofUuk1XkMWOznfUuk1Xo41Y8DiBM8FYk0CLJ.0axQWXM0CLJ.0axQWX8fiKv.iBP8lbzElL8.iKv.iBPIUXtcVY8DCLv3BLvn.TB0yLJ.kPD0yMJPjblQWOvnPSTUmaS0CLJzDU04lS8fiBMQUctQUO4n.UxMGb8zRLxnfQTUma8.iKv.iBVMVL8.iKv.iBVMlL8.iKv.iBVM1L8.iKv.iBVMFM8.iKv.iBVMVM8.iKv.iBVMlM8.iKv.iBVM1M8.iKv.iBVMFN8.iKv.iBPIWZuIWOvnPS0MzaxUVOvnvPu4FcE4VOwnfbMcUOv3BLvnfbPcUOv3BLvnvHi0VOOAEUJDzXi0iLJ7jYlEzXi0CLJXULTESOsDCLv3BLvnfUxPUL8zBNtTyMJX0LTESO2XiKv.iBVQCUwzSL33hM4nfU0PUL8zhL43RM4nfU1PUL8DCLv3BLvnfU2PUL8zBMv3BL2nfU3PUL8PiMtfSNJXULTISOwXiK1HiBVICUxziLy3BMznfUyPkL8LiKwjiBVQCUxzSKwLiKwfiBVUCUxzCMv3RNxnfU1PkL8zBM33BLvnfU2PkL8DCMtPSLJXENTISOzDiK1LiBVECUyzSK0biKyfiBVICUyzSKyDiK1DiBVMCUyzSK0XiK4DiBVQCUyzSK4HiKzLiBVUCUyzSK4TiK1XiBVYCUyzSKwXiKyPiBVcCUyzSK1LiK0DiBVgCUyzSK1TiKwPiBTMEauAWOxTiKv.iBTA0azMWOw.iBR4FYC0CLJLzTr8Fb8DiMt.CLJHkajcTOvnvQSw1av0iLz3BLvnfTtQFT8.iBPMEauAWOyLiKv.iBR4FYE0CLJTzTr8Fb8HiMt.CLJXULM8FY8.iKv.iBVISSuQVOv3BLvnfUyzzaj0CLt.CLJXEMM8FY8.iKv.iBVUSSuQVOv3BLvnfU1zzaj0CLt.CLJX0MM8FY8.iKv.iBVgSSuQVOv3BLvn.UxElay0TOvnvPzIGTmUVOvnvHi0VOE4jUwnPPzsVOwTiKv.iBDU1X8LyLtTCLJLUcy0CNv3BLvnfTkwVOyTiKv.iBVUFa8.iKv.iBM8FYkwVOvn.Uxk1Y8.iBQUWXtQWOvnvPxYWY8.iBRUFaO4VOwnvRkkmQrcWOv3BLvnvHi0VOE4jUxnPPzsVOv3BLvn.QkMVOzTiKv.iBSU2b8LiLt.CLJHUYr0yL23BLvnfUkwVO3TiKv.iBM8FYkwVOvn.Uxk1Y8.iBQUWXtQWOvnvPxYWY8.iBRUFaO4VOvnvRkkmQrcWOxPiKv.iBiLVa8vjQOEiBSkmai0SKxn.Uxk1Y8LiBWElck0CLJ.EZyUVOv3BLvn.TuwVXx0CLJPDa40iL13BLvn.QMMUL8DiBD0DQwzSNv3BLvnfTgQWY8DiK1.iBF0zTwzSLJXTSDESOv3hMvnvHi0VOLYzSxnvT441X8zhLJPkbocVOwnvUgYWY8DiBPg1bk0CLt.CLJ.0arElb8.iBDwVd8XCLt.CLJPTSSESOvn.QMQTL8.iKv.iBREFck0CLt.CLJXTSSESOvnfQMQTL8.iKv.iBiLVa8zzSDoPT0Elaz0iLt.CLJLEakcWO0.iKv.iBRMkbi0CLJjzTxMVOvnPTSI2X8.iBLMkbi0SL0nPPwLkbi0iMJDjLSI2X8biBMEyTxMVOvnPSxLkbi0CLJLxXs0ySSMjBM8FYkwVOvn.U04VYwzCLt.CLJPUctUlL8.iKv.iBTUmakMSOv3BLvnfUz8FQ8TCLt.CLJ.0U8TCLt.CLJLEZgAWYwzSMt.CLJLEZgAWYxzSMtHCLJLEZgAWYyzSMt.CLJXTS8.iKv.iBSkmaiISOvnvSyMVSogWOv3BLvnfUuwVL8.iKv.iBV8FaxzSLv.iKv.iBV8FayzCLt.CLJ.0USgFb8.iBSE1cSgFb8DiBSUmXSgFb8.iBT0TLSI2X8DSMJPUSwPDbz0CLt.CLJPUSxLkbi0SL2n.UMICQvQWOv3BLvn.TW0zTxMVOwbiBPcUSDAGc8.iKv.iBSgVLSI2X8DyMJLEZwPDbz0CLt.CLJPkboESOvnvTo4lL8.iBSE1cwzSLJ.0UMESOvn.UxklL8.iBSE1cxzCLJ.0UxzSLJ.0UMISOwnfSuk1bkESOvn.cxk1Tv0SLJLUdtM1L8.iBN8VZyUVOv3BLvnfSuk1bkMTOvn.UMEySt0CLJPUSx7ja8.iBT0zLO4VOvnvTMEySt0CLJLUSx7ja8.iBS0zLO4VOvn.UM01ajUVOynvUgYWYwzSLt.CLJbUX1UlL8DiKv.iBR0DT20VOvn.QxklYz0CMx3BLvnfQsMkbi0CLJXTaDAGc8.iKv.iBN8VZyMkbi0CLJ3zaoMGQvQWOv3BLvnfRvMEbwzSLJnDbSAmL8DiBBAmSuk1bk0SLJH0bzAEZwzCLt.CLJH0bzAEZxzCLt.CLJH0bzAEZyzCLt.CLJPzYzwFUvESOvn.QmQGaSAmL8.iKv.iBDcFcrQEbxzCLJPzYzw1TvMSO0.iKv.iBDcFcrMEbzzCLt.CLJPjSuEDaoEVOvnvHi0VOHAkQJzzajUFa8.iBFIWYw0yLv3BLvnfTkMWOv3BLvnfTkYWOwnvRkk2TiwVOv3BLvnfQMMkbi0SL0nfQMQDbz0CLt.CLJ.kQxUVb8zRLJLxXs0iUCYTLJzzajUFa8.iBFIWYw0CMw3BLvnfTkMWOv3BLvnfQMMkbi0iLwnfQMQDbz0SLx.iKv.iBF0jLSI2X8HiLJXTSxPDbz0CNt.CLJrTY4M0Xr0CMv3BLvnfQF0TOv3BLvn.SM8FYk0CLJvzPuw1ax0SLJL0ZRUlc8DiBSYmYM8FYk0CLJXjXgM1Z8HCLt.CLJHUYyMkbi0CLJHUYyQDbz0CLt.CLJXjYsMkbi0CLJXjYsQDbz0CLt.CLJXjXSI2X8.iBFIFQvQWOv3BLvnPRtQUctUVOwnvTnAWSogWOv3BLvnvTMMkbi0SL2nvTMQDbz0CLt.CLJHDbUIVZk0CLJLxXs0iUCETLJ.UXt0CLt.CLJX0ar0CM33RMvnfUCETOwnPSuQ1TxMVOwXiBM8FYDAGc8zRLz3BLvn.Tg41TxMVOvn.Tg4FQvQWOx3BLvnPSuQVY8.iBOYlYyUFc8zBLtDiLJLxXs0yTi8FbkEiBM8FYk0CLJXlbw0SK03BLvnvbiwVOw3BLvnPRtAWOvnvXyESOv3BLvnvXyISOv3BLvn.bi0CLJzzaj0CLJLxXs0iQXEiBM8FY0wVY8bxPn8lb0MWLmnvHi0VOCglbyEiBTkGbk0SLJHUXzUVOwHiKv.iBDUFbzgVOwTiK0.iBWUFc8biLtTCLJLxXs0CTnE1bkEiBTkGbk0CLJHUXzUVO0.iKv.iBFITOv3BLvnvTzUlbk8VOv3BLvnvT441X8.iBPgVXyUVOv3BLvnvUkQWOw.CLt.CLJPTYvQGZ8DCLv3BLvnvPk4FckIWO0.iKv.iBiLVa8.EagQWYwn.TxUVOv3BLvn.QoYlY8DCLv3BLvn.Qg0Fb8fCLt.CLJPTYiEVd8TCLt.CLJLUZ5UVOwTCLt.CLJPjb40SNv3BLvnvUkQWOz.iKv.iBiLVa8PTYrEVdwn.SDUFa8HiKv.iBCQTYr0CMt.CLJHEQkwVOz3BLvnvTV8Fa8HCLt.CLJLjUuwVOv3BLvnfQkUFYB0iL03BLvn.RP0CLt.CLJvDT8DCLv3BLvn.QxkWOw.CLt.CLJb0a20SMv3BLvnvHi0VORQWXxkWLJzzajUVOvnPSogWOw.CLt.CLJHTXr0SMv3BLvn.Qxklck0CLt.CLJLEckIWYu0SLv.iKv.iBOUGc8.iKv.iBSw1a20yLv3BLvnfQgMGc8fSMt.CLJHEUo0VY8TCLt.CLJLzatQWOvnvHi0VOFgkLJzzajUGak0yIPwVXzUlLmnvHi0VOCglbyIiBTkGbk0CLJHUXzUVO0.iKv.iBDUFbzgVO0.iKv.iBWUFc8DCLv3BLvnvHi0VOPgVXyUlLJPUdvUVOvnfTgQWY8TCLt.CLJXjP8.iKv.iBSQWYxU1a8.iKv.iBSkmai0CLJ.EZgMWY8.iKv.iBWUFc8DCLv3BLvn.QkAGcn0SLv.iKv.iBCUlazUlb8TCLt.CLJLxXs0CTrEFckIiBPIWY8.iKv.iBDklYl0SNx3BLvn.Qg0Fb8fiMt.CLJPTYiEVd8PSMt.CLJLUZ5UVOwTCMt.CLJPjb40CNv3BLvnvUkQWOw.iKv.iBiLVa8PTYrEVdxn.SDUFa8HiKv.iBCQTYr0CMt.CLJHEQkwVOz3BLvnvTV8Fa8HCLt.CLJLjUuwVOv3BLvnfQkUFYB0iL03BLvn.RP0CLt.CLJvDT8DCLv3BLvn.QxkWOw.CLt.CLJb0a20SMv3BLvnvHi0VORQWXxkmLJzzajUVOvnPSogWOw.CLt.CLJHTXr0SMv3BLvn.Qxklck0CLt.CLJLEckIWYu0SLv.iKv.iBOUGc8.iKv.iBSw1a20yLv3BLvnfQgMGc8fSMt.CLJHEUo0VY8TCLt.CLJLzatQWOvnfBJnvKu.xTkMFco8lafX1axARcmwVdfL1asAmbkM2bkQFHhklagIWdfPTXzElBu7BHD8jSmPEHT8TUCgDHTgTRSofBjPBIjHSLv.iB+bFYmMVYtUlX5DVXgEVaoU1X5DVXgIVXgEVX5TVXgEVXgEVX5DVXgEVZgQFb5DVXgEVXgUVX5DVXgEVYgUVX5nPXgEVXoEVYgoSXgEVXqEVYgoSXgEVXsEVYgoSXgoSYioSYhoSaioyYhoyYpoSahoCaooSYgoyXtoyYloyYmoyYJjlNm0lNnElNnMlNnYlNsklNuElNgUlNhUlNiElNi8lNlMlNmUlNmAWHwMWP2TVaZcFYE4TPxLCMQoTSKETLwDmBzEzMFc1aFgVYFUjSFg1ZKcUSjM1SAQSNwQWP2DSbzEzMiYlXp0FbiYlamAmXqs1XnYjapYVXJg1ahQFbuM1ZjofYqwVZkw1Xgs1SkAGajI1ZTolZh0lanMlXK4FahslZj4lXLMFatIVXiQFZkYVXt4VZnAmQpA2avgUXlwjagsFaJ.2ahAGbg4lYLY1ZtslQkoFTl81PwQUPwPSbyEzMkklVngVQPkkUlQ1YjUDTwDjLzLSboEVPw.SYkYDZmUjRYsjBLUTTNgVYJo0YuojSZUTVW0DYi8TPw.yLwMWPxXyLwQWPzLSc1cGd4oWPwLURwETXiETM0EzL0Y2c3kmdAEyTzovPAEiXgMTPwX0PAECYgMTPwjzPAEiYgMTPwbVXCETLOMTPwjVXCETLok1PAEiZgMTPwnVZCETLqE1PAEyZoMTPJDCagMTPwfzPAESagMTPwH0PAEiagMTPw3VZCETLSMTPw7VZCETLvE1PAECboMTPxHTPwPkPAESXoITPwDVaBEjBwHVXBETLUITPwHVZBETLh0lPAEiUBETLiUlPAEyXoITPwLVaBETLjElPAECYkITPwPVZBETLj0lPAESRBETLkoPYBETLkklPAESYsITPwXVXBETLlUlPAEiYoITPwXVaBETLmElPAESVBETLMITPw3jPAEySBETLnUlPAECZoITPJDCZsITPwjVXBETLoMlPAESZkITPwj1YBETLoklPAESZqITPwjVaBETLo8lPAEiZgITPwn1XBETLpUlPAEiZmIjBAEiZoITPwn1ZBETLp0lPAEiZuITPwrVXBETLqMlPAEyZkITPwr1YBETLqklPAEyZqITPwrVaBETLq8lPAECagofPAECaiITPwvVYBETLrclPAECRBETLrslPAECasITPwv1aBETLsElPAECQBETLsUlPAESamIjbAESaqITPwzVaJHTPwz1aBETLtElPAEiaiITPw3VYBETLtclPAEiaoITPw31ZBETLt0lPAEiauITPwLkPAEyaiITPw7VYBETLuclBBETLuklPAEyaqITPw7VaBETLu8lPAECbgITPw.2XBETLvUlPAECbmITPw.WZBETLvslPAECbsITPw.2aBE2bAovL0ETLRQDRh8VXpcTPwnVZBIFboYlZlMDVH8VaGI2ZuUFZVQjYskFbjwlPDAmYoU1Ph8VZlwFaCAmYikVYskTYJf1ahg0QUs1aiQlPAESRDQFbpEFSCs1YoM1XmITYmklXKQjZt81Zv01Qig1ZocFYDUkatgDQmElYkwFbD81ZHklBiczaiE1Zn8FQpsVYpk1XDEFahgFZhcjbWolXosFQoklYvg1ZGAGajwVZgITTkQFaiMTPwHEQiMlZpYlZC0lYqofZo81QsclQhglPjcFRhwlPjQVQk8FQjcFYhA0PUcEamMDYt41aEQjauQFajQ1PhM1TncFQkolXgkVYBgVZRI1aJHjTrI1au0VXvU1ZpUzPgQ1XrAGYCM1XTgVZDU1Yl4lZocTSocFZqQjbpAGasU1YBIVahw1ZuQzZqMFYlc1PQ0lBmgEQQQDTDIWPyDSOwDiMv.yLJ..."
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
										"blob" : "5640.CMlaKA....fQPMDZ....APTZVEF...P.....AjlaoQWZgwVZ5UF..........................TAyunBPMUFcgofBAUGcn8lb5nvI00BZkchBJnxKJnvHA0TODklcgovHVUlby0SLv.CLwnvHE4FYoEla8vVZzQGakovHt0VOxPiBiz1b831atUlBiz1b8zzajcEZrovHsMWOPkFcig1UJLRay0yPzIGaAovHsMWOCQmbrIjBiz1b8bTXzUlBiz1b8XUYr81XoQWdJLRay0CTxU1byUmbkovHsMWOKUVdF8Far81cJLRay0yRkkmQuwFaucmLJLRay0SPrQWYx4VXzUlBiz1b8HUXtQ1asovHsMWOSQWXislUuk1XkovHsMWOV8VZiUVSgAmBiz1b8Tja1EiBiz1b8Tja1IiBiz1b8vjQOEiBiz1b8vjQOIiBiz1b8HUYiQWZlkmBiz1b8jja1UlbzovHsMWOQUWXtQmBiz1b8vTXmovHsMWOAQFYkImBiz1b8zTcrQWZvwVdJLha10iLJLRa10yQgQWYJLRa10SQtYWLJLxXs0SagklaJLzXOAWO2PiKv.iBiXDVwzCLJLhQXISOwnvHi0VOPMzaxUlBSITXyUVOznvT2klam0CLt.CLJLEUxk1Y8DiBPM0atcVOvn.TF8Faj0CLJ.kQowVY8DiBGYTZrUVOxnvQSMVXrUVOvnvPnwTX40CLJLUcxI2S8DiBRUlc8bCMxHiBLUDQ8.iKv.iBPEzQE0CLJ.UXmU1bO4VOvnvPuIWYN0yLJLEaoMVY8PiBUkzWuAWOvnPSoQVZA0SMJzTZjkFT8XiBDYzarQVO2nvPzIGaA0iLJLDcxwlP8DSLJLxXs0yPLsjBMUGaz0SLv.iKv.iBBE1bk0iLJL0co41Y8.iKv.iBSQmboMFc8DiBiLVa8DjTPo.QoIWOwnvSiQWOwnvPDklc8.iBRMGcxQWOvnvSt8jYl0CLJ7jbjUlb8.iBiLVa8X0PCofUuk1XkMWOznfUuk1Xo41Y8DiBM8FYk0CLJ.0axQWXM0CLJ.0axQWX8fiKv.iBP8lbzElL8.iKv.iBPIUXtcVY8DCLv3BLvn.TB0yLJ.kPD0yMJPjblQWOvnPSTUmaS0CLJzDU04lS8fiBMQUctQUO4n.UxMGb8zRLxnfQTUma8.iKv.iBVMVL8.iKv.iBVMlL8.iKv.iBVM1L8.iKv.iBVMFM8.iKv.iBVMVM8.iKv.iBVMlM8.iKv.iBVM1M8.iKv.iBVMFN8.iKv.iBPIWZuIWOvnPS0MzaxUVOvnvPu4FcE4VOwnfbMcUOv3BLvnfbPcUOv3BLvnvHi0VOOAEUJDzXi0iLJ7jYlEzXi0CLJXULTESOsDCLv3BLvnfUxPUL8zBNtTyMJX0LTESO2XiKv.iBVQCUwzSL33hM4nfU0PUL8zhL43RM4nfU1PUL8DCLv3BLvnfU2PUL8zBMv3BL2nfU3PUL8PiMtfSNJXULTISOwXiK1HiBVICUxziLy3BMznfUyPkL8LiKwjiBVQCUxzSKwLiKwfiBVUCUxzCMv3RNxnfU1PkL8zBM33BLvnfU2PkL8DCMtPSLJXENTISOzDiK1LiBVECUyzSK0biKyfiBVICUyzSKyDiK1DiBVMCUyzSK0XiK4DiBVQCUyzSK4HiKzLiBVUCUyzSK4TiK1XiBVYCUyzSKwXiKyPiBVcCUyzSK1LiK0DiBVgCUyzSK1TiKwPiBTMEauAWOxTiKv.iBTA0azMWOw.iBR4FYC0CLJLzTr8Fb8DiMt.CLJHkajcTOvnvQSw1av0iLz3BLvnfTtQFT8.iBPMEauAWOyLiKv.iBR4FYE0CLJTzTr8Fb8HiMt.CLJXULM8FY8.iKv.iBVISSuQVOv3BLvnfUyzzaj0CLt.CLJXEMM8FY8.iKv.iBVUSSuQVOv3BLvnfU1zzaj0CLt.CLJX0MM8FY8.iKv.iBVgSSuQVOv3BLvn.UxElay0TOvnvPzIGTmUVOvnvHi0VOE4jUwnPPzsVOwTiKv.iBDU1X8LyLtTCLJLUcy0CNv3BLvnfTkwVOyTiKv.iBVUFa8.iKv.iBM8FYkwVOvn.Uxk1Y8.iBQUWXtQWOvnvPxYWY8.iBRUFaO4VOwnvRkkmQrcWOv3BLvnvHi0VOE4jUxnPPzsVOv3BLvn.QkMVOzTiKv.iBSU2b8LiLt.CLJHUYr0yL23BLvnfUkwVO3TiKv.iBM8FYkwVOvn.Uxk1Y8.iBQUWXtQWOvnvPxYWY8.iBRUFaO4VOvnvRkkmQrcWOxPiKv.iBiLVa8vjQOEiBSkmai0SKxn.Uxk1Y8LiBWElck0CLJ.EZyUVOv3BLvn.TuwVXx0CLJPDa40iL13BLvn.QMMUL8DiBD0DQwzSNv3BLvnfTgQWY8DiK1.iBF0zTwzSLJXTSDESOv3hMvnvHi0VOLYzSxnvT441X8zhLJPkbocVOwnvUgYWY8DiBPg1bk0CLt.CLJ.0arElb8.iBDwVd8XCLt.CLJPTSSESOvn.QMQTL8.iKv.iBREFck0CLt.CLJXTSSESOvnfQMQTL8.iKv.iBiLVa8zzSDoPT0Elaz0iLt.CLJLEakcWO0.iKv.iBRMkbi0CLJjzTxMVOvnPTSI2X8.iBLMkbi0SL0nPPwLkbi0iMJDjLSI2X8biBMEyTxMVOvnPSxLkbi0CLJLxXs0ySSMjBM8FYkwVOvn.U04VYwzCLt.CLJPUctUlL8.iKv.iBTUmakMSOv3BLvnfUz8FQ8TCLt.CLJ.0U8TCLt.CLJLEZgAWYwzSMt.CLJLEZgAWYxzSMtHCLJLEZgAWYyzSMt.CLJXTS8.iKv.iBSkmaiISOvnvSyMVSogWOv3BLvnfUuwVL8.iKv.iBV8FaxzSLv.iKv.iBV8FayzCLt.CLJ.0USgFb8.iBSE1cSgFb8DiBSUmXSgFb8.iBT0TLSI2X8DSMJPUSwPDbz0CLt.CLJPUSxLkbi0SL2n.UMICQvQWOv3BLvn.TW0zTxMVOwbiBPcUSDAGc8.iKv.iBSgVLSI2X8DyMJLEZwPDbz0CLt.CLJPkboESOvnvTo4lL8.iBSE1cwzSLJ.0UMESOvn.UxklL8.iBSE1cxzCLJ.0UxzSLJ.0UMISOwnfSuk1bkESOvn.cxk1Tv0SLJLUdtM1L8.iBN8VZyUVOv3BLvnfSuk1bkMTOvn.UMEySt0CLJPUSx7ja8.iBT0zLO4VOvnvTMEySt0CLJLUSx7ja8.iBS0zLO4VOvn.UM01ajUVOynvUgYWYwzSLt.CLJbUX1UlL8DiKv.iBR0DT20VOvn.QxklYz0CMx3BLvnfQsMkbi0CLJXTaDAGc8.iKv.iBN8VZyMkbi0CLJ3zaoMGQvQWOv3BLvnfRvMEbwzSLJnDbSAmL8DiBBAmSuk1bk0SLJH0bzAEZwzCLt.CLJH0bzAEZxzCLt.CLJH0bzAEZyzCLt.CLJPzYzwFUvESOvn.QmQGaSAmL8.iKv.iBDcFcrQEbxzCLJPzYzw1TvMSO0.iKv.iBDcFcrMEbzzCLt.CLJPjSuEDaoEVOvnvHi0VOHAkQJzzajUFa8.iBFIWYw0yLv3BLvnfTkMWOv3BLvnfTkYWOwnvRkk2TiwVOv3BLvnfQMMkbi0SL0nfQMQDbz0CLt.CLJ.kQxUVb8zRLJLxXs0iUCYTLJzzajUFa8.iBFIWYw0CMw3BLvnfTkMWOv3BLvnfQMMkbi0iLwnfQMQDbz0SLx.iKv.iBF0jLSI2X8HiLJXTSxPDbz0CNt.CLJrTY4M0Xr0CMv3BLvnfQF0TOv3BLvn.SM8FYk0CLJvzPuw1ax0SLJL0ZRUlc8DiBSYmYM8FYk0CLJXjXgM1Z8HCLt.CLJHUYyMkbi0CLJHUYyQDbz0CLt.CLJXjYsMkbi0CLJXjYsQDbz0CLt.CLJXjXSI2X8.iBFIFQvQWOv3BLvnPRtQUctUVOwnvTnAWSogWOv3BLvnvTMMkbi0SL2nvTMQDbz0CLt.CLJHDbUIVZk0CLJLxXs0iUCETLJ.UXt0CLt.CLJX0ar0CM33RMvnfUCETOwnPSuQ1TxMVOwXiBM8FYDAGc8zRLz3BLvn.Tg41TxMVOvn.Tg4FQvQWOx3BLvnPSuQVY8.iBOYlYyUFc8zBLtDiLJLxXs0yTi8FbkEiBM8FYk0CLJXlbw0SK03BLvnvbiwVOw3BLvnPRtAWOvnvXyESOv3BLvnvXyISOv3BLvn.bi0CLJzzaj0CLJLxXs0iQXEiBM8FY0wVY8bxPn8lb0MWLmnvHi0VOCglbyEiBTkGbk0SLJHUXzUVOwHiKv.iBDUFbzgVOwTiK0.iBWUFc8biLtTCLJLxXs0CTnE1bkEiBTkGbk0CLJHUXzUVO0.iKv.iBFITOv3BLvnvTzUlbk8VOv3BLvnvT441X8.iBPgVXyUVOv3BLvnvUkQWOw.CLt.CLJPTYvQGZ8DCLv3BLvnvPk4FckIWO0.iKv.iBiLVa8.EagQWYwn.TxUVOv3BLvn.QoYlY8DCLv3BLvn.Qg0Fb8fCLt.CLJPTYiEVd8TCLt.CLJLUZ5UVOwTCLt.CLJPjb40SNv3BLvnvUkQWOz.iKv.iBiLVa8PTYrEVdwn.SDUFa8HiKv.iBCQTYr0CMt.CLJHEQkwVOz3BLvnvTV8Fa8HCLt.CLJLjUuwVOv3BLvnfQkUFYB0iL03BLvn.RP0CLt.CLJvDT8DCLv3BLvn.QxkWOw.CLt.CLJb0a20SMv3BLvnvHi0VORQWXxkWLJzzajUVOvnPSogWOw.CLt.CLJHTXr0SMv3BLvn.Qxklck0CLt.CLJLEckIWYu0SLv.iKv.iBOUGc8.iKv.iBSw1a20yLv3BLvnfQgMGc8fSMt.CLJHEUo0VY8TCLt.CLJLzatQWOvnvHi0VOFgkLJzzajUGak0yIPwVXzUlLmnvHi0VOCglbyIiBTkGbk0CLJHUXzUVO0.iKv.iBDUFbzgVO0.iKv.iBWUFc8DCLv3BLvnvHi0VOPgVXyUlLJPUdvUVOvnfTgQWY8TCLt.CLJXjP8.iKv.iBSQWYxU1a8.iKv.iBSkmai0CLJ.EZgMWY8.iKv.iBWUFc8DCLv3BLvn.QkAGcn0SLv.iKv.iBCUlazUlb8TCLt.CLJLxXs0CTrEFckIiBPIWY8.iKv.iBDklYl0SNx3BLvn.Qg0Fb8fiMt.CLJPTYiEVd8PSMt.CLJLUZ5UVOwTCMt.CLJPjb40CNv3BLvnvUkQWOw.iKv.iBiLVa8PTYrEVdxn.SDUFa8HiKv.iBCQTYr0CMt.CLJHEQkwVOz3BLvnvTV8Fa8HCLt.CLJLjUuwVOv3BLvnfQkUFYB0iL03BLvn.RP0CLt.CLJvDT8DCLv3BLvn.QxkWOw.CLt.CLJb0a20SMv3BLvnvHi0VORQWXxkmLJzzajUVOvnPSogWOw.CLt.CLJHTXr0SMv3BLvn.Qxklck0CLt.CLJLEckIWYu0SLv.iKv.iBOUGc8.iKv.iBSw1a20yLv3BLvnfQgMGc8fSMt.CLJHEUo0VY8TCLt.CLJLzatQWOvnfBJnvKu.xTkMFco8lafX1axARcmwVdfL1asAmbkM2bkQFHhklagIWdfPTXzElBu7BHD8jSmPEHT8TUCgDHTgTRSofBjPBIjHSLv.iB+bFYmMVYtUlX5DVXgEVaoU1X5DVXgIVXgEVX5TVXgEVXgEVX5DVXgEVZgQFb5DVXgEVXgUVX5DVXgEVYgUVX5nPXgEVXoEVYgoSXgEVXqEVYgoSXgEVXsEVYgoSXgoSYioSYhoSaioyYhoyYpoSahoCaooSYgoyXtoyYloyYmoyYJjlNm0lNnElNnMlNnYlNsklNuElNgUlNhUlNiElNi8lNlMlNmUlNmAWHwMWP2TVaZcFYE4TPxLCMQoTSKETLwDmBzEzMFc1aFgVYFUjSFg1ZKcUSjM1SAQSNwQWP2DSbzEzMiYlXp0FbiYlamAmXqs1XnYjapYVXJg1ahQFbuM1ZjofYqwVZkw1Xgs1SkAGajI1ZTolZh0lanMlXK4FahslZj4lXLMFatIVXiQFZkYVXt4VZnAmQpA2avgUXlwjagsFaJ.2ahAGbg4lYLY1ZtslQkoFTl81PwQUPwPSbyEzMkklVngVQPkkUlQ1YjUDTwDjLzLSboEVPw.SYkYDZmUjRYsjBLUTTNgVYJo0YuojSZUTVW0DYi8TPw.yLwMWPxXyLwQWPzLSc1cGd4oWPwLURwETXiETM0EzL0Y2c3kmdAEyTzovPAEiXgMTPwX0PAECYgMTPwjzPAEiYgMTPwbVXCETLOMTPwjVXCETLok1PAEiZgMTPwnVZCETLqE1PAEyZoMTPJDCagMTPwfzPAESagMTPwH0PAEiagMTPw3VZCETLSMTPw7VZCETLvE1PAECboMTPxHTPwPkPAESXoITPwDVaBEjBwHVXBETLUITPwHVZBETLh0lPAEiUBETLiUlPAEyXoITPwLVaBETLjElPAECYkITPwPVZBETLj0lPAESRBETLkoPYBETLkklPAESYsITPwXVXBETLlUlPAEiYoITPwXVaBETLmElPAESVBETLMITPw3jPAEySBETLnUlPAECZoITPJDCZsITPwjVXBETLoMlPAESZkITPwj1YBETLoklPAESZqITPwjVaBETLo8lPAEiZgITPwn1XBETLpUlPAEiZmIjBAEiZoITPwn1ZBETLp0lPAEiZuITPwrVXBETLqMlPAEyZkITPwr1YBETLqklPAEyZqITPwrVaBETLq8lPAECagofPAECaiITPwvVYBETLrclPAECRBETLrslPAECasITPwv1aBETLsElPAECQBETLsUlPAESamIjbAESaqITPwzVaJHTPwz1aBETLtElPAEiaiITPw3VYBETLtclPAEiaoITPw31ZBETLt0lPAEiauITPwLkPAEyaiITPw7VYBETLuclBBETLuklPAEyaqITPw7VaBETLu8lPAECbgITPw.2XBETLvUlPAECbmITPw.WZBETLvslPAECbsITPw.2aBE2bAovL0ETLRQDRh8VXpcTPwnVZBIFboYlZlMDVH8VaGI2ZuUFZVQjYskFbjwlPDAmYoU1Ph8VZlwFaCAmYikVYskTYJf1ahg0QUs1aiQlPAESRDQFbpEFSCs1YoM1XmITYmklXKQjZt81Zv01Qig1ZocFYDUkatgDQmElYkwFbD81ZHklBiczaiE1Zn8FQpsVYpk1XDEFahgFZhcjbWolXosFQoklYvg1ZGAGajwVZgITTkQFaiMTPwHEQiMlZpYlZC0lYqofZo81QsclQhglPjcFRhwlPjQVQk8FQjcFYhA0PUcEamMDYt41aEQjauQFajQ1PhM1TncFQkolXgkVYBgVZRI1aJHjTrI1au0VXvU1ZpUzPgQ1XrAGYCM1XTgVZDU1Yl4lZocTSocFZqQjbpAGasU1YBIVahw1ZuQzZqMFYlc1PQ0lBmgEQQQDTDIWPyDSOwDiMv.yLJ..."
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
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-97",
					"maxclass" : "newobj",
					"numinlets" : 7,
					"numoutlets" : 2,
					"outlettype" : [ "int", "" ],
					"patching_rect" : [ 31.666626, 799.5, 108.0, 23.0 ],
					"style" : "",
					"text" : "midiformat"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-98",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 31.666626, 769.5, 32.5, 23.0 ],
					"style" : "",
					"text" : "join"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-99",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 31.666626, 738.5, 118.0, 23.0 ],
					"style" : "",
					"text" : "makenote 60 3000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-100",
					"maxclass" : "kslider",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 31.666626, 671.0, 336.0, 53.0 ],
					"presentation_rect" : [ 15.0, 15.0, 336.0, 53.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-76",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1850.0, 336.5, 522.0, 21.0 ],
					"style" : "",
					"text" : "Realtime control of device parameter",
					"textcolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 1850.0, 368.432373, 76.0, 22.0 ],
					"saved_object_attributes" : 					{
						"_persistence" : 1,
						"smoothing" : 1.0
					}
,
					"style" : "",
					"text" : "live.remote~"
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
					"patching_rect" : [ 279.5, 311.067627, 172.0, 23.0 ],
					"style" : "",
					"text" : "print pgmnames @popup 1"
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
					"patching_rect" : [ 311.0, 424.5, 54.0, 23.0 ],
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
					"patching_rect" : [ 201.0, 424.5, 53.0, 23.0 ],
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
					"patching_rect" : [ 201.0, 394.5, 129.0, 23.0 ],
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
					"patching_rect" : [ 196.0, 449.5, 105.0, 21.0 ],
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
					"patching_rect" : [ 306.0, 449.5, 72.0, 21.0 ],
					"style" : "",
					"text" : "value (0-1)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-58",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 331.333374, 215.5, 39.0, 23.0 ],
					"style" : "",
					"text" : "get 5"
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
					"patching_rect" : [ 310.0, 38.5, 59.0, 23.0 ],
					"style" : "",
					"text" : "params"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-60",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 327.5, 160.0, 47.0, 23.0 ],
					"style" : "",
					"text" : "5 0.25"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-61",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 327.5, 123.0, 143.0, 23.0 ],
					"style" : "",
					"text" : "\"VCF1: Frequency\" 0.1"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-79",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 482.0, 107.5, 88.0, 54.0 ],
					"style" : "",
					"text" : "set value of named parameter"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-80",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 391.333374, 151.0, 99.0, 54.0 ],
					"style" : "",
					"text" : "set value of numbered parameter"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-86",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 386.333374, 38.5, 148.0, 40.0 ],
					"style" : "",
					"text" : "output parameter names to third outlet"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-89",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 386.333374, 211.0, 106.0, 54.0 ],
					"style" : "",
					"text" : "output param value to fourth outlet"
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
					"patching_rect" : [ 31.666626, 166.5, 70.0, 23.0 ],
					"style" : "",
					"text" : "open"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubblepoint" : 0.26,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-19",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1166.0, 752.0, 316.0, 40.0 ],
					"style" : "",
					"text" : "Takes list of 2 floats (x,y) and outputs the interpolated weight of each node at that position."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-11",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 859.0, 1222.923096, 204.0, 21.0 ],
					"style" : "",
					"text" : "interpolated weight of each node",
					"textcolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-16",
					"linecount" : 8,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1076.0, 894.923096, 522.0, 123.0 ],
					"style" : "",
					"text" : "Output: \nLeft outlet is a list of interpolation weights.  \n\nMiddle outlet reports node positions and sizes in the form [query, node number, x-position, y-position, size] with various 'get' messages such as \"getxy\" or \"getsize\". These lists can be parsed for use in other contexts (see dump-get subpatcher). \n\nRight outlet reports mousing information inside the nodes patching rectangle.\n",
					"textcolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-21",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1068.0, 814.923096, 370.0, 54.0 ],
					"style" : "",
					"text" : "Click and drag the cross to position the slider.\nClick and drag center of node to position a node.\nOption Key enables resizing of node with mousedrag."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-31",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1089.0, 752.0, 20.0, 21.0 ],
					"style" : "",
					"text" : "y",
					"textcolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-32",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 995.0, 752.0, 20.0, 21.0 ],
					"style" : "",
					"text" : "x",
					"textcolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "xplace",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-33",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 842.0, 752.0, 151.0, 23.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-46",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1050.43457, 1244.923096, 21.0, 21.0 ],
					"style" : "",
					"text" : "9",
					"textcolor" : [ 0.564706, 0.564706, 0.564706, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-45",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1024.69043, 1244.923096, 21.0, 21.0 ],
					"style" : "",
					"text" : "8",
					"textcolor" : [ 0.564706, 0.564706, 0.564706, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-44",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 998.946411, 1244.923096, 21.0, 21.0 ],
					"style" : "",
					"text" : "7",
					"textcolor" : [ 0.564706, 0.564706, 0.564706, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-43",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 973.202393, 1244.923096, 21.0, 21.0 ],
					"style" : "",
					"text" : "6",
					"textcolor" : [ 0.564706, 0.564706, 0.564706, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-42",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 947.458313, 1244.923096, 21.0, 21.0 ],
					"style" : "",
					"text" : "5",
					"textcolor" : [ 0.564706, 0.564706, 0.564706, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-34",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 921.714294, 1244.923096, 21.0, 21.0 ],
					"style" : "",
					"text" : "4",
					"textcolor" : [ 0.564706, 0.564706, 0.564706, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-40",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 897.0, 1244.923096, 21.0, 21.0 ],
					"style" : "",
					"text" : "3",
					"textcolor" : [ 0.564706, 0.564706, 0.564706, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-37",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 871.0, 1244.923096, 21.0, 21.0 ],
					"style" : "",
					"text" : "2",
					"textcolor" : [ 0.564706, 0.564706, 0.564706, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-35",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1048.0, 1049.923096, 279.0, 23.0 ],
					"style" : "",
					"text" : "mouseidle 0.032143 0.762099 0 0 0 0 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"format" : 6,
					"id" : "obj-38",
					"maxclass" : "flonum",
					"maximum" : 1.0,
					"minimum" : 0.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1109.0, 752.0, 53.0, 23.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1015.0, 781.923096, 113.0, 23.0 ],
					"style" : "",
					"text" : "pak 0. 0."
				}

			}
, 			{
				"box" : 				{
					"candycane" : 8,
					"id" : "obj-47",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 842.0, 1241.923096, 232.0, 71.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"setstyle" : 1,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-48",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 927.0, 1199.923096, 209.0, 23.0 ],
					"style" : "",
					"text" : "0.771429 0.165563 0.107522 1"
				}

			}
, 			{
				"box" : 				{
					"candycane" : 8,
					"candycane2" : [ 0.145098, 0.207843, 0.356863, 0.4 ],
					"candycane3" : [ 0.294118, 0.415686, 0.717647, 0.4 ],
					"displayknob" : 1,
					"id" : "obj-49",
					"knobcolor" : [ 0.764706, 0.592157, 0.101961, 0.898039 ],
					"knobsize" : 20.0,
					"maxclass" : "nodes",
					"nsize" : [ 0.137168 ],
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 837.5, 878.923096, 140.0, 151.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 7.0, 6.0, 140.0, 151.0 ],
					"style" : "",
					"varname" : "nodes",
					"xplace" : [ 0.65 ],
					"yplace" : [ 0.576159 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-50",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 902.0, 1171.923096, 209.0, 23.0 ],
					"style" : "",
					"text" : "0.716814 0.884956 0.231416 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-51",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 878.0, 1144.923096, 209.0, 23.0 ],
					"style" : "",
					"text" : "0.477876 0.115044 0.146637 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-52",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 859.0, 1116.923096, 201.0, 23.0 ],
					"style" : "",
					"text" : "0.65 0.576159 0.137168 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 1020.0, 1076.923096, 130.0, 23.0 ],
					"style" : "",
					"text" : "route 1 2 3 4"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 946.0, 1048.923096, 74.0, 23.0 ],
					"style" : "",
					"text" : "route node"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"format" : 6,
					"id" : "obj-55",
					"maxclass" : "flonum",
					"maximum" : 1.0,
					"minimum" : 0.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1015.0, 752.0, 53.0, 23.0 ],
					"style" : ""
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-223", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 1 ],
					"midpoints" : [ 358.166626, 732.0, 90.666626, 732.0 ],
					"source" : [ "obj-100", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-248", 0 ],
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 176.88092, 80.182373, 129.666626, 80.182373 ],
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
					"destination" : [ "obj-227", 0 ],
					"midpoints" : [ 315.5, 1733.461548, 373.5, 1733.461548 ],
					"order" : 0,
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-281", 0 ],
					"order" : 1,
					"source" : [ "obj-105", 0 ]
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
					"destination" : [ "obj-112", 0 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"midpoints" : [ 1390.5, 538.0, 1292.0, 538.0, 1292.0, 543.0, 1285.5, 543.0 ],
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-100", 0 ],
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"midpoints" : [ 1310.5, 538.0, 1292.0, 538.0, 1292.0, 543.0, 1285.5, 543.0 ],
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-117", 0 ],
					"source" : [ "obj-120", 0 ]
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
					"destination" : [ "obj-242", 0 ],
					"source" : [ "obj-132", 0 ]
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
					"destination" : [ "obj-142", 0 ],
					"source" : [ "obj-136", 0 ]
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
					"destination" : [ "obj-134", 0 ],
					"midpoints" : [ 1843.5, 494.0, 1949.0, 494.0 ],
					"order" : 1,
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-146", 0 ],
					"order" : 2,
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-206", 0 ],
					"midpoints" : [ 1843.5, 494.0, 2020.5, 494.0 ],
					"order" : 0,
					"source" : [ "obj-142", 0 ]
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
					"destination" : [ "obj-201", 0 ],
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
					"destination" : [ "obj-168", 0 ],
					"source" : [ "obj-154", 0 ]
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
					"destination" : [ "obj-164", 0 ],
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
					"destination" : [ "obj-152", 0 ],
					"source" : [ "obj-168", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-262", 0 ],
					"source" : [ "obj-170", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 0 ],
					"source" : [ "obj-172", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-186", 0 ],
					"midpoints" : [ 1105.0, 369.0, 1175.5, 369.0 ],
					"source" : [ "obj-174", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-176", 0 ],
					"source" : [ "obj-175", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-174", 0 ],
					"source" : [ "obj-176", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-199", 0 ],
					"source" : [ "obj-178", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-172", 0 ],
					"order" : 1,
					"source" : [ "obj-179", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"midpoints" : [ 1064.5, 232.75, 1161.5, 232.75 ],
					"order" : 0,
					"source" : [ "obj-179", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-182", 0 ],
					"source" : [ "obj-180", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-180", 0 ],
					"source" : [ "obj-181", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-186", 1 ],
					"midpoints" : [ 1253.0, 369.0, 1209.5, 369.0 ],
					"source" : [ "obj-182", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-181", 0 ],
					"source" : [ "obj-183", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-183", 0 ],
					"order" : 1,
					"source" : [ "obj-184", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"midpoints" : [ 1212.5, 232.25, 1337.5, 232.25 ],
					"order" : 0,
					"source" : [ "obj-184", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-178", 0 ],
					"source" : [ "obj-186", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-191", 0 ],
					"order" : 1,
					"source" : [ "obj-187", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"midpoints" : [ 1390.5, 230.25, 1495.5, 230.25 ],
					"order" : 0,
					"source" : [ "obj-187", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-190", 0 ],
					"source" : [ "obj-188", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-188", 0 ],
					"source" : [ "obj-189", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-186", 2 ],
					"midpoints" : [ 1431.0, 370.5, 1243.5, 370.5 ],
					"source" : [ "obj-190", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-189", 0 ],
					"source" : [ "obj-191", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-204", 0 ],
					"source" : [ "obj-192", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-205", 0 ],
					"source" : [ "obj-192", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-197", 0 ],
					"source" : [ "obj-195", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"order" : 0,
					"source" : [ "obj-196", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-203", 0 ],
					"order" : 1,
					"source" : [ "obj-196", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-198", 0 ],
					"source" : [ "obj-197", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-200", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-199", 0 ],
					"source" : [ "obj-201", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-200", 0 ],
					"source" : [ "obj-202", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-195", 0 ],
					"source" : [ "obj-204", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-195", 1 ],
					"source" : [ "obj-205", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-207", 0 ],
					"source" : [ "obj-206", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-209", 0 ],
					"midpoints" : [ 2020.5, 572.0, 2020.5, 572.0 ],
					"order" : 1,
					"source" : [ "obj-207", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"order" : 0,
					"source" : [ "obj-207", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-211", 0 ],
					"source" : [ "obj-210", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-195", 2 ],
					"source" : [ "obj-211", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-217", 0 ],
					"source" : [ "obj-212", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-210", 0 ],
					"source" : [ "obj-217", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-221", 0 ],
					"source" : [ "obj-218", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-218", 0 ],
					"source" : [ "obj-219", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 0 ],
					"midpoints" : [ 300.88092, 821.932373, 176.88092, 821.932373 ],
					"source" : [ "obj-22", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-195", 3 ],
					"source" : [ "obj-220", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-220", 0 ],
					"source" : [ "obj-221", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-297", 0 ],
					"midpoints" : [ 107.5, 1913.050293, 32.5, 1913.050293 ],
					"order" : 1,
					"source" : [ "obj-223", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-301", 0 ],
					"order" : 0,
					"source" : [ "obj-223", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-233", 0 ],
					"midpoints" : [ 373.5, 1876.050293, 351.5, 1876.050293 ],
					"source" : [ "obj-227", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-231", 0 ],
					"midpoints" : [ 107.5, 1753.923096, 222.0, 1753.923096 ],
					"order" : 0,
					"source" : [ "obj-228", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-235", 0 ],
					"order" : 1,
					"source" : [ "obj-228", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-223", 0 ],
					"midpoints" : [ 222.0, 1808.461548, 107.5, 1808.461548 ],
					"source" : [ "obj-231", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-223", 0 ],
					"midpoints" : [ 107.5, 1808.461548, 107.5, 1808.461548 ],
					"source" : [ "obj-235", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-245", 0 ],
					"source" : [ "obj-239", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-284", 0 ],
					"source" : [ "obj-240", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-259", 0 ],
					"source" : [ "obj-241", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-243", 0 ],
					"source" : [ "obj-242", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-170", 0 ],
					"source" : [ "obj-243", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-170", 0 ],
					"source" : [ "obj-244", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-240", 0 ],
					"source" : [ "obj-245", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-250", 0 ],
					"source" : [ "obj-246", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-246", 0 ],
					"source" : [ "obj-247", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-249", 0 ],
					"source" : [ "obj-248", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-240", 1 ],
					"order" : 1,
					"source" : [ "obj-249", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-241", 0 ],
					"order" : 0,
					"source" : [ "obj-249", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"order" : 1,
					"source" : [ "obj-250", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-249", 1 ],
					"order" : 0,
					"source" : [ "obj-250", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-252", 2 ],
					"source" : [ "obj-251", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-252", 1 ],
					"source" : [ "obj-251", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-252", 0 ],
					"source" : [ "obj-251", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 1 ],
					"source" : [ "obj-252", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-251", 0 ],
					"source" : [ "obj-253", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-251", 2 ],
					"source" : [ "obj-253", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-251", 1 ],
					"source" : [ "obj-253", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-256", 0 ],
					"order" : 0,
					"source" : [ "obj-254", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-257", 0 ],
					"order" : 1,
					"source" : [ "obj-254", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-252", 4 ],
					"source" : [ "obj-255", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-252", 3 ],
					"source" : [ "obj-255", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-258", 0 ],
					"source" : [ "obj-256", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-258", 0 ],
					"source" : [ "obj-257", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-253", 0 ],
					"source" : [ "obj-258", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-255", 0 ],
					"source" : [ "obj-258", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-244", 0 ],
					"source" : [ "obj-260", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-260", 0 ],
					"source" : [ "obj-261", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-239", 0 ],
					"order" : 3,
					"source" : [ "obj-262", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-247", 0 ],
					"order" : 0,
					"source" : [ "obj-262", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-259", 0 ],
					"order" : 1,
					"source" : [ "obj-262", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-275", 0 ],
					"order" : 2,
					"source" : [ "obj-262", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-265", 0 ],
					"source" : [ "obj-264", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-268", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1130.0, 1711.0, 1130.0, 1711.0 ],
					"source" : [ "obj-265", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"order" : 0,
					"source" : [ "obj-268", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-259", 1 ],
					"order" : 1,
					"source" : [ "obj-268", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-259", 0 ],
					"order" : 1,
					"source" : [ "obj-268", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-267", 0 ],
					"order" : 0,
					"source" : [ "obj-268", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-275", 1 ],
					"order" : 2,
					"source" : [ "obj-268", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-275", 0 ],
					"order" : 2,
					"source" : [ "obj-268", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"midpoints" : [ 129.666626, 265.5, 41.166626, 265.5 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-231", 0 ],
					"order" : 1,
					"source" : [ "obj-279", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-280", 0 ],
					"midpoints" : [ 222.0, 1753.461548, 289.5, 1753.461548 ],
					"order" : 0,
					"source" : [ "obj-279", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-200", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-223", 0 ],
					"midpoints" : [ 289.5, 1807.411255, 107.5, 1807.411255 ],
					"order" : 1,
					"source" : [ "obj-280", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-233", 0 ],
					"midpoints" : [ 289.5, 1806.511841, 351.5, 1806.511841 ],
					"order" : 0,
					"source" : [ "obj-280", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-282", 0 ],
					"source" : [ "obj-281", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-283", 0 ],
					"source" : [ "obj-284", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-287", 0 ],
					"source" : [ "obj-286", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-288", 0 ],
					"source" : [ "obj-287", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-293", 0 ],
					"midpoints" : [ 162.5, 1339.961548, 95.5, 1339.961548 ],
					"source" : [ "obj-288", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-293", 0 ],
					"source" : [ "obj-292", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"order" : 1,
					"source" : [ "obj-293", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-296", 0 ],
					"source" : [ "obj-293", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-299", 0 ],
					"order" : 0,
					"source" : [ "obj-293", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-286", 0 ],
					"order" : 1,
					"source" : [ "obj-294", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-292", 0 ],
					"order" : 2,
					"source" : [ "obj-294", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-299", 0 ],
					"midpoints" : [ 95.5, 1196.961548, 343.5, 1196.961548 ],
					"order" : 0,
					"source" : [ "obj-294", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-295", 1 ],
					"order" : 0,
					"source" : [ "obj-296", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-295", 0 ],
					"order" : 1,
					"source" : [ "obj-296", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-298", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-298", 0 ],
					"source" : [ "obj-299", 0 ]
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
					"destination" : [ "obj-302", 0 ],
					"source" : [ "obj-300", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-300", 0 ],
					"source" : [ "obj-303", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ 851.5, 775.923096, 847.0, 775.923096 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-174", 0 ],
					"midpoints" : [ 1161.5, 327.75, 1064.5, 327.75 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 1 ],
					"midpoints" : [ 1118.5, 775.923096, 1118.5, 775.923096 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ 1024.5, 805.923096, 847.0, 805.923096 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 1 ],
					"midpoints" : [ 968.0, 1042.923096, 1317.5, 1042.923096 ],
					"source" : [ "obj-49", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"midpoints" : [ 847.0, 1102.923096, 845.0, 1102.923096, 845.0, 1234.923096, 851.5, 1234.923096 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"midpoints" : [ 907.5, 1042.923096, 955.5, 1042.923096 ],
					"source" : [ "obj-49", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 1 ],
					"midpoints" : [ 1112.75, 1156.923096, 1126.5, 1156.923096 ],
					"source" : [ "obj-53", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 1 ],
					"midpoints" : [ 1085.0, 1129.923096, 1101.5, 1129.923096 ],
					"source" : [ "obj-53", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 1 ],
					"midpoints" : [ 1057.25, 1111.923096, 1077.5, 1111.923096 ],
					"source" : [ "obj-53", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 1 ],
					"midpoints" : [ 1029.5, 1111.923096, 1050.5, 1111.923096 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 955.5, 1081.923096, 1016.0, 1081.923096, 1016.0, 1072.923096, 1029.5, 1072.923096 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"midpoints" : [ 1024.5, 775.923096, 1024.5, 775.923096 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-182", 0 ],
					"midpoints" : [ 1337.5, 327.25, 1212.5, 327.25 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-114", 0 ],
					"midpoints" : [ 340.833374, 246.5, 322.5, 246.5, 322.5, 230.5, 320.5, 230.5 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-114", 0 ],
					"midpoints" : [ 319.5, 81.5, 320.5, 81.5 ],
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
					"destination" : [ "obj-114", 0 ],
					"midpoints" : [ 337.0, 188.5, 320.5, 188.5 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-114", 0 ],
					"midpoints" : [ 337.0, 153.5, 320.5, 153.5 ],
					"source" : [ "obj-61", 0 ]
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
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-7", 0 ]
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
					"destination" : [ "obj-190", 0 ],
					"midpoints" : [ 1495.5, 327.25, 1390.5, 327.25 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-93", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"source" : [ "obj-93", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 0 ],
					"source" : [ "obj-93", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"source" : [ "obj-94", 0 ]
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
					"destination" : [ "obj-26", 1 ],
					"source" : [ "obj-96", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"midpoints" : [ 166.166626, 296.5, 289.0, 296.5 ],
					"source" : [ "obj-96", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"source" : [ "obj-96", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 0 ],
					"midpoints" : [ 130.166626, 832.932373, 41.166626, 832.932373 ],
					"source" : [ "obj-97", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"midpoints" : [ 41.166626, 794.5, 41.166626, 794.5 ],
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 1 ],
					"midpoints" : [ 140.166626, 765.5, 54.666626, 765.5 ],
					"source" : [ "obj-99", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"midpoints" : [ 41.166626, 764.5, 41.166626, 764.5 ],
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-28" : [ "live.text", "live.text", 0 ],
			"obj-126" : [ "live.dial", "live.dial", 0 ],
			"obj-192" : [ "pictslider", "pictslider", 0 ],
			"obj-296" : [ "Audio[1]", "Audio", 0 ],
			"obj-105" : [ "live.drop", "live.drop", 0 ],
			"obj-167" : [ "live.dial[2]", "live.dial", 0 ],
			"obj-131" : [ "live.dial[1]", "live.dial", 0 ],
			"obj-96" : [ "vst~[2]", "vst~[2]", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "Diva.maxsnap",
				"bootpath" : "~/Documents/Max 7/Snapshots",
				"patcherrelativepath" : "../../../../../Documents/Max 7/Snapshots",
				"type" : "mx@s",
				"implicit" : 1
			}
, 			{
				"name" : "rbfi.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "mubu.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "mubu.mxo",
				"type" : "iLaX"
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
