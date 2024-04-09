//
//  LoaderViewModel.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 05.04.2024.
//

import UIKit

class LoaderViewModel {
    
    static let state = LoaderViewModel()
    
    private let backgroundScreen: UIView = {
        let backgroundScreen = UIView()
        backgroundScreen.backgroundColor = UIColor(named: "main-color")
        return backgroundScreen
    }()
    
    private let loaderIndicator: UIActivityIndicatorView = {
        let loaderIndicator = UIActivityIndicatorView(style: .large)
        loaderIndicator.color = .red
        loaderIndicator.backgroundColor = .clear
        return loaderIndicator
    }()
    
    static func loaderActivate() {
        DispatchQueue.main.async {
            state.loaderIndicator.startAnimating()
        }
    }
    
    static func loaderDeactivate() {
        DispatchQueue.main.async {
            state.backgroundScreen.isHidden = true
            state.loaderIndicator.stopAnimating()
        }
    }
    
    private init() { guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        let loaderWindow = firstScene.windows.first
        
        if let keyWindow = loaderWindow {
            keyWindow.addSubview(backgroundScreen)
            backgroundScreen.addSubview(loaderIndicator)
            backgroundScreen.frame = keyWindow.bounds
            loaderIndicator.center = backgroundScreen.center
        }
    }
}

