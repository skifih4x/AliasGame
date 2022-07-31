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
    var currentWord = "Здесь долженно быть слово передаваемое с экрана карточек"
    
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var startGame: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func refreshButton(_ sender: UIButton) {
        //Обновляет раунд и сбрасывает время
        //    timer.invalidate()
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        //кнопки cancel и done становяться активными и их альфа изменяется на 1
        //кнопка startGame становиться неактивной и ее альфа меняется на 0.5
        //запускает отсчет времени
        //по окончании отсчета по хорошему надо что то делать с очками ?
        startGame.alpha = 0.5
        wordLabel.text = currentWord
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        currentScore -= 1
        scoreLabel.text = String(currentScore)
        
        // как только закончилось время кнопка должна стать неактивной
        // изменяется ее альфа на 0.5
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        currentScore += 1
        scoreLabel.text = String(currentScore)
        
        // как только закончилось время кнопка должнать стать неактивной
        // изменяется ее альфа на 0.5
    }
    
    @objc func updateTimer() {
        if totalTime != 0 {
            totalTime -= 1
            totalTimeLabel.text = String(totalTime)
            
        }
        else {
            timer.invalidate() //disactivate timer
            totalScore = currentScore
            performSegue(withIdentifier: "resultVC", sender: nil)
            
            //Work NetworkManager
//            NetworkManager.shared.fetchJoke { joke in
//                wordLabel.text = joke.setup
//            }
            
            currentScore = 0
            cancelButton.alpha = 0.5
            doneButton.alpha = 0.5
            
//            playSound()
        }
    }
    
    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultVC" else { return }
        guard let destination = segue.destination as? ResultsViewController else { return }
//        destination.totalScore = totalScore // на контроллере ResultsViewController в коде создать переменную totalScore (туда передаться общий результат)
        
    }

    
    // Method wich do play wav source (раскомментировать если нужно)
        func playSound() {
            guard let url = Bundle.main.url(
                forResource: "alarm_sound",
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

