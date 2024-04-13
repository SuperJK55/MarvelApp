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
    
    lazy var heroImageView: UIImageView = {
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
        heroName.numberOfLines = 2
        return heroName
    }()
    
    public func configure(viewModel: InfoAboutHero) {
        self.heroNameView.text = viewModel.heroName
        viewModel.loadImageFromURL(imageView: heroImageView)
        self.setupViewConstraints()
    }
    
    public func setupViewConstraints(){
        self.addSubview(heroImageView)
        heroImageView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.snp.top)
            make.width.equalTo(self.snp.width)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        self.addSubview(heroNameView)
        heroNameView.snp.makeConstraints{ (make) -> Void in
            make.bottom.equalTo(self.snp.bottom).offset(-30)
            make.leading.equalTo(self.snp.leading).offset(30)
            make.trailing.equalTo(self.snp.trailing).offset(-25)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.heroImageView.image = nil
        self.heroNameView.text = nil
    }
}

extension CustomHeroCollectionViewCell: ScaleTransformView{
    var scaleOptions: ScaleTransformViewOptions{
        ScaleTransformViewOptions(
            minScale: 0.6,
            scaleRatio: 0.4,
            translationRatio: CGPoint(x: 0.66, y: 0.2),
            maxTranslationRatio: CGPoint(x: 2, y: 0),
            keepVerticalSpacingEqual: true,
            keepHorizontalSpacingEqual: true,
            scaleCurve: .linear,
            translationCurve: .linear
        )
    }
    func transform(progress: CGFloat) {
        applyScaleTransform(progress: progress)
    }
}
