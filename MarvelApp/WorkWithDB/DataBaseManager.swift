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
    private let realm = try! Realm()
    
    func saveHeroes(heroes: [HeroModel]){
        for item in heroes {
            do {
                try realm.write {
                    realm.add(HeroObject(heroData: item), update: .all)
                }
            } catch(let error) {
                print("Failed to save hero: \(error)")
            }
        }
    }
    
    func getAllHeroes() -> [HeroModel] {
        var heroes: [HeroModel] = []
        let realmHeroObject = realm.objects(HeroObject.self)
        
        for item in realmHeroObject {
            heroes.append(HeroModel(heroObject: item))
        }
        return heroes
    }
}
