//
//  ViewController.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 07.03.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var backgroundScreen: UIView = {
        let backgroundScreen = UIView()
        backgroundScreen.translatesAutoresizingMaskIntoConstraints = false
        backgroundScreen.backgroundColor = UIColor(named: "main-color")
        return backgroundScreen
    }()
    
    private lazy var marvelLogo: UIImageView = {
        let marvelLogo = UIImageView()
        marvelLogo.translatesAutoresizingMaskIntoConstraints = false
        marvelLogo.image = UIImage(named: "marvel-logo")
        marvelLogo.contentMode = .scaleAspectFit
        return marvelLogo
    }()
    
    private lazy var titleText: UILabel = {
        let titleText = UILabel()
        titleText.translatesAutoresizingMaskIntoConstraints = false
        titleText.text = "Choose your hero"
        titleText.font = .systemFont(ofSize: 30, weight: .bold)
        titleText.textColor = .white
        titleText.textAlignment = .center
        return titleText
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConstraints()
    }
    
    private func setupViewConstraints() {
        
        view.addSubview(backgroundScreen)
        backgroundScreen.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
        }
        
        backgroundScreen.addSubview(marvelLogo)
        marvelLogo.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.backgroundScreen.snp.top).offset(70)
            make.centerX.equalTo(self.backgroundScreen.snp.centerX)
            make.height.equalTo(45)
        }
        
        backgroundScreen.addSubview(titleText)
        titleText.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.marvelLogo.snp.bottom).offset(40)
            make.width.equalTo(self.backgroundScreen.snp.width)
        }
        
    }
    
}
