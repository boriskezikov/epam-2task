//
//  TestDataProvider.swift
//  EpamStarWars
//
//  Created by Kezikov Boris  on 17.02.2020.
//  Copyright © 2020 epam. All rights reserved.
//

import Foundation


class TestDataProvider{
    static func generateTestData(count:Int)->[String]{
        var array:[String] = []
        for i in  1...count  {
            let tmp = "Dart Vaider" + String(i)
            array.append(tmp)
        }
        return array
    
    }
}

class RowMapper{
    
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
    
}
