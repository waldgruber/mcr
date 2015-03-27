# mcr
Multiple Choice Randomized

-------------------------------------------------------------

Motivation for the programme: 

Most of my exams during my B.Sc. studies are in multiple choice format. The format is alsways five answers per question.  One to five answers can be correct. I found several apps that support learning cards. You can enter questions, answers and the information which answer(s) is/are correct. But the order of th answers always stay sthe same. Unfortunelly this leads to the effect that I remember the position of the correct answer and not is content.

This lead to the wish for changing positions of the answers -> randomized

-------------------------------------------------------------

Requirements

- five anwers per question
- each answer can be correct or wrong -> 0 to 5 correct answers per question are possible
- each questions is part of a collection
- learning per collection
- order of questions during learning session randomized
- order of answers per question randomized
- each question must be answered correct x times before it is not asked again in this learning session 
- automatic check of the answers during the learning session -> 0 to 5 points
- 5 points reduces the repetition counter (-1)
- less then 5 points does not reduce the repetition counter
- number of repetitions (x) can be entered on collection level

-------------------------------------------------------------

Implementation

RoR-Application (single-user)
started locally on the computer in the mcr folder (console: rails s)
UI: browser 0.0.0.0/3000
stopped by CRTL C
Database: sqlite3 

structure:
- collections
- questions
- answers

a counter shows how many questions are still open
when the learning session of one collection is finished (counter 0/0/0) a new session including again all questions is started with "next question"

Listing Collections (all)
- per collection: learn, show, show with answers (for printout), edit, destroy
- new collection

Editing Collection
- Name: name of the collection
- Rep: number of repetitions

Lern
- shows the question and the five answers, selection via checkbox
- button "compare answers"
- Result: x points 
- Information how many questions are open: X questions unanswered, Y questions answered once, Z questions answered twice
- continue learning: Next question

Show 
- shows all questions
- possible actions: New Question, Show / Edit / Destroy existing question

-------------------------------------------------------------