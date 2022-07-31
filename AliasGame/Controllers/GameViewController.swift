//
//  GameViewController.swift
//  AliasGame
//
//  Created by Артем Орлов on 27.07.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WordStore.shared.setWords(by: topic)
        showWord()
        // Do any additional setup after loading the view.
    }
    
    var topic = "russian_words_nouns" {
        didSet {
            WordStore.shared.setWords(by: topic)
        }
    }
    
    @IBAction func nextPressed() {
        wordLabel.text = ""
        showWord()
    }
        
    func showWord() {
        wordLabel.text = WordStore.shared.randomWord()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
