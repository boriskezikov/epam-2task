//
//  TestDataProvider.swift
//  EpamStarWars
//
//  Created by Kezikov Boris  on 17.02.2020.
//  Copyright © 2020 epam. All rights reserved.
//

import Foundation



class UtilsService{
    public static func mapArray(json:Data)-> [CharacterDTO]{
        var hero:[CharacterDTO] = []
        do{
            let jsonDencoder = JSONDecoder()
            let resp = try jsonDencoder.decode(ApiResponse.self, from: json)
            hero = resp.characters
        }
        catch let error as DecodingError{
            print(error)
        }
        catch{
        }
        return hero
    }
    public static func checkIfPresent(string:String)->Bool{
        return string == "n/a"
    }

}
