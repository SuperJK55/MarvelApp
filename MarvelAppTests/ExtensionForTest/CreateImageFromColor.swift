//
//  CreateImageFromColor.swift
//  MarvelAppTests
//
//  Created by Степан Коленкин on 04.06.2024.
//

import UIKit

extension UIImage {
    func fromColorToImage(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

