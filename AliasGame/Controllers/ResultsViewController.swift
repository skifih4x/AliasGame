//
//  ResultsViewController.swift
//  AliasGame
//
//  Created by Артем Орлов on 27.07.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var overAllResultLabel: UILabel!
    
    @IBOutlet var jokeJsonHeaderLabel: UILabel!
    @IBOutlet var jokeJsonFooterLabel: UILabel!
    
    var overAllResults: String!
    var guessWords: String!
    var missWords: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overAllResultLabel.text = overAllResults
        navigationItem.hidesBackButton = true
        jokeResultsVC()
    }
    func jokeResultsVC() {
        NetworkManager.shared.fetchJoke { joke in
            self.jokeJsonHeaderLabel.text = joke.setup
            self.jokeJsonFooterLabel.text = joke.punchline
        }
    }
}
