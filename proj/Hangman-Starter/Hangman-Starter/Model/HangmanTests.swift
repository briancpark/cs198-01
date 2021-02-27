//
//  HangmanTests.swift
//  Hangman-Starter
//
//  Created by Shyam Kumar on 2/25/21.
//

import XCTest
@testable import Hangman_Starter

class HangmanTests: XCTestCase {
    
    //MARK:- START FUNCTIONALITY
    
    func testWhenStart_GameLoopIsTrue() {
        let sut = createSUT()
        sut.start()
        XCTAssertTrue(sut.gameLoop)
    }
    
    func testWhenStart_CurrentPhraseNotEmpty() {
        let sut = createSUT()
        sut.start()
        XCTAssertNotEqual(sut.currentPhrase, "")
    }
    
    func testWhenStart_DashStringDisplayNotEmpty() {
        let sut = createSUT()
        sut.start()
        XCTAssertNotEqual(sut.dashStringDisplay, "")
    }
    
    func testWhenStart_DashStringHasCorrectDashes() {
        let sut = createSUT()
        sut.start()
        XCTAssertEqual(sut.currentPhrase.replacingOccurrences(of: " ", with: "").count, sut.dashStringDisplay.numberOfOccurrencesOf(string: "_"))
    }
    
    //MARK:- INCORRECT GUESS FUNCTIONALITY
    
    func testWhenStart_IncorrectGuessesEmpty() {
        let sut = createSUT()
        sut.start()
        XCTAssertEqual(sut.incorrectGuesses, [])
    }
    
    func testMakeIncorrectGuess_IncorrectGuessesUpdated() {
        let sut = createSUT()
        sut.start()
        let characterGuess = makeIncorrectGuess(sut)
        XCTAssertEqual([characterGuess], sut.incorrectGuesses)
    }
    
    func testMakeSixIncorrectGuesses_GameOver() {
        let sut = createSUT()
        sut.start()
        for _ in 1...6 {
            _ = makeIncorrectGuess(sut)
        }
        XCTAssertEqual(sut.gameLoop, false)
    }
    
    //MARK:- CORRECT GUESS FUNCTIONALITY
    
    func testMakeTwoCorrectGuesses_DashStringUpdates() {
        let sut = createSUT()
        sut.start()
        let characterGuess = makeCorrectGuess(sut)
        let characterGuess2 = makeCorrectGuess(sut)
        
        XCTAssertEqual(sut.currentPhrase.numberOfOccurrencesOf(string: String(characterGuess)), sut.dashStringDisplay.numberOfOccurrencesOf(string: String(characterGuess)))
        XCTAssertEqual(sut.currentPhrase.numberOfOccurrencesOf(string: String(characterGuess2)), sut.dashStringDisplay.numberOfOccurrencesOf(string: String(characterGuess2)))
    }
    
    func testWinGame_GameOver() {
        let sut = createSUT()
        sut.start()
        winGame(sut)
        XCTAssertFalse(sut.gameLoop)
    }
    
    
    //MARK:- GAME OVER FUNCTIONALITY
    
    func testGameOver_CannotMakeGuess() {
        let sut = createSUT()
        _ = makeIncorrectGuess(sut)
        XCTAssertEqual(sut.incorrectGuesses, [])
    }
    
    //MARK:- START AS RESET FUNCTIONALITY
    
    func testStartGuessStart_ResetsGuesses() {
        let sut = createSUT()
        sut.start()
        _ = makeIncorrectGuess(sut)
        _ = makeCorrectGuess(sut)
        sut.start()
        
        XCTAssertEqual(sut.correctGuesses, [])
        XCTAssertEqual(sut.incorrectGuesses, [])
        
    }
}

extension HangmanTests {
    func createSUT() -> Hangman {
        return Hangman()
    }
    
    func makeIncorrectGuess(_ sut: Hangman) -> Character {
        var characterGuess = getRandomAlphabetElement()
        while sut.currentPhrase.contains(characterGuess) {
            characterGuess = getRandomAlphabetElement()
        }
        sut.makeGuess(characterGuess)
        return characterGuess
    }
    
    func makeCorrectGuess(_ sut: Hangman) -> Character {
        var characterGuess = getRandomAlphabetElement()
        while !sut.currentPhrase.contains(characterGuess) {
            characterGuess = getRandomAlphabetElement()
        }
        sut.makeGuess(characterGuess)
        return characterGuess
    }
    
    func winGame(_ sut: Hangman) {
        while sut.dashStringDisplay.contains("_") {
            _ = makeCorrectGuess(sut)
        }
    }
    
    func getRandomAlphabetElement() -> Character {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        return letters.randomElement() ?? Character("")
    }
}

extension String {
    func numberOfOccurrencesOf(string: String) -> Int {
        return self.components(separatedBy:string).count - 1
    }
}
