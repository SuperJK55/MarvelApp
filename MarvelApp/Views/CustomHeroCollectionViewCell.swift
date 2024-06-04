//
//  CustomCollectionViewCell.swift
//  MarvelTestApp
//
//  Created by Степан Коленкин on 05.03.2024.
//

import UIKit
import CollectionViewPagingLayout

class CustomHeroCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomHeroCollectionViewCellId"
    
    private lazy var backgroundScreen: UIView! = {
        let backgroundScreen = UIView()
        backgroundScreen.translatesAutoresizingMaskIntoConstraints = false
        backgroundScreen.backgroundColor = UIColor(named: "main-color")
        backgroundScreen.accessibilityIdentifier = "cardBackgroundScreen"
        return backgroundScreen
    }()
    
    private lazy var heroImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "questionmark")
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.accessibilityIdentifier = "cardHeroImage"
        return image
    }()
    
    private lazy var heroNameView: UILabel = {
        let heroName = UILabel()
        heroName.translatesAutoresizingMaskIntoConstraints = false
        heroName.textColor = .white
        heroName.font = .systemFont(ofSize: 30, weight: .bold)
        heroName.textAlignment = .left
        heroName.numberOfLines = 2
        heroName.accessibilityIdentifier = "cardHeroName"
        return heroName
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewConstraints()
    }
    
    public func configure(viewModel: InfoAboutHeroViewModel) {
        self.heroNameView.text = viewModel.heroName
        viewModel.loadImageFromURL(imageView: heroImageView)
    }
    
    public func setupViewConstraints(){
        
        backgroundScreen = UIView(frame: cardFrame)
        contentView.addSubview(backgroundScreen)
        
        backgroundScreen.addSubview(heroImageView)
        heroImageView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.backgroundScreen.snp.top)
            make.width.equalTo(self.backgroundScreen.snp.width)
            make.bottom.equalTo(self.backgroundScreen.snp.bottom)
        }
        
        backgroundScreen.addSubview(heroNameView)
        heroNameView.snp.makeConstraints{ (make) -> Void in
            make.bottom.equalTo(self.backgroundScreen.snp.bottom).offset(-30)
            make.leading.equalTo(self.backgroundScreen.snp.leading).offset(30)
            make.trailing.equalTo(self.backgroundScreen.snp.trailing).offset(-25)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.heroImageView.image = nil
        self.heroNameView.text = nil
    }
    
    public func getHeroesImage() -> UIImage?{
        return heroImageView.image
    }
}
extension CustomHeroCollectionViewCell: ScaleTransformView{
    var scaleOptions: ScaleTransformViewOptions{
        .layout(.linear)
    }
}
