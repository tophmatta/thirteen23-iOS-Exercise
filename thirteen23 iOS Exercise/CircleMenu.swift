//
//  CircleMenu.swift
//  thirteen23 iOS Exercise
//
//  Created by Toph Matta on 10/17/15.
//  Copyright © 2015 Toph Matta. All rights reserved.
//

import UIKit

class CircleMenu: UIView {
    
    var circleMenu: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGrayColor()
        self.alpha = 0.5
        
        
    }
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, 3.0)
        
        UIColor.clearColor().set()
        
        CGContextAddArc(context, (frame.size.width)/2, frame.size.height/2, frame.size.width/2, 0.0, CGFloat(M_PI * 2.0), 1)
        
        CGContextStrokePath(context)
        
    }
    
    
    
    
}
