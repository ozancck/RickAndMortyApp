//
//  LocationSchema.swift
//  RickAndMortyApp
//
//  Created by Ozan Çiçek on 7.03.2023.
//

import Foundation

struct RickAndMortyLocation: Hashable, Decodable {
    let info: Info
    let results: [Location]
}

struct Location: Hashable, Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [URL]
    let url: String
    let created: String
}
