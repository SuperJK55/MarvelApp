//
//  HeroModel.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 07.03.2024.
//

import Foundation

struct HeroModelList: Codable{
    let countOfHeroes: Int
    let heroes: [HeroModel]
}

struct HeroModel: Codable {
    let name: String
    let image: String
}

let dataOfHeroes = HeroModelList(
    countOfHeroes: 3,
    heroes: [
        HeroModel(name: "Iron Man 1", image: "iron-man"),
        HeroModel(name: "Iron Man 2", image: "iron-man"),
        HeroModel(name: "Iron Man 3", image: "iron-man")
    ]
)

class HeroesViewModel {
    var dataSource: [HeroModel] = []
    
    init() {
        updateDataSource()
    }
    
    func updateDataSource() {
        self.dataSource = dataOfHeroes.heroes
    }
    func countOfHeroes() -> Int {
        dataSource.count
    }
}
