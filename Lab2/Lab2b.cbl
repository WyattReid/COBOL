       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB2b.
       AUTHOR. Wyatt Reid.
       * "This program takes unsigned ints as input and reports the"
       * "last value entered before sentinel value."

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  FOO-INT     PIC S9(5)V9(2).
       01  HI-INT      PIC S9(5)V9(2)   VALUE 0.
       01  LO-INT      PIC S9(5)V9(2)   VALUE 9999.

       01  AVG-INT     PIC S9(5)V9(2)   VALUE 0.
       01  NUM-INT     PIC S9(5)V9(2)   VALUE 0.
       01  SUM-INT     PIC S9(5)V9(2)   VALUE 0.
       01  SESS        PIC  X(1).

       01 FORM-INT     PIC Z(04)9.9(2).

       PROCEDURE DIVISION.
       000-MAIN.
           PERFORM PROMPT-PARAGRAPH WITH TEST AFTER UNTIL FOO-INT = 0
           PERFORM COMP-AVG-PARAGRAPH
           PERFORM OUTPUT-PARAGRAPH
           PERFORM SESS-PARAGRAPH
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

       SESS-PARAGRAPH.
           DISPLAY " "
           DISPLAY "Another Session (Y/N)? "
               WITH NO ADVANCING
           ACCEPT SESS
           IF SESS = "N" OR SESS = "n" THEN
               GO TO STOP-PARAGRAPH
           ELSE
               DISPLAY " "
               MOVE 0 TO HI-INT
               MOVE 9999 to LO-INT

               MOVE 0 TO AVG-INT
               MOVE 0 TO SUM-INT
               MOVE 0 TO NUM-INT
               GO TO 000-MAIN
           END-IF.

       STOP-PARAGRAPH.
           STOP RUN.
