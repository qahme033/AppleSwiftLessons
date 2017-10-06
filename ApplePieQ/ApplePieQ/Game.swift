//
//  Game.swift
//  ApplePieQ
//
//  Created by Qasim Ahmed on 2017-10-03.
//  Copyright © 2017 Qasim Ahmed. All rights reserved.
//

import Foundation

struct Game{
    var word : String;
    var incorrectMovesRemaining : Int;
    var guessedLetters : String;
    
    mutating func playerGuessed(letter : Character){
        guessedLetters.append(letter);
        if(!word.contains(letter)){
            incorrectMovesRemaining -= 1;
        }
    }
    
    var formatedWord : String {
        var guessedWord = "";
        for letter in word.characters{
            if(guessedLetters.contains(letter)){
                guessedWord += "\(letter)";
            }
            else{
                guessedWord += "_"
            }
        }
        return guessedWord;
    }
}
