//
//  HeroModel.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 07.03.2024.
//

import Foundation
import UIKit

struct HeroModelList{
    let heroes: [HeroModel]
}

struct HeroModel{
    let name: String
    let image: String
    let backgroundColor: UIColor
}

let dataOfHeroes = HeroModelList(
    heroes: [
        HeroModel(name: "Iron Man", image: "iron-man", backgroundColor: .white),
        HeroModel(name: "DeadPool", image: "deadpool", backgroundColor: .red),
        HeroModel(name: "Spider Man", image: "spider-man", backgroundColor: .blue),
        HeroModel(name: "Iron Man 2", image: "iron-man", backgroundColor: .white),
        HeroModel(name: "DeadPool 2", image: "deadpool", backgroundColor: .red),
        HeroModel(name: "Spider Man 2", image: "spider-man", backgroundColor: .blue),
        HeroModel(name: "Iron Man 3", image: "iron-man", backgroundColor: .white),
        HeroModel(name: "DeadPool 3", image: "deadpool", backgroundColor: .red),
        HeroModel(name: "Spider Man 3", image: "spider-man", backgroundColor: .blue)
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
