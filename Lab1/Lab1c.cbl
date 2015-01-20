       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB1c.
       AUTHOR. Wyatt A Reid.
       * "This program takes unsigned ints as input from file and "
       * "reports the last value entered before sentinel value."

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INFILE ASSIGN TO "lab1c-in.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  INFILE.
       01  Int-Record.
           05  Int     Pic 9(4).

       WORKING-STORAGE SECTION.
       01  WS-Int-Record.
           05 WS-Int   Pic 9(4).

       01  FOO-INT     Pic 9(4).
       01  WS-EOF      Pic A(1).

       PROCEDURE DIVISION.
       000-MAIN.
           PERFORM INITIALIZE-PARAGRAPH
           PERFORM READ-PARAGRAPH WITH TEST BEFORE UNTIL WS-EOF = "Y"

           DISPLAY FOO-INT

           PERFORM CLOSE-PARAGRAPH
           STOP RUN.

       INITIALIZE-PARAGRAPH.
           OPEN INPUT INFILE.

       READ-PARAGRAPH.
           READ INFILE NEXT RECORD INTO WS-Int-Record
               AT END MOVE "Y" to WS-EOF
               NOT AT END MOVE WS-Int TO FOO-INT
           END-READ.

       CLOSE-PARAGRAPH.
           CLOSE INFILE.
