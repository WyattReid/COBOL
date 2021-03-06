       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB1a.
       AUTHOR. Wyatt Reid.
       * "This program takes unsigned ints as input and reports the"
       * "last value entered before sentinel value."

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  FOO-INT     PIC 9(4).
       01  BAR-INT     PIC 9(4).
       01  INI-INT     PIC 9(4).

       PROCEDURE DIVISION.
       000-MAIN.
           PERFORM XC-PARAGRAPH
           PERFORM A-PARAGRAPH WITH TEST AFTER UNTIL FOO-INT = 0
           PERFORM B-PARAGRAPH
           PERFORM STOP-PARAGRAPH.

       XC-PARAGRAPH.
           DISPLAY "Enter a 4-digit unsigned number (0 to stop): "
               WITH NO ADVANCING
           ACCEPT FOO-INT
           IF FOO-INT = 0 THEN
               GO TO STOP-PARAGRAPH
           ELSE
               MOVE FOO-INT TO INI-INT
           END-IF.

       A-PARAGRAPH.
           DISPLAY "Enter a 4-digit unsigned number (0 to stop): "
               WITH NO ADVANCING
           ACCEPT FOO-INT
           IF FOO-INT = 0 THEN
               EXIT PARAGRAPH
           ELSE
               MOVE FOO-INT TO BAR-INT
           END-IF.

       B-PARAGRAPH.
           DISPLAY " "
           DISPLAY "The first number entered: " INI-INT
           DISPLAY "The last number entered: " BAR-INT.

       STOP-PARAGRAPH.
           STOP RUN.
