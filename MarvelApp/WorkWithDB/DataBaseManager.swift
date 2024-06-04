//
//  DataBaseManager.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 23.04.2024.
//

import Foundation
import RealmSwift

protocol HeroDataAccessObject {
    func saveHeroes(heroes: [HeroModel])
    func getHeroes()-> [HeroModel]
}

class RealmDB {
    static let shared = RealmDB()
    
    func saveHeroes(heroes: [HeroModel]){
        for item in heroes {
            do {
                let realm = try Realm()
                try realm.write {
                    realm.add(HeroObject(heroData: item), update: .modified)
                }
            } catch(let error) {
                print("Failed to save hero: \(error)")
            }
        }
    }
    
    func getAllHeroes() -> [HeroModel] {
        do {
            let realm = try Realm()
            var heroes: [HeroModel] = []
            let realmHeroObject = realm.objects(HeroObject.self)
            
            for item in realmHeroObject {
                heroes.append(HeroModel(heroObject: item))
            }
            return heroes
        } catch(let error){
            print("Failed to get hero: \(error)")
            return []
        }
        
    }
}
