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
    let heroImageUrlString: String
    
    init(hero: HeroModel) {
        self.heroName = hero.name
        self.heroImageUrlString = "\(hero.thumbnail.path).\(hero.thumbnail.extension)"
    }
    
    func loadImageFromURL(imageView: UIImageView) {
        let url = convertToHTTPS(urlString: heroImageUrlString)
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        
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
    
    func convertToHTTPS(urlString: String) -> URL? {
        guard let url = URL(string: urlString) else {

            return nil
        }
        guard url.scheme == "http" else {
            return url
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.scheme = "https"
        
        return components?.url
    }
}

