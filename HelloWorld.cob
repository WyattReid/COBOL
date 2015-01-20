       identification division.
       program-id.    HelloWorld.
       
       data division.
       working-storage section.
       01  UserName   Pic X(20).

       procedure division.
       000-Main.
           Display "What's your name? "
              With No Advancing
           Accept UserName
           
           Display 'Hello, ' UserName
           Stop Run.
