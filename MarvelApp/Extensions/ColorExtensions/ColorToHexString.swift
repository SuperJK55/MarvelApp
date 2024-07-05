//
//  ColorToHexString.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 04.06.2024.
//

import UIKit

extension UIColor {
    func toHexString() -> String {
        
        guard let components = cgColor.components else {
            return "#FFFFFF"
        }
        
        let r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat
        
        if cgColor.numberOfComponents == 2 {
            r = components[0]
            g = components[0]
            b = components[0]
            a = components[1]
        } else {
            r = components[0]
            g = components[1]
            b = components[2]
            a = components[3]
        }
        
        return String(format: "#%02lX%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)), lroundf(Float(a * 255)))
    }
}
