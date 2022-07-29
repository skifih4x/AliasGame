//
//  CategoryManager.swift
//  AliasGame
//
//  Created by Андрей Кузнецов on 29.07.2022.
//

import Foundation

class CategoryManager {
    
    let categoryTitle: String
    private var wordsArray: [String]
    private var range: Int
    
    init(category: Category) {
        self.categoryTitle = category.title
        self.wordsArray = category.words
        self.range = (category.words.count > 60) ? category.words.count - 60 : Int(category.words.count / 3)
    }
    
    var nextWord: String {
        let index = Int.random(in: 0...range)
        let word = wordsArray.remove(at: index)
        wordsArray.append(word)
        return word
    }
}
