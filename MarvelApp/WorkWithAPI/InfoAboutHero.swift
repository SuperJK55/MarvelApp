//
//  InfoHeroViewModel.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 22.03.2024.
//

import UIKit
import Kingfisher

class InfoAboutHero {
    
    let heroName: String
    var heroImageUrlString: String
    
    init(hero: HeroModel) {
        self.heroName = hero.name
        self.heroImageUrlString = "\(hero.thumbnail.path).\(hero.thumbnail.extension)"
    }
    
    func loadImageFromURL(imageView: UIImageView) {
        
        heroImageUrlString.insert(contentsOf: "s", at: heroImageUrlString.index(heroImageUrlString.startIndex, offsetBy: 4))
        let url = URL(string: heroImageUrlString)
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        let indicator = UIActivityIndicatorView()
        
        imageView.kf.indicatorType = .activity
        (imageView.kf.indicator?.view as? UIActivityIndicatorView)?.color = .white
        
        imageView.kf.setImage(with: url, options: [.processor(processor)] ){ result in
            switch result {
            case .success:
                print("Load sucesfull")
                break
            case .failure(let _error):
                print("Load Failure")
                break
            }
        }
    }
}

