//  InfoAboutHeroesViewController.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 21.03.2024.
//

import UIKit

class InfoAboutHeroesViewController: UIViewController {
    
    let viewModel: InfoHeroViewModel
    var heroModel: HeroModel
    
    init(hero: HeroModel) {
        self.heroModel = hero
        self.viewModel = InfoHeroViewModel(hero: hero)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var backgroundScreen: UIView = {
        let backgroundScreen = UIView()
        backgroundScreen.translatesAutoresizingMaskIntoConstraints = false
        backgroundScreen.backgroundColor = UIColor(named: "main-color")
        return backgroundScreen
    }()

    private lazy var heroImage: UIImageView = {
        let heroImage = UIImageView()
        heroImage.translatesAutoresizingMaskIntoConstraints = false
        heroImage.clipsToBounds = true
        return heroImage
    }()
    
    private lazy var heroName: UILabel = {
        let heroName = UILabel()
        heroName.translatesAutoresizingMaskIntoConstraints = false
        heroName.font = .systemFont(ofSize: 40, weight: .bold)
        heroName.textColor = .white
        return heroName
    }()
    
    private lazy var heroInfo: UILabel = {
        let heroInfo = UILabel()
        heroInfo.translatesAutoresizingMaskIntoConstraints = false
        heroInfo.textColor = .white
        heroInfo.font = .systemFont(ofSize: 40, weight: .bold)
        return heroInfo
    }()
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    private func setupView() {
        viewModel.loadImageFromURL(imageView: heroImage)
        heroName.text = heroModel.name
        heroInfo.text = heroModel.infoAboutHero
        
        view.addSubview(backgroundScreen)
        backgroundScreen.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
        }
        
        backgroundScreen.addSubview(heroImage)
        heroImage.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(backgroundScreen.snp.top)
            make.bottom.equalTo(backgroundScreen.snp.bottom)
            make.leading.equalTo(backgroundScreen.snp.leading)
            make.trailing.equalTo(backgroundScreen.snp.trailing)
        }
        
        
        backgroundScreen.addSubview(heroInfo)
        heroInfo.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundScreen.snp.bottom).offset(-50)
            make.leading.equalTo(backgroundScreen.snp.leading).offset(20)
            make.trailing.equalTo(backgroundScreen.snp.trailing).offset(-50)
        }
        
        backgroundScreen.addSubview(heroName)
        heroName.snp.makeConstraints { make in
            make.bottom.equalTo(heroInfo.snp.top).offset(-10)
            make.leading.equalTo(heroInfo.snp.leading)
            make.trailing.equalTo(heroInfo.snp.trailing)
        }
    }
}
