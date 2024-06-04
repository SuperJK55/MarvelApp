//
//  MockApiService.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 04.06.2024.
//

import Foundation

class MockAPIService: APIWork {
    
    override func fetchHeroesData(completion: @escaping (Result<[HeroModel], Error>) -> Void) {
            let heroes = [
                HeroModel(id: 1, name: "Deadpool", description: "He is crazy man", thumbnail: ThumbnailModel(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")),
                HeroModel(id: 2, name: "Iron Man", description: "Description", thumbnail: ThumbnailModel(path: "iron-man", extension: "jpg")),
                HeroModel(id: 3, name: "Spider-Man", description: "Description", thumbnail: ThumbnailModel(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg"))
            ]
            completion(.success(heroes))
        }
}
