//
//  Domain.swift
//  EpamStarWars
//
//  Created by Kezikov Boris  on 16.02.2020.
//  Copyright © 2020 epam. All rights reserved.
//

import Foundation

struct ApiResponse: Decodable{
    var characters: [CharacterDTO]
    
    enum Keys: String, CodingKey {
        case results
        case count
    }
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: Keys.self)
        characters = try container.decode([CharacterDTO].self, forKey: .results)
    }
    init (){
        characters = []
        
    }
    
}


struct CharacterDTO: Decodable{
    var name:String
    var height:String
    var mass: String
    var hairColor: String
    var skinColor: String
    var eyeColor: String
    var birthYear: String
    var gender: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hair_color
        case skin_color
        case eye_color
        case birth_year
        case gender
    }
    
    init(){
        self.birthYear = "22BB"
        self.name = "Boris"
        self.height = "285"
        self.mass = ""
        self.gender = ""
        self.eyeColor = ""
        self.hairColor = ""
        self.skinColor = ""
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        height = try container.decode(String.self, forKey: .height)
        mass = try container.decode(String.self, forKey: .mass)
        hairColor = try container.decode(String.self, forKey: .hair_color)
        skinColor = try container.decode(String.self, forKey: .skin_color)
        eyeColor = try container.decode(String.self, forKey: .eye_color)
        birthYear = try container.decode(String.self, forKey: .birth_year)
        gender = try container.decode(String.self, forKey: .gender)
    }
}


