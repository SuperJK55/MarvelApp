//
//  HeroViewModel.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 22.05.2024.
//

import UIKit

class HeroViewModel {
    
    private var heroes: [HeroModel] = []
    private let apiService: APIWork
    
    var onDataUpdated: (() -> Void)?
    var onError: ((Error) -> Void)?
    
    init(apiService: APIWork) {
        self.apiService = apiService
    }
    
    func fetchHeroesData() {
        apiService.fetchHeroesData { [weak self] (result) in
            switch result {
            case .success(let heroes):
                self?.heroes = heroes
                self?.onDataUpdated?()
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
    
    func countOfHeroes() -> Int {
        heroes.count
    }
    
    func hero(at index: Int) -> HeroModel {
        return heroes[index]
    }
}
