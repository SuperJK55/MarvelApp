//
//  AverageColorFromImage.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 09.04.2024.
//

import UIKit

extension UIImage {
    func averageColor() -> UIColor {
        guard let cgImage = self.cgImage else {
            return .clear
        }
        
        let inputImage = CIImage(cgImage: cgImage)
        let extent = inputImage.extent
        let inputExtent = CIVector(x: extent.origin.x, y: extent.origin.y, z: extent.size.width, w: extent.size.height)
        
        guard let filter = CIFilter(name: "CIAreaAverage") else {
            return .clear
        }
        
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(inputExtent, forKey: kCIInputExtentKey)
        
        guard let outputImage = filter.outputImage else {
            return .clear
        }
        
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: nil)
        
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: CIFormat.RGBA8, colorSpace: CGColorSpaceCreateDeviceRGB())
        
        let result = UIColor(red: CGFloat(bitmap[0]) / 255.0,
                             green: CGFloat(bitmap[1]) / 255.0,
                             blue: CGFloat(bitmap[2]) / 255.0,
                             alpha: CGFloat(bitmap[3]) / 255.0)
        
        return result
    }
}
