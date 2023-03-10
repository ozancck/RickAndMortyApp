//
//  CharacterSchema.swift
//  RickAndMortyApp
//
//  Created by Ozan Çiçek on 7.03.2023.
//

import Foundation

struct RickAndMortyCharacter: Hashable, Decodable {
    let info: Info
    let results: [Character]
}

struct Info: Hashable, Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}

struct Character: Hashable, Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    var origin: Origin
    let location: Location2
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Origin: Hashable, Decodable {
    let name: String
    let url: String
}

struct Location2: Hashable, Decodable {
    let name: String
    let url: String
}
