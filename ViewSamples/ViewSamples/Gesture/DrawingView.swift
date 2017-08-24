//
//  DrawingView.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class DrawingView: UIView {

    var points = [CGPoint]()
    
    func drawForFirstTouchInSet(s: Set<UITouch>, event: UIEvent?) {
        guard let touch = s.first, let evt = event, let allTouches = evt.coalescedTouches(for: touch), allTouches.count > 0 else {
            return
        }
        
        points += allTouches.map { $0.location(in: self) }
        
        setNeedsDisplay()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        points.removeAll()
        drawForFirstTouchInSet(s: touches, event: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        points.removeAll()
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawForFirstTouchInSet(s: touches, event: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let evt = event, let allTouches = evt.predictedTouches(for: touch), allTouches.count > 0 else {
            return
        }
        
        points += allTouches.map { $0.location(in: self) }
        
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setFillColor(UIColor.black.cgColor)
        ctx?.fill(rect)
        
        ctx?.setLineWidth(3.0)
        ctx?.setFillColor(UIColor.yellow.cgColor)
        ctx?.setStrokeColor(UIColor.yellow.cgColor)
        
        for point in points {
            ctx?.move(to: point)
            
            if let last = points.last, point != last {
                let next = points[points.index(of: point)! + 1]
                ctx?.addLine(to: next)
            }
        }
        
        ctx?.strokePath()
    }

}
