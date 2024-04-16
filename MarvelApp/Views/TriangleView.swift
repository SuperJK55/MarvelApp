//
//  TriangleView.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 16.04.2024.
//

import UIKit

class TriangleView: UIView {
    
    var colorFrame: UIColor{
        didSet{
            colorLayer.backgroundColor = colorFrame.cgColor
        }
    }
    private let colorLayer: CALayer
    
    init(colorFrame: UIColor) {
        self.colorFrame = colorFrame
        colorLayer = CALayer()
        colorLayer.backgroundColor = UIColor.clear.cgColor
        super.init(frame: SizeTriangle)
        layer.addSublayer(colorLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        colorLayer.frame = bounds
    }
    override func draw(_ rect: CGRect) {
        drawTriangle(color: colorFrame)
    }
    
    func drawTriangle(color: UIColor) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: UIScreen.main.bounds.width, y: cellHeight + 50))
        path.addLine(to: CGPoint(x: 0, y: cellHeight + 50))
        path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
        
        
        let fillColor = color
        fillColor.setFill()
        path.fill()
        path.stroke()
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        colorLayer.mask = maskLayer
    }
}

