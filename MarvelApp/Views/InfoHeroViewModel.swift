//
//  InfoHeroViewModel.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 22.03.2024.
//

import UIKit
import Kingfisher

class InfoHeroViewModel {
    
    let heroItem: HeroModel
    
    init(hero: HeroModel) {
        self.heroItem = hero
    }
    
    func loadImageFromURL(imageView: UIImageView) {
        
        let url = URL(string: heroItem.urlImage)
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
                if let image = UIImage(named: self.heroItem.image) {
                    imageView.image = image
                }
                break
            }
        }
    }
}

