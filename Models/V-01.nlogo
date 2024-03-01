; Election Systems ABM Pseudo-Code for NetLogo
breed [voters voter]
breed [candidates candidate]
breed [partys party]

globals[

]


voters-own[
  policy-A-importance-values
  policy-A-preference-values
  policy-B-importance-values
  policy-B-preference-values
  policy-C-importance-values
  policy-C-preference-values
  policy-D-importance-values
  policy-D-preference-values
  policy-E-importance-values
  policy-E-preference-values
]

candidates-own[
  policy-A-positions
  policy-B-positions
  policy-C-positions
  policy-D-positions
  policy-E-positions
]

partys-own[
  party-policy-A-positions
  party-policy-B-positions
  party-policy-C-positions
  party-policy-D-positions
  party-policy-E-positions
]

; SETUP PROCEDURES
TO setup
  clear-all
  setup-states
  setup-voters
  setup-candidates
  setup-parties
  assign-averages
  reset-ticks
END

TO setup-voters
  ; Create voter agents with policy-importance values and policy-preference values
  let number-of-voters abs(round random-normal voters-m voters-sd)
  create-voters number-of-voters [
    set shape "person"
    set size 1.5  ; Adjust size for visibility
    setxy random-xcor random-ycor
    set policy-A-preference-values abs(round random-normal policy-A-m policy-A-sd)
    set policy-A-importance-values abs(round random-normal policy-A-imp-m policy-A-imp-sd)
    set policy-B-preference-values abs(round random-normal policy-B-m policy-B-sd)
    set policy-B-importance-values abs(round random-normal policy-B-imp-m policy-B-imp-sd)
    set policy-C-preference-values abs(round random-normal policy-C-m policy-C-sd)
    set policy-C-importance-values abs(round random-normal policy-C-imp-m policy-C-imp-sd)
    set policy-D-preference-values abs(round random-normal policy-D-m policy-D-sd)
    set policy-D-importance-values abs(round random-normal policy-D-imp-m policy-D-imp-sd)
    set policy-E-preference-values abs(round random-normal policy-E-m policy-E-sd)
    set policy-E-importance-values abs(round random-normal policy-E-imp-m policy-E-imp-sd)
  ]
END

TO setup-candidates
  if Partys? = False[
  ; Create candidate agents with policy positions
  let number-of-candidates abs(round random-normal candidates-m candidates-sd)
  create-candidates number-of-candidates [
    set shape "star"
    set size 2  ; Adjust size for visibility
    setxy random-xcor random-ycor
    set policy-A-positions abs(round random-normal policy-A-position-m policy-A-position-sd)
    set policy-B-positions abs(round random-normal policy-B-position-m policy-B-position-sd)
    set policy-C-positions abs(round random-normal policy-C-position-m policy-C-position-sd)
    set policy-D-positions abs(round random-normal policy-D-position-m policy-D-position-sd)
    set policy-E-positions abs(round random-normal policy-E-position-m policy-E-position-sd)
  ]
 ]
END

TO setup-parties
  if Partys? = true[
  let number-of-candidates abs(round random-normal candidates-m candidates-sd)
  create-partys number-of-candidates [
    set shape "circle"
    set size 2  ; Adjust size for visibility
    setxy random-xcor random-ycor
    set party-policy-A-positions abs(round random-normal party-policy-A-position-m party-policy-A-position-sd)
    set party-policy-B-positions abs(round random-normal party-policy-B-position-m party-policy-B-position-sd)
    set party-policy-C-positions abs(round random-normal party-policy-C-position-m party-policy-C-position-sd)
    set party-policy-D-positions abs(round random-normal party-policy-D-position-m party-policy-D-position-sd)
    set party-policy-E-positions abs(round random-normal party-policy-E-position-m party-policy-E-position-sd)
  ]
 ]
END

;; Divide the world into 50 states and assign unique IDs
to setup-states
  clear-all
  ; Iterate over all patches
  ask patches [
    ; Calculate the "state" based on the patch coordinates
    let state-x int(pxcor / 5)
    let state-y int(pycor / 5)
    let state-id (state-x + 10 * state-y)

    ; Assign a color based on the state
    ; This example uses a simple method to pick a color from a predefined list based on the state-id
    set pcolor item (state-id mod length base-colors) base-colors
  ]

end

; Designate patches with lower and higher averages for a variable
to assign-averages
  ask patches[
  ; Assuming 'n' is a predefined number for lower/higher states
  let total-states sort patches
  let conservative-states n-of conservative-districts patches
  let liberal-states n-of liberal-districts patches with [not member? self conservative-states]

  ; Assign lower and higher resource levels
  ask conservative-states [ set pcolor red + 1  ; Example variable adjustment
                     set plabel "Conservative" ]
  ask liberal-states [ set pcolor blue - 1
                      set plabel "Liberal" ]
  ]
end


; MAIN SIMULATION LOOP
TO go
  if ticks = 1 [stop]
  determine-vote
  simulate-elections
  tick
END

to Determine-vote



end




; SIMULATE VARIOUS ELECTORAL SYSTEMS
TO simulate-elections
  ; Example: Simulate a majoritarian election
  ask voters [
    vote-majoritarian
  ]
  ; Add procedures for PR, RCV, MMP, etc., as per model requirements
END

; VOTER DECISION MAKING
TO vote-majoritarian  ; Simplified example for majoritarian voting
  ; Voters choose the candidate that provides the highest utility
  ; Utility calculation based on policy-importance and policy-preference

END

; ADDITIONAL PROCEDURES for electoral process dynamics, election thresholds, etc.
@#$#@#$#@
GRAPHICS-WINDOW
190
37
798
646
-1
-1
13.0
1
10
1
1
1
0
1
1
1
0
49
0
49
0
0
1
ticks
30.0

SLIDER
7
274
179
307
voters-m
voters-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
7
307
179
340
voters-sd
voters-sd
0
100
50.0
1
1
NIL
HORIZONTAL

TEXTBOX
30
241
180
266
District Values
20
0.0
1

TEXTBOX
115
672
254
722
Voter Values\n
20
0.0
1

SLIDER
0
707
172
740
policy-A-m
policy-A-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
0
740
172
773
policy-A-sd
policy-A-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
0
805
172
838
policy-B-sd
policy-B-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
0
773
172
806
policy-B-m
policy-B-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
0
838
172
871
policy-C-m
policy-C-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
0
870
172
903
policy-C-sd
policy-C-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
0
902
172
935
policy-D-m
policy-D-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
0
935
172
968
policy-D-sd
policy-D-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
0
968
172
1001
policy-E-m
policy-E-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
0
1001
172
1034
policy-E-sd
policy-E-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
172
707
345
740
policy-A-imp-m
policy-A-imp-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
172
740
344
773
policy-A-imp-sd
policy-A-imp-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
172
773
344
806
policy-B-imp-m
policy-B-imp-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
172
805
344
838
policy-B-imp-sd
policy-B-imp-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
7
339
179
372
candidates-m
candidates-m
0
50
10.0
1
1
NIL
HORIZONTAL

SLIDER
7
372
179
405
candidates-sd
candidates-sd
0
50
10.0
1
1
NIL
HORIZONTAL

SLIDER
7
404
179
437
partys-m
partys-m
0
50
50.0
1
1
NIL
HORIZONTAL

SLIDER
7
437
179
470
partys-sd
partys-sd
0
50
50.0
1
1
NIL
HORIZONTAL

SLIDER
172
838
344
871
policy-C-imp-m
policy-C-imp-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
172
870
344
903
policy-C-imp-sd
policy-C-imp-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
172
903
344
936
policy-D-imp-m
policy-D-imp-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
172
935
344
968
policy-D-imp-sd
policy-D-imp-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
172
968
344
1001
policy-E-imp-m
policy-E-imp-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
172
1000
344
1033
policy-E-imp-sd
policy-E-imp-sd
0
100
50.0
1
1
NIL
HORIZONTAL

TEXTBOX
376
676
588
726
Candidate Values\t
20
0.0
1

SLIDER
367
707
539
740
policy-A-position-m
policy-A-position-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
367
740
539
773
policy-A-position-sd
policy-A-position-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
367
773
539
806
policy-B-position-m
policy-B-position-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
367
805
539
838
policy-B-position-sd
policy-B-position-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
367
838
539
871
policy-C-position-m
policy-C-position-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
367
871
539
904
policy-C-position-sd
policy-C-position-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
367
904
539
937
policy-D-position-m
policy-D-position-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
367
937
539
970
policy-D-position-sd
policy-D-position-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
367
970
539
1003
policy-E-position-m
policy-E-position-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
367
1003
539
1036
policy-E-position-sd
policy-E-position-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
7
470
179
503
Conservative-Districts
Conservative-Districts
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
7
503
179
536
Liberal-Districts
Liberal-Districts
0
100
0.0
1
1
NIL
HORIZONTAL

TEXTBOX
596
677
746
702
Party Values\t\t
20
0.0
1

SLIDER
557
707
746
740
party-policy-A-position-m
party-policy-A-position-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
557
740
746
773
party-policy-A-position-sd
party-policy-A-position-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
557
772
746
805
party-policy-B-position-m
party-policy-B-position-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
557
804
746
837
party-policy-B-position-sd
party-policy-B-position-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
557
836
746
869
party-policy-C-position-m
party-policy-C-position-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
557
869
746
902
party-policy-C-position-sd
party-policy-C-position-sd
0
100
51.0
1
1
NIL
HORIZONTAL

SLIDER
557
902
746
935
party-policy-D-position-m
party-policy-D-position-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
557
935
746
968
party-policy-D-position-sd
party-policy-D-position-sd
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
557
968
746
1001
party-policy-E-position-m
party-policy-E-position-m
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
557
1001
746
1034
party-policy-E-position-sd
party-policy-E-position-sd
0
100
50.0
1
1
NIL
HORIZONTAL

BUTTON
26
24
90
57
Setup
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
90
24
153
57
Go
Go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
19
143
157
176
Partys?
Partys?
1
1
-1000

CHOOSER
19
65
157
110
District-Type
District-Type
"Majoritarian" "Representative"
0

SWITCH
19
110
157
143
Election-Threshold
Election-Threshold
1
1
-1000

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.3.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
