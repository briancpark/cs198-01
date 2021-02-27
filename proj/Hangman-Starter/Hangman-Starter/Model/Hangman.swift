//
//  Hangman.swift
//  Hangman-Starter
//
//  Created by Shyam Kumar on 2/25/21.
//

import Foundation

// Use COMMAND-U to run the tests for this file, don't move on to the UI until all tests pass

// Tests are located in HangmanTests.swift

class Hangman {
    
    let wordArray: [String] = [
        "formation",
        "thinker",
        "deficiency",
        "buffet",
        "reader",
        "cabinet",
        "care",
        "chop",
        "elbow",
        "syndrome",
        "sermon",
        "chain",
        "train",
        "weak",
        "breeze"
    ]
    
    var gameLoop: Bool = false
    
    var currentPhrase: String = ""
    
    var dashStringDisplay: String = ""
    
    var incorrectGuesses: [Character] = []
    
    var correctGuesses: [Character] = []
    
    func start() {
         // Set initial values of all variables (lines 30-38)
    }
    
    
    func createDashString() {
        /*
         Use this function to create a string of underscores "_",
         one underscore for each letter in the currentPhrase. Put
         a space between each underscore. Assign the result to dashStringDisplay.
         */
    }
    
    func updateDashString(_ correctGuess: Character) {
        /*
         Use this function to update the dash string (dashStringDisplay)
         with all instances of correctGuess in the currentPhrase.
         */
    }
    
    func makeGuess(_ guess: Character) {
        /*
         Use this function to check if the guess passed in is
         correct or incorrect and update variables accordingly,
         ONLY IF gameLoop IS TRUE.
         */
    }
}
