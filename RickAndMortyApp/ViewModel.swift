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
    @Published var locationPage: Int = 0
    @Published var locationNextlink: String = "https://rickandmortyapi.com/api/location"
    
    func fetchMoreLoacation(){
        if locationPage == 0 {
            self.fetchLocation()
        }else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.fetchLocation()
            }
        }
        
    }

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
                    let characters = try JSONDecoder().decode(RickAndMortyCharacter.self, from: data)
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
        if locationNextlink != "null" {
            guard let url = URL(string: locationNextlink) else {
                return
            }

            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }

                do {
                    let locations = try JSONDecoder().decode(RickAndMortyLocation.self, from: data)
                    DispatchQueue.main.async {
                        self?.locations = (self?.locations ?? []) + locations.results

                        self?.locationNextlink = locations.info.next

                        self?.locationPage = (self?.locationPage ?? 0) + 1
                    }
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
    }
}
