 # WordleGame  

**Demo Link:** https://www.youtube.com/watch?v=p6hlZ3_GUjM

**Overview**:  
The Wordle Game is a web-based word puzzle game developed using the Eclipse IDE. It combines Java, JSP (JavaServer Pages), and Servlets to provide an interactive gaming experience. The project integrates two external APIs, the Random Word API and the WordsAPI from RAPID API, to generate random 5-letter words and validate user inputs. 

**Technologies Used**  
* **Eclipse IDE:** The development environment used for building the Wordle game.  
* **Java:** The primary programming language for backend logic.  
* **JSP (JavaServer Pages):** Used for creating the dynamic frontend interface.  
* **Servlets:** Handle user requests, game logic, and interaction with external APIs.  
* **Random Word API (RAPID API):** Provides random 5-letter words for game rounds.  
* **WordsAPI (RAPID API):** Validates user-entered words against a dictionary of valid words.  

**Key Components**:  
* **Frontend (JSP):** The frontend of the game is built using JavaServer Pages (JSP), providing an interactive and user-friendly interface for players. Users can enter their guesses and receive feedback on the correctness of their inputs.  
* **Backend (Java and Servlets):** The Java programming language, along with Servlets, forms the core backend of the Wordle game. Servlets handle user requests.Java process game logic, and communicate with external APIs.
* **Random Word API:** The project utilizes the Random Word API from RAPID API to generate random 5-letter words for each game round. This API ensures the unpredictability and challenge of each game session.
* **WordsAPI:** The WordsAPI, also from RAPID API, is integrated to validate user-entered words against a predefined dictionary. It ensures that players can only guess valid words, enhancing the game's fairness and accuracy.  

**How the Game Works**  
  * **Game Initialization:** When a player starts a new game, the backend requests a random 5-letter word from the Random Word API. This word becomes the target word that the player needs to guess.  

  * **User Interaction:** Players engage with the game through the frontend interface (JSP). The grid serves as the interactive game board where players input their guesses for the target word using the provided on-screen keyboard.  

* **Guess Validation and Feedback:** The core of the game lies in the "Guess Validation" process, where the backend utilizes the WordsAPI to validate each player's guess against a comprehensive dictionary of valid words. If a player's guess is confirmed as a valid word, the backend calculates detailed feedback to provide an informative experience. The feedback includes the following:
    
  
* **Game End:** The game concludes when the player either guesses the word correctly or reaches the maximum number of allowed attempts. Players can then choose to start a new game.  
