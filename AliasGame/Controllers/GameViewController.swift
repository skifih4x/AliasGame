//
//  GameViewController.swift
//  AliasGame
//
//  Created by Артем Орлов on 27.07.2022.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    var timer = Timer()
    var totalTime = 60
    var currentScore = 0
    var totalScore = 0
    var wordCount = 0
    var topic = "russian_words_nouns" {
        didSet {
            WordStore.shared.setWords(by: topic)
        }
    }
    
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var startGame: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WordStore.shared.setWords(by: topic)
        showWord()
        doneButton.isHidden = true
        cancelButton.isHidden = true
    }
    
    @IBAction func refreshButton(_ sender: UIButton) {
        //Обновляет раунд и сбрасывает время
        timer.invalidate()
        totalTime = 60
        totalTimeLabel.text = String(60)
        currentScore = 0
        resultLabel.text = String(0)
        wordCount = 0
        startGame.isHidden = false
        doneButton.isHidden = true
        cancelButton.isHidden = true
        
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        
        timer.invalidate()
        //        startGame.alpha = 0.5
        wordLabel.text = ""
        showWord()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        doneButton.isHidden = false
        cancelButton.isHidden = false
        startGame.isHidden = true
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        updateTimerButton()
        
        currentScore -= 1
        
        if currentScore < 0 {
            currentScore = 0
        }
        resultLabel.text = String(currentScore)
        
        if wordCount > 10 {
            performSegue(withIdentifier: "resultVC", sender: nil)
        } else {
            showWord()
        }
        playSound(nameSound: "bad")
        //                didGetJoke()
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        bonusRound()
        updateTimerButton()
        currentScore += 1
        resultLabel.text = String(currentScore)
        
        if wordCount > 10 {
            performSegue(withIdentifier: "resultVC", sender: nil)
        } else {
            showWord()
        }
        
        playSound(nameSound: "good")
        //                didGetJoke()
    }
    
    @objc func updateTimer() {
        if totalTime != 0 {
            totalTime -= 1
            totalTimeLabel.text = String(totalTime)
            
        } else {
            timer.invalidate() //disactivate timer
            totalScore = currentScore
            
            currentScore = 0
            doneButton.isHidden = true
            cancelButton.isHidden = true
        }
    }
    
    func bonusRound() {
        
        let i = bonusWord()
        
        if i == 5 {
            currentScore += 2
        } else {
            resultLabel.textColor = .black
        }
    }
    
    func bonusWord() -> Int {
        let randomWords = Int.random(in: 1...10)
        print(randomWords)
        if randomWords == 5 {
            wordLabel.textColor = .red
        } else if randomWords != 5 {
            wordLabel.textColor = .black
        }
        return randomWords
    }
    
    func showWord() -> Int {
        wordLabel.text = WordStore.shared.randomWord()
        wordCount += 1
        return wordCount
    }
    
    func updateTimerButton() {
        timer.invalidate()
        totalTime = 61
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultVC" else { return }
        guard let destination = segue.destination as? ResultsViewController else { return }
        destination.overAllResults = resultLabel.text
    }
    
    //MARK: - PlaySound
    
    func playSound(nameSound: String) {
        guard let url = Bundle.main.url(
            forResource: nameSound,
            withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(
                .playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(
                contentsOf: url,
                fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            player.play()
            
        } catch let error { print(error.localizedDescription) }
    }
}

//MARK: - UIAlertController

extension GameViewController {
    
    func didGetJoke() {
        var headJoke = ""
        var footerJoke = ""
        NetworkManager.shared.fetchJoke { joke in
            headJoke = joke.setup
            footerJoke = joke.punchline
            let alert = UIAlertController(title: headJoke, message: footerJoke, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(alertAction)
            self.present(alert, animated: true)
        }
    }
}

