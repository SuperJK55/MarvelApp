//
//  CustomCollectionViewCell.swift
//  MarvelTestApp
//
//  Created by Степан Коленкин on 05.03.2024.
//

import UIKit

class CustomHeroCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomHeroCollectionViewCellId"
    
    private lazy var imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "questionmark")
        image.tintColor = .white
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    private lazy var heroNameView: UILabel = {
        let heroName = UILabel()
        heroName.translatesAutoresizingMaskIntoConstraints = false
        heroName.textColor = .white
        heroName.font = .systemFont(ofSize: 30, weight: .bold)
        heroName.textAlignment = .left
        return heroName
    }()
    
    public func configure(with hero: HeroModel){
        self.imageView.image = UIImage(named: hero.image)
        self.heroNameView.text = hero.name
        self.setupViewConstraints()
    }
    
    public func setupViewConstraints(){
        self.addSubview(imageView)
        imageView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.snp.top)
            make.width.equalTo(self.snp.width)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        self.addSubview(heroNameView)
        heroNameView.snp.makeConstraints{ (make) -> Void in
            make.bottom.equalTo(self.snp.bottom).offset(-30)
            make.leading.equalTo(self.snp.leading).offset(30)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
        self.heroNameView.text = nil
    }
}
