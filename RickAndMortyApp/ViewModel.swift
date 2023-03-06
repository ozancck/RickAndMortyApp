//
//  ViewModel.swift
//  RickAndMortyApp
//
//  Created by Ozan Çiçek on 7.03.2023.
//

import Foundation
class ViewModel: ObservableObject {
    
    @Published var locations : [Location] = []
    func fetch(){
        guard let url = URL(string: "https://rickandmortyapi.com/api/location/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let locations = try JSONDecoder().decode([Location].self, from: data)
                DispatchQueue.main.async {
                    self?.locations = locations
                }
            }catch {
                print(error)
            }
            
        }
        task.resume()
        
        
    }
}
