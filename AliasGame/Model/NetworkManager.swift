//
//  NetworkManager.swift
//  AliasGame
//
//  Created by Артем Орлов on 27.07.2022.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchJoke(completion: @escaping(JokeData) -> Void) {
        let urlString = "https://joke.deno.dev/"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            if let error = error {
                print(error.localizedDescription)
            }
            do {
                let joke = try JSONDecoder().decode(JokeData.self, from: data)
                DispatchQueue.main.async {
                    completion(joke)
                    print(joke)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
