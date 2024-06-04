//  InfoAboutHeroesViewController.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 21.03.2024.
//

import UIKit

class InfoAboutHeroViewController: UIViewController {
    
    let viewModel: InfoAboutHeroViewModel
    
    init(hero: HeroModel) {
        self.viewModel = InfoAboutHeroViewModel(hero: hero)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var backgroundScreen: UIView = {
        let backgroundScreen = UIView()
        backgroundScreen.backgroundColor = UIColor(named: "main-color")
        backgroundScreen.accessibilityIdentifier = "infoBackgroundScreen"
        return backgroundScreen
    }()
    
    private lazy var heroImage: UIImageView = {
        let heroImage = UIImageView()
        heroImage.translatesAutoresizingMaskIntoConstraints = false
        heroImage.contentMode = .scaleAspectFill
        heroImage.clipsToBounds = true
        heroImage.accessibilityIdentifier = "detailedHeroImage"
        return heroImage
    }()
    
    private lazy var heroName: UILabel = {
        let heroName = UILabel()
        heroName.translatesAutoresizingMaskIntoConstraints = false
        heroName.font = .systemFont(ofSize: 40, weight: .bold)
        heroName.textColor = .white
        heroName.accessibilityIdentifier = "detailedHeroName"
        return heroName
    }()
    
    private lazy var heroInfo: UILabel = {
        let heroInfo = UILabel()
        heroInfo.translatesAutoresizingMaskIntoConstraints = false
        heroInfo.textColor = .white
        heroInfo.font = .systemFont(ofSize: 15, weight: .bold)
        heroInfo.accessibilityIdentifier = "infoAboutHero"
        return heroInfo
    }()
    
    private lazy var backButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "arrow.left")
        configuration.baseForegroundColor = .white
        configuration.buttonSize = .large
        
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        button.accessibilityIdentifier = "backOnMainScreenButton"
        return button
    }()
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateHeroCard()
    }
    
    private func updateHeroCard() {
        viewModel.loadImageFromURL(imageView: heroImage)
        heroName.text = viewModel.heroName
        heroInfo.text = viewModel.getHero().description == "" ? "Empty" : viewModel.getHero().description
    }
    
    private func setupView() {
        
        backgroundScreen.translatesAutoresizingMaskIntoConstraints = false
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
        
        backgroundScreen.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.backgroundScreen.snp.top).offset(50)
            make.leading.equalTo(self.backgroundScreen.snp.leading).offset(5)
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
