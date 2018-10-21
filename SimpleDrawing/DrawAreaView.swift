//
//  DrawAreaView.swift
//  SimpleDrawing
//
//  Created by mino on 10/20/18.
//  Copyright © 2018 mino. All rights reserved.
//

import UIKit

class DrawAreaView: UIView {

    var Lines: [line ] = []
    var LastPoint :CGPoint!
    
    var red : CGFloat = 255.0
    var green : CGFloat = 255.0
    var blue : CGFloat = 255.0
    var a :CGFloat = 1.0
    
    
     required init?(coder aDecoder: NSCoder) {
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
    
    public func getColorValue(r:CGFloat , g:CGFloat , b:CGFloat ,al:CGFloat)
    {
        red = r
        green = g
        blue = b
        a = al
    }
    
    override func draw(_ rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        context!.beginPath()
        for line in Lines
        {
            
            context?.move(to: CGPoint(x: line.start.x , y: line.start.y))
            context?.addLine(to: CGPoint(x: line.end.x , y: line.end.y))
            context?.setStrokeColor(red:red,green:green, blue:blue,alpha:a)
            context?.setLineCap(CGLineCap.round)
            context?.setLineWidth(5)
            context?.strokePath()
            
        }
    }

}
