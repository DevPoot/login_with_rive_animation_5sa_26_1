# login_with_rive_animation_5sa_26_1
# 🎯 Flutter Login Animation App

An interactive login screen built with Flutter integrating a Rive animated bear controlled through a State Machine.

---

## 📘 Course Information

**Course:** Graficacion  
**Professor:** Rodrigo Fidel Gaxiola Sosa  
**Student:** [Your Full Name]  
**Date:** February 2026  

---

## 👨‍💻 Project Description

This project consists of developing an animated login interface using Flutter and integrating a Rive animation that reacts dynamically to user interaction.

The main objective was to understand how to connect a Rive State Machine with Flutter logic to control animations based on user input.

The bear animation responds in real time to focus changes, password visibility toggling, and validation results.

---

## ✨ Features

- 🎬 Interactive animated bear using Rive
- 👀 Bear follows the email input while typing
- 🙈 Bear covers eyes when password field is focused
- 🔐 Password visibility toggle button
- ❌ Concerned reaction when fields are invalid
- ✅ Happy reaction when login data is correct
- 📱 Responsive UI layout

---

## 🎨 About Rive

Rive is a real-time interactive animation tool that allows developers to integrate vector animations directly into applications.

Unlike traditional animations, Rive animations can be controlled dynamically through inputs using a State Machine, making them responsive to user interactions inside Flutter apps.

Official website: https://rive.app

---

## 🔄 What is a State Machine?

A State Machine is a logic-based animation controller that manages transitions between different animation states.

In this project, the State Machine controls:

- Idle state
- Typing state
- Hands covering eyes state
- Error reaction state
- Success reaction state

Flutter communicates with the State Machine using boolean inputs and triggers to activate transitions between animation states.

---

## 🛠 Technologies Used

- 🐦 Flutter
- 🎯 Dart
- 🎨 Rive
- 🔗 Git & GitHub
- 💻 Visual Studio Code

---

## 📂 Project Structure
lib/
│
├── main.dart # Application entry point
├── login_screen.dart # Main login UI implementation
├── rive_controller.dart # Controls State Machine inputs
│
assets/
│
└── animated_login_bear.riv # Rive animation file

---

- `main.dart`: Initializes and runs the application.
- `login_screen.dart`: Builds the login interface and connects animation logic.
- `rive_controller.dart`: Manages State Machine inputs and animation behavior.
- `animated_login_bear.riv`: Contains the animated bear and its configured State Machine.

---

## 🎥 Demo

Below is a demonstration of the application working:

![App Demo](assets/demo.gif)

---

## 🙌 Credits

Rive animation created by:  
dexterc  

Original asset link:  
https://rive.app/marketplace/3645-7621-remix-of-login-machine/

---

## 📚 Academic Purpose

This project was developed as part of the Graficacion course, focusing on animation integration, State Machine logic, and interactive UI development using Flutter and Rive.
The following link is to the project of the animation creator "dexterc," who made it possible to create the login screen using his work: https://rive.app/marketplace/3645-7621-remix-of-login-machine/
