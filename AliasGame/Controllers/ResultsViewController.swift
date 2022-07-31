//
//  ResultsViewController.swift
//  AliasGame
//
//  Created by Артем Орлов on 27.07.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var overAllResultLabel: UILabel!
    
    @IBOutlet var guessWordsLabel: UILabel!
    @IBOutlet var missedWordsLabel: UILabel!
    
    @IBOutlet var jokeJsonLabel: UILabel!
    
    var overAllResults: String!
    var guessWords: String!
    var missWords: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        overAllResultLabel.text = "overAllResults"
//        guessWordsLabel≈ç.text = guessWords
//        missedWordsLabel.text = missWords
    }

}
