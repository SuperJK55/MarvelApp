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
    let infoAboutHero: String
    let backgroundColor: UIColor
    let urlImage: String
    
}

let dataOfHeroes = HeroModelList(
    heroes: [
        HeroModel(name: "Iron Man", image: "iron-man", infoAboutHero: "Im Iron Man", backgroundColor: .white, urlImage: "https://iili.io/JMnuDI2.png"),
        HeroModel(name: "DeadPool", image: "deadpool", infoAboutHero: "Im DeadPool", backgroundColor: .red, urlImage: "https://iili.io/JMnAfIV.png"),
        HeroModel(name: "Spider Man", image: "spider-man", infoAboutHero: "Im Spider Man", backgroundColor: .blue, urlImage: "https://iili.io/JMnuyB9.png"),
        HeroModel(name: "Iron Man 2", image: "iron-man", infoAboutHero: "Im Iron Man 2", backgroundColor: .white, urlImage: "https://iili.io/JMnuDI2.png"),
        HeroModel(name: "DeadPool 2", image: "deadpool", infoAboutHero: "Im DeadPool 2", backgroundColor: .red, urlImage: "https://iili.io/JMnAfIV.png"),
        HeroModel(name: "Spider Man 2", image: "spider-man", infoAboutHero: "Im Spider Man 2", backgroundColor: .blue, urlImage: "https://iili.io/JMnuyB9.png"),
        HeroModel(name: "Iron Man 3", image: "iron-man", infoAboutHero: "Im Iron Man 3", backgroundColor: .white, urlImage: "https://iili.io/JMnuDI2.png"),
        HeroModel(name: "DeadPool 3", image: "deadpool", infoAboutHero: "Im DeadPool 3", backgroundColor: .red, urlImage: "https://iili.io/JMnAfIV.png"),
        HeroModel(name: "Spider Man 3", image: "spider-man", infoAboutHero: "Im Spider Man 3", backgroundColor: .blue, urlImage: "https://iili.io/JMnuyB9.png")
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
