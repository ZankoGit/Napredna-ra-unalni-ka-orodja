(* ::Package:: *)

MonteCarloPi[n_Integer] := 
 Module[{points, insideCircle, approxPi, plot},
  points = RandomReal[{-1, 1}, {n, 2}];
  insideCircle = Select[points, Norm[#] <= 1 &];
  approxPi = 4 Length[insideCircle]/n;
  
  (* Izris grafa *)
  plot = ListPlot[{
     points,
     insideCircle
     },
    PlotStyle -> {
      Gray, PointSize[0.02], 
      Red, PointSize[0.02]
      },
    AspectRatio -> 1,
    Epilog -> {
      Blue, Circle[{0, 0}, 1],
      Dashed, Line[{{-1, 0}, {1, 0}}], Line[{{0, -1}, {0, 1}}],
      Text["(-1,0)", {-1, -0.2}], Text["(1,0)", {1, -0.2}],
      Text["(0,-1)", {-0.2, -1}], Text["(0,1)", {-0.2, 1}],
      
      PointSize[0.02], 
      Point[{1.8, 1.1}], (* Legenda za krog *)
      Point[{1.8, 1.0}], (* Legenda za kvadrat *)
      Text["Circle", {1.9, 1.1}],
      Text["Square", {1.9, 1.0}]
      },
    Frame -> True,
    PlotLabel -> "Aproksimacija \[SHacek]tevila \[Pi] z metodo Monte Carlo"
    ];
  Print[plot];
  Piaproks=N[approxPi];
  Print[StringForm["\!\(\*SubscriptBox[\(\[Pi]\), \(aproksimiran\)]\)=``",Piaproks]];
  ]

