//
//  ViewNumberOne.swift
//  thirteen23 iOS Exercise
//
//  Created by Toph Matta on 10/15/15.
//  Copyright © 2015 Toph Matta. All rights reserved.
//

import UIKit

class ViewNumberOne: UIView {

  // Create new label and view
    var viewOne: UIView!
    var viewOneLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        setupViewOne()
        setupViewOneLabel()
    }
    
    func setupViewOne(){
        
        // Initialize viewOne
        self.viewOne = UIView()
        
        // Set props
        self.viewOne.backgroundColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
        self.viewOne.layer.cornerRadius = 100.0
        self.viewOne.translatesAutoresizingMaskIntoConstraints = false
        
        // Add to super view
        self.addSubview(viewOne)
        
        // Set X & Y center to super view
        let viewOneCenterXConstraint = NSLayoutConstraint(item: self.viewOne, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let viewOneCenterYConstraint = NSLayoutConstraint(item: self.viewOne, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        // Set width and height
        let viewOneWidthConstraint = NSLayoutConstraint(item: self.viewOne, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 200)
        
        let viewOneHeightConstraint = NSLayoutConstraint(item: self.viewOne, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 200)
        
        // Apply contsraints
        self.addConstraints([viewOneCenterXConstraint, viewOneCenterYConstraint, viewOneWidthConstraint, viewOneHeightConstraint])
        
    }
    
    func setupViewOneLabel(){
        
        // Initialize label
        self.viewOneLabel = UILabel()
        
        // Set label props
        self.viewOneLabel.text = "1"
        self.viewOneLabel.textColor = UIColor.whiteColor()
        self.viewOneLabel.textAlignment = NSTextAlignment.Center
        self.viewOneLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 50)
        
        self.viewOneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add to super view
        viewOne.addSubview(viewOneLabel)
        
        // Set X & Y center to super view
        let viewOneLabelXCenter = NSLayoutConstraint(item: viewOneLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: viewOne, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let viewOneLabelYCenter = NSLayoutConstraint(item: viewOneLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: viewOne, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        // Set width and height constraints
        let viewOneLabelWidthConstraint = NSLayoutConstraint(item: viewOneLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100)
        
        let viewOneLabelHeightConstraint = NSLayoutConstraint(item: viewOneLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100)
        
        // Apply constraints
        viewOne.addConstraints([viewOneLabelXCenter, viewOneLabelYCenter, viewOneLabelWidthConstraint, viewOneLabelHeightConstraint])
    }
}
