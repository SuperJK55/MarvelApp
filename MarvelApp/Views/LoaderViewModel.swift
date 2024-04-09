//
//  LoaderViewModel.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 05.04.2024.
//

import UIKit

class LoadingIndicator {
    static let shared = LoadingIndicator()
    
    private let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .red
        indicator.backgroundColor = .clear
        return indicator
    }()
    
    private init() {
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        let firstWindow = firstScene.windows.first
        
        if let keyWindow = firstWindow {
            keyWindow.addSubview(overlayView)
            overlayView.addSubview(activityIndicator)
            
            overlayView.frame = keyWindow.bounds
            activityIndicator.center = overlayView.center
        }
    }
    
    static func startLoading() {
        DispatchQueue.main.async {
            shared.overlayView.isHidden = false
            shared.activityIndicator.startAnimating()
        }
    }
    
    static func stopLoading() {
        DispatchQueue.main.async {
            shared.overlayView.isHidden = true
            shared.activityIndicator.stopAnimating()
        }
    }
}

