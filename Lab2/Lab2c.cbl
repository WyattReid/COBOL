       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB2c.
       AUTHOR. Wyatt Reid.
       * "This program takes unsigned ints as input and reports the"
       * "last value entered before sentinel value."

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INFILE ASSIGN TO "lab2c-in.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.
       FD  INFILE.
       01  Int-Record.
           05  Int     Pic S9(4).

       WORKING-STORAGE SECTION.
       01  WS-Int-Record.
           05 WS-Int   Pic S9(4).
       01  WS-EOF      Pic  A(1).

       01  FOO-INT     PIC S9(4).
       01  HI-INT      PIC S9(4)   VALUE 0.
       01  LO-INT      PIC S9(4)   VALUE 9999.

       01  AVG-INT     PIC S9(4)   VALUE 0.
       01  NUM-INT     PIC S9(4)   VALUE 0.
       01  SUM-INT     PIC S9(4)   VALUE 0.

       01 FORM-INT     PIC Z(04)9.9(2).

       PROCEDURE DIVISION.
       000-MAIN.
           PERFORM OPENINPUT-PARAGRAPH
           PERFORM READ-PARAGRAPH WITH TEST BEFORE UNTIL WS-EOF = "Y"
           PERFORM COMP-AVG-PARAGRAPH
           PERFORM OUTPUT-PARAGRAPH
           PERFORM CLOSEINPUT-PARAGRAPH
           PERFORM STOP-PARAGRAPH.

       READ-PARAGRAPH.
           READ INFILE NEXT RECORD INTO WS-Int-Record
               AT END MOVE "Y" to WS-EOF
               NOT AT END
               MOVE WS-Int TO FOO-INT
               PERFORM COMP-PARAGRAPH
           END-READ.

       OUTPUT-PARAGRAPH.
           DISPLAY " "

           MOVE LO-INT TO FORM-INT
           DISPLAY "The lowest  value entered: "
               WITH NO ADVANCING
               IF LO-INT IS LESS THAN 0 THEN
                   DISPLAY "-"
                   WITH NO ADVANCING
               END-IF
               DISPLAY FORM-INT

           MOVE HI-INT TO FORM-INT
           DISPLAY "The highest value entered: "
               WITH NO ADVANCING
               IF HI-INT IS LESS THAN 0 THEN
                   DISPLAY "-"
                   WITH NO ADVANCING
               END-IF
               DISPLAY FORM-INT

           MOVE AVG-INT TO FORM-INT
           DISPLAY "The average value entered: "
               WITH NO ADVANCING
               IF AVG-INT IS LESS THAN 0 THEN
                   DISPLAY "-"
                   WITH NO ADVANCING
               END-IF
               DISPLAY FORM-INT.

       COMP-PARAGRAPH.
           IF FOO-INT IS LESS THAN OR EQUAL TO LO-INT
               MOVE FOO-INT TO LO-INT
               IF FOO-INT IS GREATER THAN OR EQUAL TO HI-INT
                   MOVE FOO-INT TO HI-INT
               END-IF
           ELSE
               IF FOO-INT IS GREATER THAN OR EQUAL TO HI-INT
                   MOVE FOO-INT TO HI-INT
           END-IF
           ADD 1 to NUM-INT
           ADD FOO-INT TO SUM-INT.

       COMP-AVG-PARAGRAPH.
           COMPUTE AVG-INT = (SUM-INT) / (NUM-INT) .

       OPENINPUT-PARAGRAPH.
           OPEN INPUT INFILE.

       CLOSEINPUT-PARAGRAPH.
           CLOSE INFILE.

       STOP-PARAGRAPH.
           STOP RUN.
