10 PRINT "Hello, world!"
20 LET INDEX = 6

' data sets
30 LET NUMBER = 75
31 GOTO 100
40 LET NUMBER = 135
41 GOTO 100
50 LET NUMBER = 544
51 GOTO 100
60 LET NUMBER = 518
61 GOTO 100
70 LET NUMBER = 8
71 GOTO 100
80 LET NUMBER = 466
81 GOTO 100

' main program
100 GOTO 200
110 GOTO 300
120 IF INDEX = 0 THEN 190
130 LET INDEX = INDEX - 1
140 IF INDEX = 5 THEN 40
141 IF INDEX = 4 THEN 50
142 IF INDEX = 3 THEN 60
143 IF INDEX = 2 THEN 70
144 IF INDEX = 1 THEN 80
190 END

' length of the number subrutine
200 LET LENGTH = 1
210 LET CURRENT = INT(NUMBER / 10)
220 IF CURRENT = 0 THEN 110
230 LET LENGTH = LENGTH + 1
240 LET CURRENT = INT(CURRENT / 10)
250 GOTO 220

' is disarium subrutine
300 LET SUM = 0
310 LET EXTRA = 0
320 LET POSITION = 1
330 LET CURRENT = INT((NUMBER - EXTRA) / (10 ^ (LENGTH - POSITION)))
340 IF POSITION > LENGTH THEN 400
350 LET SUM = SUM + CURRENT ^ POSITION
360 LET EXTRA = EXTRA + CURRENT * 10 ^ (LENGTH - POSITION)
370 LET POSITION = POSITION + 1
380 GOTO 330

' print result
400 IF SUM = NUMBER THEN 430
410 PRINT NUMBER, "IS NOT DISARIUM"
420 GOTO 120
430 PRINT NUMBER, "IS DISARIUM"
440 GOTO 420
