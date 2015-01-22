       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB2a.
       AUTHOR. Wyatt Reid.
       * "This program takes unsigned ints as input and reports the"
       * "last value entered before sentinel value."

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  FOO-INT     PIC S9(5).
       01  HI-INT      PIC S9(5)   VALUE 0.
       01  LO-INT      PIC S9(5)   VALUE 9999.

       01  AVG-INT     PIC S9(5).
       01  NUM-INT     PIC S9(5).
       01  SUM-INT     PIC S9(5).

       PROCEDURE DIVISION.
       000-MAIN.
           PERFORM PROMPT-PARAGRAPH WITH TEST AFTER UNTIL FOO-INT = 0
           PERFORM COMP-AVG-PARAGRAPH
           PERFORM OUTPUT-PARAGRAPH
           PERFORM STOP-PARAGRAPH.

       PROMPT-PARAGRAPH.
           DISPLAY "Enter a 4-digit signed number (0 to stop): "
               WITH NO ADVANCING
           ACCEPT FOO-INT
           IF FOO-INT = 0 THEN
               EXIT PARAGRAPH
           ELSE
               PERFORM COMP-PARAGRAPH
           END-IF.

       OUTPUT-PARAGRAPH.
           DISPLAY " "
           DISPLAY "The lowest value entered: " LO-INT
           DISPLAY "The highest value entered: " HI-INT
           DISPLAY "The average value entered: " AVG-INT.

       COMP-PARAGRAPH.
           IF FOO-INT IS LESS THAN OR EQUAL TO LO-INT
               MOVE FOO-INT TO LO-INT
               IF FOO-INT IS GREATER THAN OR EQUAL TO HI-INT
                   MOVE FOO-INT TO HI-INT
               END-IF
           ELSE
               MOVE FOO-INT TO HI-INT
           END-IF
           ADD 1 to NUM-INT
           ADD FOO-INT TO SUM-INT.

       COMP-AVG-PARAGRAPH.
           COMPUTE AVG-INT = (SUM-INT) / (NUM-INT) .

       STOP-PARAGRAPH.
           STOP RUN.
