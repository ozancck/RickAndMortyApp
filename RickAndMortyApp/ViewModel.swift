//
//  ViewModel.swift
//  RickAndMortyApp
//
//  Created by Ozan Çiçek on 7.03.2023.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var locations: [Location] = []
    @Published var characters: [Character] = []
    @Published var nextLink: String = "https://rickandmortyapi.com/api/character"
    @Published var page: Int = 0

    func fetchCharacter() {
        if nextLink != "null" {
            guard let url = URL(string: nextLink) else {
                return
            }

            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }

                do {
                    let characters = try JSONDecoder().decode(Main.self, from: data)
                    DispatchQueue.main.async {
                        self?.characters = (self?.characters ?? []) + characters.results
                        self?.nextLink = characters.info.next
                        
                      
                        
                        
                        
                        self?.page = (self?.page ?? 0) + 1
                        if (self?.page) != 42 {
                            self?.fetchCharacter()
                        }
                    }
                } catch {
                    print(error)
                }
            }

            task.resume()
        }
    }

    func fetchLocation() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/location") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let locations = try JSONDecoder().decode(Main2.self, from: data)
                DispatchQueue.main.async {
                    self?.locations = locations.results
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
