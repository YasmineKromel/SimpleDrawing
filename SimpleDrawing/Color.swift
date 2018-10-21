//
//  Color.swift
//  SimpleDrawing
//
//  Created by mino on 10/20/18.
//  Copyright © 2018 mino. All rights reserved.
//


import UIKit

class Color {
    
    var red :Int
    var green : Int
    var blue: Int
    var alpha : CGFloat
    
    init(_red:Int , _green:Int , _blue:Int , _a: CGFloat)
    {
        red = _red
        green = _green
        blue = _blue
        alpha = _a
    }
}
