//
//  Team.swift
//  AliasGame
//
//  Created by Андрей Кузнецов on 31.07.2022.
//

import Foundation

class Team {
    let name: String = ""
    private var score: Int = 0
    
    func addPoint() {
        self.score += 1
    }
    
    func subtrackpoint(){
        self.score -= 1
    }
    
    var getScore: String {
        return String(self.score)
    }
}
