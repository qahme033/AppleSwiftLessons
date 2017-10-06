//
//  ViewController.swift
//  ApplePieQ
//
//  Created by Qasim Ahmed on 2017-10-02.
//  Copyright © 2017 Qasim Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["money", "burgers", "anime", "swft", "money", "computer", "basketball", "madalin", "iskaba"];
    var incorrectMovesAllowed = 3;
    var totalWins = 0 {
        didSet{
            newRound()
        }
    };
    var totalLosses = 0{
        didSet{
            newRound();
        }
    };
    var currentGame : Game!;

    override func viewDidLoad() {
        super.viewDidLoad();
        newRound();
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBOutlet weak var treeView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false;
        let letterString = sender.title(for: .normal)!;
        let letter = Character(letterString.lowercased());
        currentGame.playerGuessed(letter: letter);
        updateGameState();
    }
    
    func updateGameState(){
        
        if(currentGame.incorrectMovesRemaining == 0){
            totalLosses += 1;
        }else if(currentGame.formatedWord == currentGame.word){
            totalWins += 1;
            treeView.image = UIImage(named: "dab");
        }else{
            updateUI();
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newRound(){
        if(!listOfWords.isEmpty){
            let newWord = listOfWords.removeFirst();
            currentGame = Game(word: newWord, incorrectMovesRemaining : incorrectMovesAllowed, guessedLetters : "");
            updateUI();
            enableLetterButtons(true);
        }else{
            enableLetterButtons(false);
        }
    }
    func enableLetterButtons(_ flag : Bool){
        for button in letterButtons{
            button.isEnabled = flag;
        }
    }
    func updateUI(){
        scoreLabel.text = "Wins: \(totalWins), Losses \(totalLosses)";
        treeView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)");
        var currentWord = [String]();
        for letter in currentGame.formatedWord{
            currentWord.append(String(letter));
        }
        correctWordLabel.text = currentWord.joined(separator: " ");
    }

}

