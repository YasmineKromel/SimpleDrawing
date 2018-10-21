//
//  ImageDrawArea.swift
//  SimpleDrawing
//
//  Created by mino on 10/20/18.
//  Copyright © 2018 mino. All rights reserved.
//

import UIKit

class ImageDrawArea: UIImageView {

    var Lines: [line ] = []
    var LastPoint :CGPoint!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>!, with event: UIEvent!) {
        LastPoint = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var NewPoint = touches.first?.location(in: self)
        Lines.append(line(_start: LastPoint, _end: NewPoint!))
        LastPoint = NewPoint
        self.setNeedsDisplay()
        
    }
    
    override func draw(_ rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        context!.beginPath()
        for line in Lines
        {
            
            context?.move(to: CGPoint(x: line.start.x , y: line.start.y))
            context?.addLine(to: CGPoint(x: line.end.x , y: line.end.y))
            context?.setStrokeColor(red:255, green:255, blue:255, alpha: 1)
            context?.setLineCap(CGLineCap.round)
            context?.setLineWidth(5)
            context?.strokePath()
            
        }
    }


}
