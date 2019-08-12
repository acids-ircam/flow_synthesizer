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
		"rect" : [ 55.0, 79.0, 975.0, 719.0 ],
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
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 0.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.79,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.866667, 0.866667, 0.866667, 0.0 ],
					"bgfillcolor_color2" : [ 0.685, 0.685, 0.685, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontname" : "Helvetica Neue UltraLight",
					"fontsize" : 16.0,
					"gradient" : 0,
					"id" : "obj-31",
					"ignoreclick" : 1,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1179.5, 824.0, 32.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.168503, 24.0, 34.0, 27.0 ],
					"style" : "",
					"text" : "osc",
					"textcolor" : [ 1.0, 1.0, 1.0, 0.3 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"linecolor" : [ 0.349151, 0.377564, 0.442529, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2199.0, 730.0, 5.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 7.5, 37.75, 43.875, 16.950928 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 913.713379, 451.0, 85.0, 22.0 ],
					"style" : "",
					"text" : "loadmess 123"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-121",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.5, 469.989136, 33.0, 20.0 ],
					"style" : "",
					"text" : "set 0"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.917647, 0.937255, 0.670588, 1.0 ],
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-122",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.5, 438.482422, 69.0, 20.0 ],
					"style" : "",
					"text" : "r ---winclose",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-123",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 700.5, 416.0, 157.213379, 18.0 ],
					"style" : "",
					"text" : "open/close window"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-124",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 700.5, 555.949036, 39.0, 20.0 ],
					"style" : "",
					"text" : "select"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-125",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 753.5, 583.56543, 34.0, 20.0 ],
					"style" : "",
					"text" : "open"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-127",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.5, 583.56543, 36.0, 20.0 ],
					"style" : "",
					"text" : "close"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Floating Window",
					"bgcolor" : [ 0.278431, 0.839216, 1.0, 1.0 ],
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 3,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 377.0, 79.0, 866.0, 385.0 ],
						"bgcolor" : [ 0.309804, 0.329412, 0.329412, 1.0 ],
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
						"title" : "Window",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Helvetica Neue Light",
									"fontsize" : 16.0,
									"id" : "obj-174",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 18.0, 83.0, 360.0, 25.0 ],
									"presentation" : 1,
									"presentation_linecount" : 2,
									"presentation_rect" : [ 48.359283, 490.170898, 281.0, 44.0 ],
									"style" : "",
									"text" : "Artificial Creative Intelligence and Data Science",
									"textcolor" : [ 0.862745, 0.870588, 0.878431, 0.7 ]
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.866667, 0.866667, 0.866667, 0.0 ],
									"bgfillcolor_angle" : 270.0,
									"bgfillcolor_autogradient" : 0.79,
									"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
									"bgfillcolor_color1" : [ 0.866667, 0.866667, 0.866667, 0.0 ],
									"bgfillcolor_color2" : [ 0.685, 0.685, 0.685, 1.0 ],
									"bgfillcolor_proportion" : 0.39,
									"bgfillcolor_type" : "gradient",
									"fontname" : "Helvetica Neue UltraLight",
									"fontsize" : 36.0,
									"gradient" : 0,
									"id" : "obj-172",
									"ignoreclick" : 1,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 97.0, 18.284363, 217.0, 50.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 97.0, 18.284363, 217.0, 50.0 ],
									"style" : "",
									"text" : "ACIDS Plugins",
									"textcolor" : [ 1.0, 1.0, 1.0, 0.23 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"linecolor" : [ 0.349151, 0.377564, 0.442529, 1.0 ],
									"maxclass" : "live.line",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 97.0, 74.113792, 217.0, 5.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 97.0, 74.113792, 217.0, 5.0 ]
								}

							}
, 							{
								"box" : 								{
									"autofit" : 1,
									"data" : [ 12159, "png", "IBkSG0fBZn....PCIgDQRA..ArB....6HX.....K9.HC....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wY6ctDbacclm++4bu.fTfjfTJwTBOBnsxhzyBS5EcMyXsvzKFldppmJzZS6tJ+fpptpXqMlobTltmEsnVzUOcTmpo1HmrnKSIkEYyHSWUlpZqdgoVHUYwTUS3MsWzJgLj.VzIxRffTDD3dOmYwEWfK.wabw8Av2uMhDB795bue2y4+466+gAhpHYxomQSiuDmyVDfMK.fTJyBv1fwjquyNYVykODI5ijLYxIEBsk.jKBvdsJ+Ox6Cf0n1e2Clae.3UHYxjSpoUXYFisLiwhznumThskRrT5zo2vAO7Hb.RjH1xRobkV09CHVd2c+p0cxiMBJXE..hG+bKBvWkwPxZ++Byk3PQ8tLIuOmquz1au2V8+iPh9IwhEadFCq0os+55X4LYxroCbHRfg7fUQiFcNEErZ0c2G3kCoiKNQQLaHcLFWh8z33AGof6lKH1Sq5KYRo7FJJAVY6s29YN5AOQOSxjSOiPnrV8Z++9iogWcTsxs+oNVA2Na8Z+wsTTTWlZ+6+LTFrJYxjSpqqsJig205mOspDW4z4wrin2v+1amMHtat.U81VoTlkwvxjdF9CLZ+KtBiw9.qe9zpR79ScLtvnZM7u8t4BfamM3IZ+kR4poS+Uqz2NnIF9BVEK14VoVcoByk3chT.Wb7hs01XOMNtc1f3dGpVy+iLkPvVlzyx6RhDQWRJwp019ewwKh2IRg1ZabffgamMH9jbAp5yI8L6uLzDrpQ5R7FktIcLtri2loxaLzfu3Xkp9boDephh1xjdVdGhEK17btbUyY30jEBqg2IRALspni2lOp.G27ogNQ6OomY+gA9fUMSWhKO0w37A67aRqk6cXf5pmgPHtlpZvUI8LbORlb5Yz0UWkwvOv5m+xgzw6DoPSGxe6xCNREezSCQ5Y1mYfMXUunKQ2vABFtat.3NYCV0mKkXaFStBomkyhYpnv47qZ8ymV0XH+KDt8FxemPi0yjsxN6jdUaeGNjw.Yvp5kuLcptDcK6owwMeZP7viNgdV2WHXqP5Yz+wPWJ1J0Nj+2tjtjcyP9aWNPvvG8zPjdl8AFnBV0LcId+oNtudSZsjJuBt4yBgeaAdUeNMU28OJ09uRsC4+UGUCWdptSWptEROS6mAhfUNgtDcKzTc2+oT6+J0lJJuTPAt7jG6ps+jdl1G95fUtgtDcCMaptoR2n2nQohxkmxa09S5Y163aCVUOcIL0kpeqKQ2xdZb7SeR8mpapzM5LZTIR0KohR+FROydCeWvJujtDcKoxqfq+MiPS0cWPyJQpexYN12z92X8L0Vgzyp93aBV4j5R7nBF0B1AVzY5rpRLaHca8gAZptaeZVpnzpRjpSwoZ+u2gAvMeJomY6huHXkSoKwcyEntEqrUraQ6azTcSktQEbpTQoQhgak9Q6OomY6gmNXkSoKQiFVVyvtG1IU5FmjFUhT1cpnzngk0Lr6gcR5Y1Z7jAqbJcIZxMHoDB45.7M..3b4LRIad.4h0ZLa1chF1nR2XXZptchRjBnwBdazqVwZls+LlXR.17.XoZa+cpWbR4mmGKXUuXcKcBcaWucpTkvbptG1rhllc80NKQpdIUBrCW6ncnQ4m2vrdldlfUMRWBm5lfNQTSmJITGlrhllYcK1YOWsijzrQuT0tmrGROypw0CV415RzKcuteX6H0iA4R2vOeMzoRiFROSCbsfUtstD1Yh3YGF5V6Pylpa+ldVCR8N0oJb5gcqnwwCV4TV2hSWhCCpmW1MMZUDpejJJNoETOndd4kvQCVMLzCjAodLZ2LLzCjAodL50vQBV4m0knaoeXix0C+fUzLLpsyv3878a5qAqn2x39S0saV5FzrlMbLZBmh9RvpFM989g0s3GF+tWO+w5G31Ao8R4iDomo8fsGrxs0kvNxzaiatJLuTh4..3b9yz0kazqk7fGHy766CGxsKQJuzveqEROydCaKX0fftDMpGPk2C1TOTZzCz1c.cmzJZ7BAh8K0PmeN2BcS54fUCJ5RDMZz43b150dCT8o2evvaLU289PkbJqaoYCwwu5NA9op1vKPOErZPQWhRAb2zZfpEBqU9AsT4UvCNRop8eoigdtGJNkOc0rUcEccrT2D3kDOt2YXTOytktJX0fltDwiGaMyaVByk3m8BGUW8C5m8PwMGFswC9rE6jdmFOdzUqs2TN6vXFrbTSZXzslNJX0f3EzjISNoPn8Tye+me1m2TgN62CG0sJnWoTlUQQet1I.P73maQFi+Il+NIPr8g62Q.uao6zVAqbRcIb5tpZ8AuEBqgqbl7s0eWiD52NRFOmzJZ9vudzx8bQJws1c2zK0p+t3wisk4CScx0r143YXzZbpGNk635mrV6VFrxIsTV2vOpiE6bqXFT3Jm43N9Fg945BmSjTs6owwak4Tk+cNWcplcLaM39KETfewYedOeL.Pqud0C2VOSuPR0ZkZGmUYhEK17QhLwFLF9KXL1Hle9Bg0ve+KjG+oiZOWnRkWAW8ONJ9+dP.TTZMPEtkhh9atyNOtuJ72DSL97LFad.fKNdQbV0Nqa1mOn.KDVCAY.OpHu74.iwlWHze+HQF+w6uettZXqYyd3y1e+b+pwGeh6yXxWAfcV.f8z43dGF.6owwrinif8vzjLFWh8z33QEM5cktt3yxkK2VM56OwDS7dLF6+B.ve0jE54g9kJuBt9SFAexId6N9TEEs+66ryiWOa1r1SW27YTp8e8Rs+uH.aF.fmpyv8NL.dTAN9OERzyCMLHC3BmRCWXTM76Kxwd5F2KvXXRFCKMwDS7JSM0o9MYydnq9BiSDrJYxomYhIhrNiwtJigIM+7WNjNt12NO9yGuXO8vgI6oww0eRH7OmMDdpt0Mn79BA6RoSmdUm3hyjSFYN.7mAXLLqt4sUAY.yNhNd8SoiCDrxO3aDjmsXjHi+FiO9DeYyBBzLxkK2V6uetedjHSjUJk+WMe4wiJxwu9f.nfj0SukcOcF9+k23spRoX6b4NXiF8ciDY7+ZyGZt7TcuFJGHX3FeyH3idVnxObXfLkPv9KSmN8+a29gCuBkZ+WKRjw2VJYuh4yk6nwwmcnJJHY37AE87ykmVQhu+XZ37AE3euPkY+lwv2SJ4KO93iwN8oOylt0KOpJXUrXmaE.kOw7lQfR5Rcliwe0jEvoU5cw8NPvvuZ+fXk+3HXGsJ2jVpj.9Q6rSlk61Gp6FFarwyy4r2CvnGK8RJWLFWhKbJMLaHc7eTTwRPX1YK8FpWbpoN0lc6Cg6ueteyTSc5etPnOpYuaJJY3KNVA26v.XZUI9NA57d57uWPwRvJ48aQvpkLu+naE7+1YCh+tmLB9xBUOijLF6uYmcxrjS196mX+8ys4TSc50z00N1bz.ls+a77.XLNrkI436Dn4iVXhIF6K2e+C9xddG0gT9tk3wisFmWQ.8vbIdyIJhqbliw20llkm6cX.728jQNwr7XnKQfk98+9c+M1xNpCHWtbOdhIl3RLFl7PAC6owwENUuUqVmUUh+GiYLjxTGqXowFyIDrKM93iMR29FprYyle+8y8uL0Tm5VRI6ULCbbnfgMdtJRkWAe2fhN5EK+5CBVt2f.xazraDmXhwmyLP4KOhdGEb7AGoh+W+gQwCORslg7KughRfE+8+9c1ns2XCojMa174xcvFSM0otkPveQFCeO.i1+GdjQ6+YUkcrbF0RyFs.iwdyHQFe6tUditEFP0hLCX+41iW2FKpcp3syy+9cwk1qVQyABFdqLmpbW94bsWrYsGIRDcI.1GCXHMvOa5iZ4wnWx5VFznYVQS+Nm2z0kuhSlWVrRokvVly126O0w1V1m2rrl1sstkZodI4ncVqdMK2gribGqaplf5j5Be5t6ldwlsep89k2X7h3xScbC29MJUT7Ryxzf.N0r1e0+f0QFIu+N6jYdaai2BTlXhwdOFi8C.LdS4xmt9230o32zkX+8y8uDIxDYQIw1AfspEvXbId8vF5Yk5XUKy7EaFNm8dF5Yc5M5VwKMFZvo+4Bg3bLlgaQTTZHb98NzHXwoUpL6eO7HUr5Sq9MkBg7uLWtbOtY6mrYylORjIxiRWm9xBJ3QE3HH2Pf1fLidR8q1OHt92TuLkW9OjNclE8Zs+9c5W5YVK+oipiec4YtmMyTScpa4TSDBKd7XqalGOq7sy2ydqie2T6cJCCreVboMpRCZNxK0ICI0ZIJ0VaceZk96GoeaEM27ogr1a4ejSk7nrDIhtg4I0+524ftdCMnoKgSnEP+dXRMpzMpde040EnI0p0YC1Cd9ZNaPk9k0ZmJuB9we8n.vXxwbJmavVBVc6rAqq.xCB5R3DZAzuMKuRFh3h.x4YLVjRkuxl.r04b0058rrWYYigdZbejQ4QgMjRrleu8ePfFom4UNS24Ro91fUW+IiTk.59QexoU3T1RqeeHzDdWZjUzzMkXlaErh25uRi4l0LSeFohPfYFjBTA.r81a+rc2Myxbt1KBHuu4mumFCq7GFAe3dihGUnmtTB.fKLpF9kQODucjBHrktnyXrOPWu3VIRDa4ddmPLThw8voWRWW9J.xTle90eRH7fSLC0dS55mvRkWoFsVjWZ2cSu3f7a+2d681ZmcxLuPfWuzPc.fwrF9dO9T3lOMDNPz60hz6Do.9kQeNVHbkdrUpK7+SIRDcyXwhMeOuSHFJISlLatyNYlSJwsL+rq+D64919MccvpaaQiJoTdigI66Hc5zar6tomQHDWSJkYM+7OIW.7VYNEtaMBl2MLFWhqbl73e7ENBubHqy.IaVNGed73wVOYxomom2QDCkXXEPF8v5vRItrWmtJX0iJvKKFrThsUTBrhcdP4WHc5uZEEk.yX8sTGVJQXeqLgQp7MzTKZalcDirD+Jm4XLsp0gFhefPn96hE6bqjLYxIaxlffntHDrxxJ3GBV0UCV05XbkRQGOaRwietEkRLGiwmqz1XSojsteb5sKctuTznQW0ZtMsmFC+3udTayEUWHbQ7pipcByoiy4WUWu3xIRD01LmNi7zQsTajbFgPtAmy1hyCr9f7v7G1Hc5zajHQzT.rYOTvPp7J1VdD1NT49L4LLFlSJwlLF1rQ2m0UyF3Gt2nk6YkPfWucmd5Vm2Oc+hWfWAmXY1peU5NsdoHavaldG1wZtx0tkZWuNafs59Lf5OC387TX09AphsFiw+jluTWwlUQg8uYTrr9S1c2uZcEE04pUOq6jMHdqLmpbouzKLsp.W6aanm0KUU1Hydst85WznQmynl+Z7MPLFKBmyuZhDQ2jF54fB7ML+ImPjci07fhazppefwXefPTbCq2m4HyYYoGdJevY5k3SqX7f1iJxqozSXebznQ2zu1CqRuMXkjImdMq1R6gBFt9SBg+O4BXK1R6riniewYedcrDZ1GGKVrsZ2WjT5McqyXnbRC9FiWrb9icfjg6te.KIsJaVccs0.PSK5YBhZQHJtg0pBYgvZkyyqCjL7vmqZIcnXyJDEWG.yCXC8rpUjLYxIkRTt1gVHrQtDsP3hX1QzwriniKNdQ7Ki97p5kfhBVqeer0uY6s2aqc2M8RBAdcq4m0us.G+3udTb8mLB1Sq2aBVH7Iu9wXs+0OiEaUid7FlKwO+rOGWdpiK29bgQ0JKxuks+OfRgBhNACy8zHPk48YW4L4q59rqbl7XkucdK4YH60LGoPeOXkPnsjYZ9+xgza3JgxXkVu9pLiWrYiFM5b86iOmfzoSuggUZHuj0gFduCUwO7wihamMXO2E7Zu9wXHog9YsFFqxrBcsuU9FVnqKDtHdaKkXDiAJIUIZaXL9Rl+7UNSiKn5KLpVskx1x.NPvJ.Y4GXt3DMW7tw3Rbwws9vfbfZXF6rSl0TTBLiPHtl4mcnfg6jMHduG265YMVI+qpBFVeayvnXWMdYxqNpVKGZ5EGuX425UqyTPPzHhFM5bl8d+kBJZYIpcwwKVUGWRlL4jNPvpJzN0P24CXcnL7AhdVYks2d6mkN8WsBmq8hRI9TyOeOMC8r50R247ApDrwzWqZFbtblx+ssg0gLFWVUaDAQ6.iwJKTd6VKsVuWVSSaNGMXUmBiIGXmwoR5YsXiJcmq+jQ5pgFNcG581BQkfUcCjtUD8Kp8kmd5fUCCXV5N.3GUqdVuUlSUUYM0NjpJm4jskMcXRP35PAq7HryNoW0nzcj2v7yL0y5sxDtsqL96teEcuXL4F19AJAgKAErxCQ6XEMMKUGt2gArTylxrbdf95pYMAgSBErxChoUzHkh2nV8rdqLF5YYsmVFqt0ifq+jPk+LoTtJUGeDCR3ObcKeNkLv+4sJlc6T316t6WsN.VuVao8dGVIKeCykUsnSXrswsn52iXPCJXUejRqTNqHDFkaCmWUPkqFOdr1xm5Sm9qVIYxjqVuh+7jApj2X2cyPIqIw.Gzv.6CjLYxIiE6bqHDp+tlWXvHImiO2nLDZNl1RqQ9YIugUqoEPdeoTdCNW6Eo.UDCpP8rxlIQhnKoqqsBmyqxcId4PF0+jwhbpwBOo4BCQImLXq1wOpJsR2PAjHF5fBVYSTZcFbE.1qwrLxrWcTMb4oJTk46M6HFKXpVWYfjRrZxjIIysifnAPAq5QL0kxX3dUhR8RAEszFXtxYxiGqYXjgLFKhPnsDPEGpfffnBjlU8.whctUz0U1zptTlKdj+hy971xupt7TGa42FrJbaBB6DpmUcAMx5h6lkk6yWiSeZWGiDDCZPAq5.hFM5bVWTHLoWWTHlVUdhUgYBBhpgBV0FzrkO9qb578j8DeffYIPk0zQfffvJTvpVPhDwVtTfpx9SdXtDWrzP95UrtdsIkLeomySP3DPAqZ.FNnIVC.IYVxEgEBqg2episkkTqGUfWSvJ+uuySPzufBVUCkpiu0.vIzk5xS0XeitS41YCV0hUJf79oSmYCaYiSPL.BErpDISlbRMsBKKDFK3ilLspDu+TG21VwZqHUdEb8uYjZDTWlhyCPos.AQSfBVAyRjo3pbN+D5RYmqhx+zmDxxZumIx6y4AVjxbcBhlyPcvpRkHyp.rYsVhLKD1Xo.paSEAqbffgamMH9jbUux0X3SUhkKYCLDDDsfgxfUkJQlUMVJopDk5kCYTyd85JkrI2MWfZVooMbvSoTtJ42TDDcFCUAqL0kRWmsr0kJ8vbIt7TEJuLV2qjJuBt4yBgeaMKoVRItkhRfkog7QPz4LzDrpQV2xaGofspK0MeZP7vSr3NHuuPvVoUlrGAAQiYfOXUmXcKcKGHX3t4Bf6TyxlkThsYL4JsiOUQPPzbFXCVYThLl1.bmYcKcB26PCcops19DBw0TUCRKZCDD1DCjAqLrtkhKWaIx7NkFxmcPp7J31YCdhTQPJwmpnns7N6r2V1xNhff..CXAqrSqaoQrmFG2NavxN7YEjoDB1xjtTDD8GFHBVUoDYrWqaoVNYIxXjJBLFVlzkhfn+huNXko0sHDmz5VryRj4AGohO5ogNgtTRo7FJJAVgzkhfn+iuMXUxjImTHJtAiwl07yrSqaAvvUDt4SaTIxnuToUZFBBBG.eavJgn3F.UBTYmV2xABF9nmF5D5RIknzhRZlM54cBAAQGguLXkwhBpQfpvbIt12p2bqSqznRjgwXqr6tooUdFBBWBeYvJFiuj4OekyXO4LU8stEpDYHH7J36BVYLyeFolvKETzyhn2LqaQWGKmISFxpgIH7.36BVoooNCuT8AOandagZfrtEBB+C9tfUVoaES+dGF.27oj0sPP3mvWGr5QE5rET5lacK5qPoh.Ag2EeWvpzoSuQ73QyxXrHO7HUrmFukYnNYcKDD9e5rtl3YfUVOo+1+3H3.Q8WMiM0k5G93QqJPkTJyBHuzN6jYdJPEAg+.eYvJEE0kMB3.7aKvw683Sg6cXEgxMWO9duGeJbmZxYJgPbMEk.yP0xGAg+Be2v.A.1d6seVznQmmykavXrH6owv0eRHb8mDpg+Mj0sPP3uwW1yJ.fLYxroPf4MR0flgLkPfWe2cSuHIfNAg+EeYOqLoTBaNShDQWRJYKBf4XLjrT.rMYL45zv8HHFLvWGrxjRAjVykOLHHH5i3aGFHAAwvEd5fURIiJd39LbNumtFqppR0NIQeg8zpN7jiFrpcx37GUrx2QJEzCB8YDBT9Zb6VQ.VaiH2nfncPJkkuO4AmH4rqOorXt.pppa5.Aqpj.m2tl0UuZwX82qx2gw.ErpOi0dF8viTaY.KqdPuThOs+dzQLnPlLY1zZtQlJestbR0buCCXwtljo1d6seVeOXEmqst4A4CORsgArLcmSyCPoDaSNeP+ms2d6mIk3Vl+9O8aF4Dc+1jT4UvG8zJ4xFiIo1Gh1FoTV17Ju5ebjF9hQC6Dup3DqB3.CCb6s2aKqGj2IaP7g6MJdvQp3.AC6oww8NLPorP2ZIwfk52GaDFTaEA7Ce7n31YCV9loT4Uv0exH3G+0iZ4uRdeJsPH5DTUCtpYdQdnfgO7qO48Y27ogv683SYopSjoLuOyQRcgzo+pUhGO1LFqNx.ewwJ3K9CMqafxKQ9btyQsUDvgBFtS1f3NMbX6xTbdfEczCRBeOktOaQNGcx8Yya9a8bOqhFM5bsy2a2cSuD.9QluAutGZRrsTJdC5M1NOYxjYSEE84.j2uYeOoTdCNOv7jv5CJHl27mriEakVgw8YAlo02mgaU68YcUOqlcD8x1.rhBadf1SH7c1I8pISlbMgn3hRIadFSNSoCrMAjaPZT4tTpbjlOZznywXxE4b17.FoPBigM3bs0oRVZvBFiWtyFmOf8rX.2JJE.5D2mA.HDxMTUEqUu6y5pfUWXTsxccSJwxnj.XcvA5Zfx3bOKkJiIZlXGvoz5YvO.vXUhxtVgnZW5z6y5pgAd9fBLspQWFYLjzXowhffvOgPnrl4OegQc1.UcCcslUu+TGWYiv4WMQhnKYGGPDDD8ehGO1Z.rWCvnWU10pXd+jtNX0EFUCKD15xfE6iiE6bqjLYxIsgiKBBh9.ISN8LIRDcCyYlG.3xSUnkVCtWfdZ1.e+oNFuTvJmjbN+p55ZaR8xhfvaQxjImLVryshPn96L6QE.vaLdQrP3ht4gVaSOkmUiwk3Wb1miq+jQJmPmLFRBv93DIhtDsXL3MHZznyonvlWHDk60qTxV2NW.WiG+bKJkn7LKw4rs3b8MnYOz8IQhnKoqqsBmySZ9Yg4Rb4oJ3aBTAXSIE5UNSdrP3ZWlqXuFmiOOd7X2RQQkV90cAhEK17btbEy2jx4U0Q5qlHQzdd08IQhXKKkxUXLVDVMqaGBgJLZ+0nk4LW.qs+Vaad0Q07MC8yJbq1vRqJtvlwriniewYeNd+oNFgsjbYLFdWc8haQyXnyQxjSOS73wVmywmasK+mDiWnzsCa2PjV7OwXrHMbOvv6pqqrIomoyQxjImLd7XqUa6+KETf+wW3Hbsuc9dJPkUWSnWsXnNAkHQl3r.3OCvnXhe8pDMuy4OIj.+4iogBRF9xBFA+XL1HLFa9IlXhKMwDis096evW1yG4DmfjISN4Xicp+ZojuFiwl07yCyk3OcDc7lQJhKbJion9aDLTTZ95V1hQhL916uet1dXgwiGaMqhzNspDKDVCuYjhHQojKbOcidxY19KDh+xHQF+Ycx9gnyHVryshTJ9ULF6+r4mElKwe0jEvO4LGiyp1aYo9ABF9nmEpbs6oqK+axkK2i6si51ClQhgo96L+fqblisswwtmFG+zmDpb1tWA4800wx1olIC6TxG5WwPyvJ71QJfKNdwSTJEltbgoViRoLqhRfYZmgqaL7B74l+96O0w3hiex6YnEWVmi3wO2h.7Uqs8+MFuHdmHErsRowp9zkJl84skMbafR1rG9rwGeLFiYjx6OrjaH7mDRff0esCssYLtDe+wzvrgzQpiUsTI0rY3b16MwDiO0TSc5eS1rYy2a6ogWhEK17SN43qAv9.FCkGl0qNpF96eg73BmRqtsiAY.W3TZHUdErmNGLFaDoTr296m62zp8YjHSrJiguGfQvv2bh5+xsw3R75gMZ++OJpfmpWo8mwvRSLwDu3TSc5Mn1+tmnQiN2jSN9uhw3+Os19+xgzwOa5730CW+1+Nk8z33p+gQp5EOBA6R4xkaqdeq2dT9zHd7XqyXFodOP+Y1Btc1fUYda.FuQmwXqryNoa6R1gvXHe55ZqZcnX.F5Rb4IOtsKchT4UrX8Ks2aJSjHlDv3djeYzm21u09t4BfaWyhNqTJyJkxUSm9qVos1HD.vr8u3JLF6Cr94SqJwUNcdaqzYLWUy+jbAp4+QdIm1vApJla73QWs1S9N8l+VQsC+vDCGW.KQCMn0DK14VgwXKaUXayrPtdCGqU7e62OF.LBbr6tYZpH3VGBnwauOpi1WM5leCeNRrLUL6sFqy.q4mElKwEKMjO6h6cX.bymdxWtvXXY2vYTNQGDqc5tMwtmtSC2.r95Yw45KQS08IoeoKwakIbYGZcmcR2zAMXMX0aLdQbYKkcUm.omYmSrXwlmwvZ019uPXM79ScrsoKUp70lFRFHkvUSCkFdiYmJXa2xCNRsJ6L1DgPbMU0fqR4mkYRchUq8EHubHc7SNyw8zKPNPvvaraX.XZkzomoYeeqSHS2zypZIUdEb8uYjSz9KkxannDXEp827ZtxZ0q8+xScLNeP6oCDd8IDoouEMYxjSpoUXYNmeUqe9zpFC4vtzyxXghHPCzyxc5xoW.mPWh6cX.b8mX3q5RI9zc2McKc.z3wi9Lygf7Ki9bao21jdlmjl8726O0w3Bi1aoYjIlO+UqicJkXaFSthW44u1ZdBRlb5Yz0UW0p.7.FQ1emHErM8r1SiiamM3IzyBPlRHXK61Q1cRbBcINPvvakoJ+ttsDM0ZNVYG8tx5wComoAFirAqVu1e6bjM26PiI8vOLxlNZRMKom0p.UR3P.iwL+NQrO8rRkWA2NavSnmgaOlYm.mTWhpG9kL0N6josrz53U0..vCpjDQAQknZiWdoro4CR1wvQsxvrdldfmw9TEEsk8hWi6pLvnYQ8chYiPJkq50h52q3l5RHkxrBAluSD01nDcXer4u2Odq+vjdlznWZMcc5h0L8TFFGOc2hSqKwI0EBaKDxE6lYeqduzhzyryvr8udohhykmi9iqi8bts5EloB+5TcOHnKA0iftG2dF28ay3pMjH9FzHsVr6ZSpwS0M7MVQyfntDM6bxt0Zyuo0RsznTQgxkwlisErxD6N6paD9wR2vo5ERilUMmnWHtc1U6k0yrQkHkSUhL98YU01CVA3MZT7Rktg2PWBmKekH8LOIzKw6c5KAqLoel40VoYktga2c2gYcI7B5Y51YdsSYcKCBxizJ5qAqLoQMXCxOvR0XYEbR8LabMs4rOv1r.0N0Kp8qS7TivQBVAL7LTH6x5VZE9QcIFFFJjWXHvdIIPrSbrfUlTRj4UbhGlc5R2XX3gwdkAY8LoIWn+hiGrxD2dXR14TcS5Rz43EzyztFlzvt0s3T3ZAqLwOmXjCROv4V3T5Y1OrhllkJJCKSffShqGrBv+YEMNokxNLnKgeSOS+18qCJ3IBVYhe3MUjtD8O7C5Y5mGIfeGOUvJSbaM..j2G.qIDrsL+DFStH.aQRWh9OtsdlFs+r0EBTd30bNlSJwx0q82uVhT9M7jAqLwM6ESqvK0auAUbpdwzn7yqY3T81yOWn11Md5fU.NedqTq9.0hyYcKCm5RTKts9P0hcueA7FkHke.OevJSbpLBFv3MsOp.G6owwi0X37AE3rpBLaHcaqmT.jtDcBNUQfCXLTrTGqTU6+XbItvnZ1Z6uWphK7C3aBVYhSkSS8SHcI5dbJqnoehWtVV8x36BVYhSks31IjtD1GNkdl1I9EWBwqhuMXEfyU5F1AjtD1ONkdl1A94RjxqfuNXkINkyK1MP5Rz+worhltgAoRjxsYfHXkINk2Q0N3GrtkAMbJqnocXPbMCvsYfJXEfyV5F0C+n0sLngapmoex8R8aLvErxDmpzMrBoKg2A2POygwRjxIYfMXkINwJICoKg2EmvYLnRjxYXfOXkI8iR2XP15VFzneXEMChqkgdYFZBVAXeq9wCKV2xfF1kdlTIR4NLTErxjdYptIcI7+zK5Y1nTQgJQp9OCkAqLoYVQyBgKV9l1CDLj5XiRjgzkXvglYEMWb7S19e28CPkHkKxPcvJSpWoa.XL7foUk0wuq.FlstkAMpmdll7RAE0s8mREEmGJXUIZToaTKjtDClzH8LqEpDobOnfU0fodF.X9pGdnLE.aMNWcMRWhAWLZ+UV9jtBqLkPHWmzkhffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffvYouaQLwhEa9989vNwtLSM+x4spp5l8hkmX3CTZy0KaO+x0p5gTJeVutvfT60PuLtoYC1WBV0Hi42uP2ZUw92y6Ne03IZznyw4rUXL7CNwVqCu9kHQLmaoRtOP2t1P1rqgdUby0a.aOXUoFf0q0Wy8aHkxrBAluce.dv37Vdo1wATSjH5R.rOtoaoNvQU86AqpfLEmGX914g314ZnWFoDaKDxEcxkaNaMXUoUA2Ms9.6KETz1KwUtMOp.GO7nJqAbsa.K+548dZb7fiTpZk5oUArhG+bKxX7Ow72Cyk3BipioUEm35G.ftt7UZ00OqAqd6HE53yC2jGbjZMdzdqCX0rqgdYRkWopELCoTlUQIvLNUOrr0fUwiGaMyk2nvbIt12p+rLc2OYOMN9a+iiX4FP482YmLy2r+F+748ABF9nmFp7B0YytArjO0uk4Pbe0Q0vUNywUs.gV60OoDau6tomoYGCVCV8u9cNvNNsbTdvQp35OIT4f9Bg3ZMZHgsy0PuLOp.Ge3WOZ4yUoD2Z2cSujSruq2x1RWQxjImz55v1O6ENx27.qUlVUfe1KbDBW9lG1qEMZzFJ9oe+7dLtDW4L4wKGx3XlwXQDBskp22UHJtn4CYuTPAt12N+IdHy752zpxRaOjzX0PdvkKLpFt12Je4emwXK2nua6bMzKy4CZz9ZBig2MYxjS5D6aaKXk0YyXgvZMcgB0qyXkVV4MgwjM7gsAky6KNQkyWoDyWuuiTxJec3cZxv0FiKq5+WJguXlt5ElcDc7RkZ6YLVjF8Bt18ZnWlyGTfEBWQhCc8By6D6WaKXEfXdyexqO161gYC0t8NZv371p9ZLlrtuoz5m2J83lVox0BNmMeud74Gn5qgrVdMr8uGy6g0QO3TuLxFCVQPPzI3mF9WsbfK7dYJXEA.LDI1DojQqKdDMkT4qLqfLFbjzWfBVQfCDLb6rAK+6LlbcW7vgviSp7JUkhJJJA2vI1ups9qPLHS8R0.Ek.TvJh5hYZZXhTJugSkmUdhfU6owwmcnJdTANNPX+U.zriniYCo6IRofa9zP3QE7Ncn0ZR9A.HkXIu7xi9iJvwMeZnV+E6ANqpDSqJv2OrlmZRSdvQFOiXcHXNI6oywdZUk.woTTBrhSs+c8fU27ogvmjKPece7EGqf6.fWNjtqmWKOp.+DAH7BXVdLoSmYC29XoYbff02u98EGa7u2IaP71QJ35oXviJvwO8aFolLk2so8KsH6BW8r+5OYj9dfJq7EGqfO7qG0w1e9ALJLUbKEE84Zm53aXi6jMXU544zbffgO7qG0yDnRJw1kJIq4b5df6Z8rJUdkxk3AfwXekRVeRqDw7lNgvus.G26v.XgvEa8eVeFg.utat+UU01pScVBuDRItkTh05GaaFCKa5FB2IaPWaHgezSCYozVL58qPv1xwOPPuamP8792s1w26vJ8npY0RkMwFwietMAXeB.vmcfpmHXka5MPCBHkhsRm9q1nOs42Hd7XqaFv5yNT0UFN3CNpxPd6DW.YPDWqukO1hPcppAWseu+1c2uZcoTlE3jhJSPTOjRT99R2XRQ1SiawQLj2eXNPEfGIOqbLKlvgRdMhAO5GyRcq3wZN+9zKimHXEAAAQqv0ScABBh1hI8BdUuapyJErhfvW.aVNGetaeTDOdzr.r0UTTW1omYPZXfDDDsMLFKBig2UWu3VMyTJ6GP8rhfvixYUkdJOo2pG6yXrHbtbijIS5XdvNErhfvixzpBWuTepEqdvNiwhnqqsJ.VxI12dhfUNmvg02ALIHHZOL8f826wmB.k8fcGQ+JOQvJmS3PJuUHH5UL8fcyxkqjGr22sUHRfcBBhNF2vC1csdV4WWEXHHrKNPv7s9vt0EDDmBWKX0km5X2ZWSP3ZHkrsXL7Z..O7HuQA06WfFFHAgCBiI2v7muc1ftRMG5WgBVQP3fryNYVyv.6.1SyvX87R1bsWFOwrARPLLgPHWTQg8uA.7aKvw683SgWJn.iw7F5Wc9fhVJSyiJ57AXofUDDNLYxjYyXwh85LlbcFiEA.dFaKtcwMF9p+5JDAw.BoSmdCEk.yXXm2FlBIQyg5YEAgKQor9dY.rbxjImTSSyQKL3ZoaSNamxTKofUDDd.JE3ZC27XHQhXc0emTxGrKj46cX.W01V8ZEHJAAQyw0BV8YGn5pKbCTvJBB+Ej.6DDD9B7DZV4TK1mbtbU.1rNw9hfvOQxjImTHzb6CilhmHXkSYB8IRD00VMYI7ev4xYLsUnA8BuWWuv7Llw.s7pEWMMLPBh5PznQmy5hb52c.NXUxjSOC.u745ENkdS91tGdhdVMrRhDQ2vM2+kb.fM4bs02d681xMOV5FXL9RIRDc99zV+0L+ooUk8M2QHYxomQHTWTJkyvXNiuPUKBA60XklX9oUk3UGsyFNHmi4fCj1ETvJWkJOP3J6cCqJ4cEB0+o3widic2Myxt4wSmBigj.rj8y8QXtDW6acTeYaGK14VQH3WE.fwbe2Wv7bsSGFnPHbD6BmBVQ...Fi8AIRDcdNOv7N85AmWkEBqg2IRALsp8ODvDIhtoWZxd5mmq1ETvJGlKO0wdFOL5.ICO74pk8Ra.1r55EWAFk.hmjyGTf+wWn+zSGSFiK6qBpGOdzplU5EBqgW8TZthqKzsmqtwDNPAqbX7ZypzEFUCyNR.b8mDB.F8vJYxoW0qpg0XbYU9+seCCMpXef4uekybruzsPci.qzrARfEBWDKDthnp55Jd1dV42QSiuj4OuPXMeYfJ2BJXEA.pt7ibqYkZX.NmMu4OewwoR9pSfBVQ..3oEVcPEulj.dcrsfUbNaqN46umt6FmrUhbefr8DAuSOu8prmVm0dzIeeobv3ZTqnedMzqQJKlP.m6LVDisc0RWuhAbcuCCzzuap7JXux1CiLkccLzJr9PSkY.q9b28qbNzr.Rcx4sWlOyx0Cor9lol0O+yZw0OqWKbJyYyM4.ACO3nJO.qpp1yWC8xXs8UWuxJ1S+DaKXUlLY1z5p1w0exH086cffgq+MV++XqYWGCsBoDk2W2NavFtphbuCCT19ZjRYVNOPCWZra2yauLOp.G2MWka9jRVcOeEhJW+tSKt9Y8kAbtVeeoE2s4idZHbX4dqKueixUs18ZnWlq+jQJ2YCoDamISFG4kQ1pgRMwDisEiwdS.iU+hT4Uv2Mn.mVQhCDLrwyCf+l+vH3o5UNQUTTeurYyl2NONZD4xkaqHQF+0AXyTTxvm+bUTPxvYUkXLtDOp.G+yOKDtS1fk+ajR4+vN6r6+Ry1t0679rpRbVUuYAgZxdZFAotQMOns6tYVode+b4x83IlXhWgwv2C.3WefQ.Nyqe6owwsyFD+yOqpqe2Xmcd7upYGGQhLQ48meymwdvQp3FeSH7vipDbVHXWJWtbaUuueqtF5k4QE33FeSHrwys1iPwk1e+C9RmX+a6YmX73wViwv61pumTJyJDXdmJprIISlbRc8haYtphzLjRbqc2M8Rsy1scOu81HS0pLX2vJQJtQ6k80sd6A.jHQLu8SocDxKsyNYVqYeiN6Zn2kN44C6.auOnkN3+QMeE6PlxMBTAX300JJAlAPd+l88jR4M5jFh1671Ki79sSfks2d6mw4AlWJwm1zslTdigoR2wncu0Ap.Z+qgdYDBw0bx.U.8gdVYRIy7ZI.4hlelQU9K2ncZPcBhEK17LFVhwjyX9YBgbCUUwZcaFbWuyauLRI1TJYq2MdJlw0O4hVyKKoDapnn2QY.ua69D8BRI6YLF1fyUWqaBLWuqgdaXq6Vtzw+e3S+zq4ohOdD.....jTQNQjqBAlf" ],
									"embed" : 1,
									"forceaspect" : 1,
									"id" : "obj-37",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "jit_matrix" ],
									"patching_rect" : [ 18.0, 18.284363, 72.0, 56.829431 ],
									"pic" : "ACIDS_logo.png",
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 14.284363, 72.0, 56.82943 ]
								}

							}
, 							{
								"box" : 								{
									"angle" : 0.0,
									"bgcolor" : [ 0.094118, 0.113725, 0.137255, 0.21 ],
									"border" : 1,
									"bordercolor" : [ 0.415686, 0.454902, 0.52549, 1.0 ],
									"id" : "obj-160",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 7.0, 7.0, 405.0, 283.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 4.0, 3.0, 405.0, 283.0 ],
									"proportion" : 0.39,
									"rounded" : 16,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.917647, 0.937255, 0.670588, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-36",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 489.0, 250.0, 87.0, 22.0 ],
									"style" : "",
									"text" : "s ---winclose",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-35",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 489.0, 219.89032, 87.0, 22.0 ],
									"style" : "",
									"text" : "closebang"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 489.0, 106.0, 63.0, 22.0 ],
									"style" : "",
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 489.0, 138.0, 534.0, 22.0 ],
									"style" : "",
									"text" : "window flags float, window flags nogrow, window size 100 100 818 162, window exec, title Window"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 489.0, 170.284363, 73.0, 22.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"style" : "",
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 489.0, 70.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"source" : [ "obj-35", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "AudioStatus_Menu",
								"default" : 								{
									"bgfillcolor" : 									{
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
, 							{
								"name" : "m4l",
								"default" : 								{
									"fontsize" : [ 10.0 ],
									"fontname" : [ "Arial Bold" ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 700.5, 638.5, 58.0, 20.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p Window",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "Window"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-129",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.5, 610.455811, 50.0, 20.0 ],
					"style" : "",
					"text" : "pcontrol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "pictctrl",
					"name" : "ACIDS_logo_ctrl.png",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 761.0, 494.0, 76.0, 58.455811 ],
					"presentation" : 1,
					"presentation_rect" : [ 93.0, 5.087875, 48.683167, 37.5 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.180392, 0.207843, 0.243137, 1.0 ],
					"id" : "obj-71",
					"interpinlet" : 1,
					"knobcolor" : [ 0.792157, 0.219608, 0.133333, 1.0 ],
					"maxclass" : "gain~",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 913.713379, 494.0, 35.0, 89.517578 ],
					"presentation" : 1,
					"presentation_rect" : [ 9.168503, 10.96936, 81.0, 15.716751 ],
					"prototypename" : "M4L.black.V",
					"stripecolor" : [ 0.094118, 0.113725, 0.137255, 1.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 18.0,
					"id" : "obj-19",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 355.0, 576.0, 216.0, 27.0 ],
					"style" : "",
					"text" : "Graphics"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 18.0,
					"id" : "obj-18",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 218.0, 125.5, 216.0, 27.0 ],
					"style" : "",
					"text" : "Config"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 18.0,
					"id" : "obj-17",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 551.0, 155.5, 216.0, 27.0 ],
					"style" : "",
					"text" : "Downlink"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 285.0, 535.0, 53.0, 22.0 ],
					"style" : "",
					"text" : "external"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 285.0, 500.0, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-15",
					"ignoreclick" : 1,
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "acids.button.graphics.maxpat",
					"numinlets" : 3,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 285.0, 573.0, 30.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.375, 38.75, 30.0, 33.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 180.0, 535.0, 50.0, 22.0 ],
					"style" : "",
					"text" : "internal"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 180.0, 500.0, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-9",
					"ignoreclick" : 1,
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "acids.button.graphics.maxpat",
					"numinlets" : 3,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 180.0, 573.0, 30.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 3.875, 38.75, 30.0, 33.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 735.0, 312.0, 74.0, 22.0 ],
					"style" : "",
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Helvetica Neue",
					"fontsize" : 10.0,
					"id" : "obj-5",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 735.0, 343.0, 128.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 43.5, 42.75, 113.0, 18.0 ],
					"style" : "",
					"text" : "Server status ...",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 735.0, 279.0, 68.0, 22.0 ],
					"style" : "",
					"text" : "route /print"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-10",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 39.5, 94.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-3",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 500.0, 290.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 316.25, 185.0, 90.0, 22.0 ],
					"style" : "",
					"text" : "s #0_to_server"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.01 ],
					"blinkcolor" : [ 0.439216, 0.74902, 0.254902, 1.0 ],
					"id" : "obj-1",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"patching_rect" : [ 39.5, 336.5, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.75, 35.75, 32.125, 32.125 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-203",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 39.5, 396.0, 87.0, 22.0 ],
					"style" : "",
					"text" : "print to_server"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-196",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 122.0, 280.0, 88.0, 22.0 ],
					"style" : "",
					"text" : "r #0_to_server"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-152",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 828.5, 276.0, 24.0, 24.0 ],
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
					"patching_rect" : [ 828.5, 191.0, 92.0, 22.0 ],
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
					"patching_rect" : [ 828.5, 230.0, 124.0, 22.0 ],
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
					"patching_rect" : [ 551.0, 279.0, 87.0, 22.0 ],
					"style" : "",
					"text" : "print server_in"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"blinkcolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"id" : "obj-134",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"patching_rect" : [ 656.5, 279.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 19.25, 35.75, 32.125, 32.125 ],
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
					"patching_rect" : [ 551.0, 195.0, 92.0, 22.0 ],
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
					"patching_rect" : [ 551.0, 230.0, 99.0, 22.0 ],
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
					"patching_rect" : [ 328.0, 308.0, 37.0, 22.0 ],
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
					"patching_rect" : [ 227.0, 308.0, 84.0, 22.0 ],
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
					"patching_rect" : [ 147.0, 308.0, 70.0, 22.0 ],
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
					"patching_rect" : [ 122.0, 347.0, 162.0, 22.0 ],
					"style" : "",
					"text" : "udpsend localhost 1234 flow"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 236.25, 218.932373, 94.0, 22.0 ],
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
					"patching_rect" : [ 236.25, 188.0, 48.0, 22.0 ],
					"style" : "",
					"text" : "port $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 130.25, 218.932373, 86.0, 22.0 ],
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
					"patching_rect" : [ 39.5, 219.932373, 72.0, 22.0 ],
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
					"patching_rect" : [ 130.25, 188.0, 48.0, 22.0 ],
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
					"patching_rect" : [ 39.5, 185.0, 50.0, 22.0 ],
					"style" : "",
					"text" : "host $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 39.5, 137.932373, 151.0, 22.0 ],
					"style" : "",
					"text" : "route host port_in port_out"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 18.0,
					"id" : "obj-23",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 147.0, 393.5, 216.0, 27.0 ],
					"style" : "",
					"text" : "Uplink"
				}

			}
, 			{
				"box" : 				{
					"angle" : 0.0,
					"bgcolor" : [ 0.094118, 0.113725, 0.137255, 0.21 ],
					"border" : 1,
					"bordercolor" : [ 0.415686, 0.454902, 0.52549, 1.0 ],
					"id" : "obj-60",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 558.713379, 408.0, 120.0, 120.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.168503, 1.087875, 147.0, 63.787125 ],
					"proportion" : 0.39,
					"rounded" : 16,
					"style" : ""
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"midpoints" : [ 236.5, 338.0, 138.0, 338.0, 138.0, 343.0, 131.5, 343.0 ],
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"midpoints" : [ 156.5, 338.0, 138.0, 338.0, 138.0, 343.0, 131.5, 343.0 ],
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-121", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-125", 0 ],
					"source" : [ "obj-124", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"source" : [ "obj-124", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-129", 0 ],
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-129", 0 ],
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-13", 0 ]
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
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-134", 0 ],
					"midpoints" : [ 560.5, 265.0, 666.0, 265.0 ],
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
					"destination" : [ "obj-3", 0 ],
					"order" : 3,
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"order" : 0,
					"source" : [ "obj-142", 0 ]
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
					"destination" : [ "obj-152", 0 ],
					"source" : [ "obj-168", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"order" : 2,
					"source" : [ "obj-196", 0 ]
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
					"destination" : [ "obj-124", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-4", 0 ]
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
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-6", 0 ]
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
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-93", 3 ]
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
 ],
		"dependency_cache" : [ 			{
				"name" : "acids.button.graphics.maxpat",
				"bootpath" : "~/Coding/git/acids/flow_synthesizer/plugin",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "internal.png",
				"bootpath" : "~/Coding/git/acids/flow_synthesizer/plugin/graphics/icons_white_50",
				"patcherrelativepath" : "./graphics/icons_white_50",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "external.png",
				"bootpath" : "~/Coding/git/acids/flow_synthesizer/plugin/graphics/icons_white_50",
				"patcherrelativepath" : "./graphics/icons_white_50",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "ACIDS_logo_ctrl.png",
				"bootpath" : "~/Coding/git/acids/flow_synthesizer/plugin",
				"patcherrelativepath" : ".",
				"type" : "PNG ",
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
				"name" : "m4l",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
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
