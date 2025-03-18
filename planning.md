# Exercise

## Description

Create a 2-Player math game where players take turns to answer simple math addition problems. A new math question is generated for each turn by picking two numbers between 1 and 20. The player whose turn it is is prompted the question and must answer correctly or lose a life.

## Details

Both players start with 3 lives. They lose a life if they mis-answer a question. At the end of every turn, the game should output the new scores for both players, so players know where they stand.

The game doesn’t end until one of the players loses all their lives. At this point, the game should announce who won and what the other player’s score is.

## Example prompt

```text
Player 1: What does 5 plus 3 equal?
> 9
Player 1: Seriously? No!
P1: 2/3 vs P2: 3/3
----- NEW TURN -----
Player 2: What does 2 plus 6 equal?
> 8
Player 1: YES! You are correct.
P1: 2/3 vs P2: 3/3
----- NEW TURN -----
... some time later ...
Player 1 wins with a score of 1/3
----- GAME OVER -----
Good bye!
```

## Tasks

### Task 1: Extract Nouns for Classes

**Instruction:**

```text
Read the description above again and extract / write down 
the nouns that you feel could make for important entities 
(manifested in the form of classes) to contain (encapsulate) 
logic as part of this app.
```

---

The key nouns from the description that could translate into classes are:

- Player: Represents each player in the game.
- Question: Represents the math problem that players must solve.
- Game: Manages the game flow, players, turns, and win conditions.

---

### Task 2: Write their roles

What is the role for each class?

**Instruction:**

```text
Write out a brief paragraph describing the role that class 
will play in your app.
```

**Remember that objects are important for two things:**

1. State: Storing data describing themselves (variables)
2. Behavior: Defining actions that can be performed on them (methods)

**Instruction:**

```text
Write down the methods for each class while also speaking 
to the following points:
```

- What information is relevant to each class?
- What will they need in order to be initialized?
- What public methods will be defined on them?

**Furthermore:**

- Which class will contain the game loop (where each instance of the loop is the other players turn)?
- Which class should manage who the current_player is?
- Which class(es) will contain user I/O and which will not have any?

---

#### **Player Class**

**Role:**
> The Player class represents an individual participant in the game. It keeps track of the player's remaining lives and their identity (e.g., Player 1 or Player 2). It provides functionality for reducing lives when a player answers incorrectly.

**Relevant Information & Initialization:**

- A name or ID to distinguish players (e.g., "Player 1", "Player 2")
- Number of lives (initialized to 3)

**Public Methods:**

- `lose_life`: Reduces the player's life count.
- `alive?`: Returns true if the player still has lives left, otherwise false.

---

#### **Question Class**

**Role:**
> The Question class is responsible for generating simple math problems. It picks two random numbers between 1 and 20 and provides the correct answer for comparison.

**Relevant Information & Initialization:**

- `num1`: A randomly generated number between 1 and 20.
- `num2`: Another randomly generated number between 1 and 20.
- `answer`: The correct sum of num1 + num2.
Public Methods:
- `ask_question`: Returns a formatted string asking the math question.
- `correct_answer?`: Takes user input and checks if it matches the answer.

---

#### **Game Class**

**Role:**
> The Game class manages the entire game loop, player turns, and determines when the game ends. It ensures players take turns, evaluates answers, updates scores, and declares a winner.

**Relevant Information & Initialization:**

- Two Player instances (Player 1 and Player 2).
- Tracks `current_player`.

**Public Methods:**

- `play`: Contains the game loop, alternating between players until one loses.
- `switch_turns`: Switches the `current_player`.
- `game_over?`: Checks if any player has lost all lives.
- `announce_winner`: Displays the final game results.

**Game Loop & Player Management:**

- The Game class contains the game loop, managing the alternating turns.
- It determines and switches the `current_player`.
- It handles all user input/output (prompting for answers, announcing results).
- The Question class does not have user I/O; it only generates questions.

---

### Task 3: Peer and Mentor review

**Instruction:**

```text
Review your approach with your peers and then with a mentor 
to make sure you are on the right track before starting to 
write your code.
```

Before implementation, review this design with peers and mentors to ensure that:

- The class structure adheres to OOP principles.
- Responsibilities are clearly distributed among classes.
- Methods are appropriately encapsulated.
