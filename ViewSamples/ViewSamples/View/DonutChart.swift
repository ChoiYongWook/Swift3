//
//  DonutChart.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 27..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

func radian(_ degree: Double) -> CGFloat {
    return CGFloat(degree / 180.0 * M_PI)
}

@IBDesignable
class DonutChart: UIView {
    @IBInspectable
    var value: CGFloat = 0.0
    
    @IBInspectable
    var chartColor: UIColor = UIColor.yellow
    
    @IBInspectable
    var chartBackgroundColor: UIColor = UIColor.red
    
    override func draw(_ rect: CGRect) {
        if let ctx = UIGraphicsGetCurrentContext() {
            let radius = (rect.size.width / 2) - 80
            
            let center = CGPoint(x: rect.size.width / 2.0, y: rect.size.width / 2.0)
            ctx.addArc(center: center, radius: radius, startAngle: radian(0), endAngle: CGFloat(M_PI * 2.0), clockwise: false)
            chartBackgroundColor.set()
            ctx.setLineWidth(60)
            ctx.drawPath(using: CGPathDrawingMode.stroke)
            
            ctx.addArc(center: center, radius: radius, startAngle: radian(-90), endAngle: radian(360 * Double(value)) + radian(-90), clockwise: false)
            chartColor.set()
            ctx.setLineWidth(60)
            ctx.drawPath(using: CGPathDrawingMode.stroke)
        }
    }
    
//        override func prepareForInterfaceBuilder() {
//            value = 0.6
//        }
}
