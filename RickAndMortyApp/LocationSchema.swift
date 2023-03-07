//
//  LocationSchema.swift
//  RickAndMortyApp
//
//  Created by Ozan Çiçek on 7.03.2023.
//

import Foundation

struct Main2 : Hashable, Codable {
    
    let info : Info
    let results : [Location]
    
}

struct Location: Hashable, Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [URL]
    let url: String
    let created: String
}

