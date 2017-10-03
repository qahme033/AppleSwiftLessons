//
//  ViewController.swift
//  ApplePieQ
//
//  Created by Qasim Ahmed on 2017-10-02.
//  Copyright © 2017 Qasim Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["naruto", "burgers", "anime", "swft", "money", "computer", "basketball", "madalin", "iskaba"];
    var incorrectMovesAllowed = 3;
    var totalWins = 0;
    var totalLosses = 0;
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
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func newRound(){
        let newWord = listOfWords.removeFirst();
        currentGame = Game(word: newWord, incorrectMovesRemaining : incorrectMovesAllowed);
        updateUI();
    }
    func updateUI(){
        scoreLabel.text = "Wins: \(totalWins), Losses \(totalLosses)";
        treeView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)");
    }

}

