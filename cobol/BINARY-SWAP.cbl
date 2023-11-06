      ******************************************************************
       IDENTIFICATION              DIVISION.
      ******************************************************************
       PROGRAM-ID.                 BINARY-SWAP.
       AUTHOR.                     QSHURICK.
       DATE-WRITTEN.               06-11-2023.

      ******************************************************************
       DATA                        DIVISION.
      ******************************************************************
       WORKING-STORAGE             SECTION.
       01 WS-INPUTS.
          05 WS-A                  PIC X(10).
          05 WS-B                  PIC X(10).
       01 WS-VAR
          05 WS-INDEX-START        PIC 9(02).
          05 WS-INDEX-END          PIC 9(2).
          05 WS-CHR-A              PIC X(1).
          05 WS-CHR-B              PIC X(1).
          05 WS-DIFF               PIC 9(2).
      ******************************************************************
       PROCEDURE                   DIVISION.
           ACCEPT WS-A.
           ACCEPT WS-B.
      ******************************************************************
       MAIN-RTN.
           PERFORM CMP-CHR VARYING WS-INDEX-START 
     -     FROM 1 BY 1 UNTIL WS-INDEX-START=9.
           DIVIDE WS-DIFF INTO 2 GIVING WS-DIFF.
           DISPLAY WS-DIFF.

       MAIN-EXT.
           STOP RUN.
       
       CMP-CHR.
           MOVE WS-INDEX-START TO WS-INDEX-END.
           ADD 1 TO WS-INDEX-END.
           MOVE WS-A(WS-INDEX-START:WS-INDEX-END) TO WS-CHR-A.
           MOVE WS-B(WS-INDEX-START:WS-INDEX-END) TO WS-CHR-B.
           DISPLAY "COMPARING " WS-CHR-A " WITH " WS-CHR-B.
           IF WS-CHR-A NOT EQUAL WS-CHR-B AND WS-CHR-A > SPACE
               ADD 1 TO WS-DIFF
               DISPLAY "SEEMS DIFF"
           END-IF.
