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
    
    public func getParametersMap()->[String: String]{
        var dict:[String: String] = [:]
        dict.updateValue(self.name, forKey: "name")
        dict.updateValue(self.height, forKey: "height")
        dict.updateValue(self.mass, forKey: "mass")
        dict.updateValue(self.hairColor, forKey: "hairColor")
        dict.updateValue(self.skinColor, forKey: "skinColor")
        dict.updateValue(self.eyeColor, forKey: "eyeColor")
        dict.updateValue(self.birthYear, forKey: "birthYear")
        dict.updateValue(self.gender, forKey: "gender")
        return dict
    }
    
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
        self.birthYear = ""
        self.name = ""
        self.height = ""
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


