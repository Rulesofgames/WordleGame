 # WordleGame  

**Demo Link:** https://www.youtube.com/watch?v=p6hlZ3_GUjM

**Overview**:  
The Wordle Game is a web-based word puzzle game developed using the Eclipse IDE. It combines Java, JSP (JavaServer Pages), and Servlets to provide an interactive gaming experience. The project integrates two external APIs, the Random Word API and the WordsAPI from RAPID API, to generate random 5-letter words and validate user inputs. 

**Technologies Used**  
**Eclipse IDE:** The development environment used for building the Wordle game.  
**Java:** The primary programming language for backend logic.  
**JSP (JavaServer Pages):** Used for creating the dynamic frontend interface.  
**Servlets:** Handle user requests, game logic, and interaction with external APIs.  
**Random Word API (RAPID API):** Provides random 5-letter words for game rounds.  
**WordsAPI (RAPID API):** Validates user-entered words against a dictionary of valid words.  

**Key Components**:  
**Frontend (JSP):** The frontend of the game is built using JavaServer Pages (JSP), providing an interactive and user-friendly interface for players. Users can enter their guesses and receive feedback on the correctness of their inputs.  
**Backend (Java and Servlets):** The Java programming language, along with Servlets, forms the core backend of the Wordle game. Servlets handle user requests, process game logic, and communicate with external APIs.  **Random Word API:** The project utilizes the Random Word API from RAPID API to generate random 5-letter words for each game round. This API ensures the unpredictability and challenge of each game session.  
**WordsAPI:** The WordsAPI, also from RAPID API, is integrated to validate user-entered words against a predefined dictionary. It ensures that players can only guess valid words, enhancing the game's fairness and accuracy.  

**How the Game Works**  
  **-Game Initialization:** When a player starts a new game, the backend requests a random 5-letter word from the Random Word API. This word becomes the target word that the player needs to guess.  

 ** -User Interaction:** Players interact with the game through the frontend interface (JSP). They input their guesses for the target word, and the frontend sends these guesses to the backend.  

 ** -Guess Validation:** The backend uses the WordsAPI to validate each guess against the dictionary of valid words. If a guess is valid, the backend calculates feedback for the player, indicating correct letters in the correct positions (green), correct letters in the wrong positions (yellow), or incorrect letters (gray).  

  **-Feedback and Progress:** Players receive immediate feedback on their guesses, helping them refine their subsequent attempts. The game continues until the player correctly guesses the target word or exhausts their allotted guesses.  
  
**Game End:** The game concludes when the player either guesses the word correctly or reaches the maximum number of allowed attempts. Players can then choose to start a new game.  
