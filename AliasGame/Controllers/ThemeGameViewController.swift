//
//  ThemeGameViewController.swift
//  AliasGame
//
//  Created by Артем Орлов on 27.07.2022.
//

import UIKit

class ThemeGameViewController: UIViewController {
    
    @IBOutlet private weak var topicOne: UIButton!
    @IBOutlet private weak var topicTwo: UIButton!
    @IBOutlet private weak var topicThree: UIButton!
    @IBOutlet private weak var topicFour: UIButton!
    
    private var selectedFilePath: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topicOne.setTitle("Выбрать", for: .normal)
        topicTwo.setTitle("Выбрать", for: .normal)
        topicThree.setTitle("Выбрать", for: .normal)
        topicFour.setTitle("Выбрать", for: .normal)
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 0: selectedFilePath = "english_words_nouns"
        case 1: selectedFilePath = "russian_words_nouns"
        case 2: selectedFilePath = "sport_words_nouns"
        case 3: selectedFilePath = "random_words_nouns"
        default:
            return
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? GameViewController else { return }
        vc.topic = selectedFilePath
    }
}
