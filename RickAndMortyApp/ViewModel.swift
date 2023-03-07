//
//  ViewModel.swift
//  RickAndMortyApp
//
//  Created by Ozan Çiçek on 7.03.2023.
//

import Foundation
class ViewModel: ObservableObject {
    
    @Published var locations : [Location] = []
    @Published var characters : [Character] = []
    
    
    func fetchCharacter(){
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let characters = try JSONDecoder().decode(Main.self, from: data)
                DispatchQueue.main.async {
                    self?.characters = characters.results
                }
            }catch {
                print(error)
            }
            
        }
        task.resume()
    }
    
    func fetchLocation(){
        guard let url = URL(string: "https://rickandmortyapi.com/api/location") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let locations = try JSONDecoder().decode(Main2.self, from: data)
                DispatchQueue.main.async {
                    self?.locations = locations.results
                }
            }catch {
                print(error)
            }
            
        }
        task.resume()
        
        
    }
    
    
}
