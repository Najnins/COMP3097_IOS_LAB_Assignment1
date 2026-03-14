# Prime Number Checker – iOS SwiftUI App

## Student Information
Name: Najnin Sultana  
Course: iOS Development  
Lab: Assignment 1 
Platform: iOS (SwiftUI)  
IDE: Xcode  

---

## Project Description

This iOS application is developed using **SwiftUI**.  
The app displays a **random number** on the screen and allows the user to decide whether the number is **Prime** or **Not Prime**.

The user interacts with the app by selecting one of the two options:

• Prime  
• Not Prime  

The application then verifies the answer and displays visual feedback.

---

## Application Features

### 1. Random Number Generation
A random number between **1 and 100** is displayed on the screen.

### 2. User Interaction
The user can tap:

- **Prime**
- **Not Prime**

### 3. Visual Feedback
After the user selects an answer:

| Result | Display |
|------|------|
| Correct Answer | Green Check Mark |
| Wrong Answer | Red Cross |

### 4. Timer Functionality
The application uses a **5-second timer**.

- Every **5 seconds** a new number appears.
- If the user **does not answer within 5 seconds**, it is counted as a **wrong answer**.

### 5. Score Tracking
The app records:

- Total attempts
- Correct answers
- Wrong answers

### 6. Result Dialog
After **every 10 attempts**, the app displays a dialog showing:

- Total Attempts
- Correct Answers
- Wrong Answers

---
---

## Prime Number Logic

A number is considered **Prime** if:

- it is greater than **1**
- it has **only two divisors**: 1 and itself

Example:

| Number | Result |
|------|------|
| 2 | Prime |
| 3 | Prime |
| 4 | Not Prime |
| 61 | Prime |
| 74 | Not Prime |

---
## Technologies Used

- Swift
- SwiftUI
- Combine Framework
- Xcode

---
