//
//  AliasGameModel.swift
//  AliasGame
//
//  Created by Артем Орлов on 27.07.2022.
//

import Foundation

struct AliasGameModel {
    
    var team: Team
    var category: Category
    
    var timeLength: Int
    
    var guessedWords = 0
    var missedWords = 0
    
    var totalWords: Int {
        return guessedWords + missedWords
    }
}
