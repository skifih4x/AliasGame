//
//  JokeData.swift
//  AliasGame
//
//  Created by Артем Орлов on 27.07.2022.
//

import Foundation

struct JokeData: Decodable {
    var setup: String
    let punchline: String
}
