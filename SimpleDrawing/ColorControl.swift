//
//  ColorControl.swift
//  SimpleDrawing
//
//  Created by mino on 10/20/18.
//  Copyright © 2018 mino. All rights reserved.
//

import UIKit

class ColorControl: UIStackView {
    
    var _red :CGFloat = 255.0
    var _green : CGFloat = 255.0
    var _blue : CGFloat = 255.0
    var _a : CGFloat = 1.0
    

    var Buttons : [UIButton] = []
    
    var Colors:[Color] = [Color(_red:0,_green:0,_blue:0,_a:1.0) , Color(_red:1,_green:1,_blue:1,_a:1.0),Color(_red:255,_green:0,_blue:255,_a:1.0), Color(_red:0,_green:255,_blue:0,_a:1.0),Color(_red:0,_green:255,_blue:255,_a:1.0),Color(_red:255,_green:255,_blue:0,_a:1.0),Color(_red:128,_green:0,_blue:0,_a:1.0)]
    
    
    override init(frame: CGRect) {
        
        super.init(frame:frame)
        SetColors()
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        SetColors()
    }

    
    private func SetColors ()
    {
        for c in Colors
        {
            
            let Btn = UIButton()
            Btn.backgroundColor = UIColor(red:CGFloat(c.red) , green: CGFloat(c.green), blue:CGFloat(c.blue) , alpha: c.alpha)
            
            // Setup the button action
            Btn.addTarget(self, action: #selector(ColorControl.ColorButtonTapped(button:)), for: .touchUpInside)
            Buttons.append(Btn)
            
        }
        super.removeFromSuperview()
        
        for B in Buttons
        {
          super.addArrangedSubview(B)
        }
    }
    
    func ColorButtonTapped(button: UIButton){
        
        var C = button.backgroundColor!
        
        _red = (C.cgColor.components?[0])!
        _green = (C.cgColor.components?[1])!
         _blue = (C.cgColor.components?[2])!
        _a = (C.cgColor.components?[3])!

        if let vc = DrawAreaView.init(coder: NSCoder.empty())
            
        {
            vc.getColorValue(r:_red ,g:_green,b:_blue,al:_a)
//            vc.red = _red
//            vc.green = _green            
//            vc.blue = _blue
//            vc.a = _a
        }
      
     
        
    }
    
   

}

extension NSCoder {
    class func empty() -> NSCoder {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.finishEncoding()
        return NSKeyedUnarchiver(forReadingWith: data as Data)
    }
}
