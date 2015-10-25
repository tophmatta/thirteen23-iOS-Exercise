//
//  ViewNumberThree.swift
//  thirteen23 iOS Exercise
//
//  Created by Toph Matta on 10/24/15.
//  Copyright © 2015 Toph Matta. All rights reserved.
//

import UIKit

class ViewNumberThree: UIView {

    
    // Create new label and view
    var viewThree: UIView!
    var viewThreeLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        setupViewThree()
        setupViewThreeLabel()
    }
    
    func setupViewThree(){
        
        // Initialize viewThree
        self.viewThree = UIView()
        
        // Set props
        self.viewThree.backgroundColor = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1.0)
        self.viewThree.layer.cornerRadius = 100.0
        self.viewThree.translatesAutoresizingMaskIntoConstraints = false
        
        // Add to super view
        self.addSubview(viewThree)
        
        // Set X & Y center to super view
        let viewThreeCenterXConstraint = NSLayoutConstraint(item: self.viewThree, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let viewThreeCenterYConstraint = NSLayoutConstraint(item: self.viewThree, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        // Set width and height
        let viewThreeWidthConstraint = NSLayoutConstraint(item: self.viewThree, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 200)
        
        let viewThreeHeightConstraint = NSLayoutConstraint(item: self.viewThree, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 200)
        
        // Apply contsraints
        self.addConstraints([viewThreeCenterXConstraint, viewThreeCenterYConstraint, viewThreeWidthConstraint, viewThreeHeightConstraint])
        
    }
    
    func setupViewThreeLabel(){
        
        // Initialize label
        self.viewThreeLabel = UILabel()
        
        // Set label props
        self.viewThreeLabel.text = "3"
        self.viewThreeLabel.textColor = UIColor.whiteColor()
        self.viewThreeLabel.textAlignment = NSTextAlignment.Center
        self.viewThreeLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 50)
        
        self.viewThreeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add to super view
        viewThree.addSubview(viewThreeLabel)
        
        // Set X & Y center to super view
        let viewThreeLabelXCenter = NSLayoutConstraint(item: viewThreeLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: viewThree, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let viewThreeLabelYCenter = NSLayoutConstraint(item: viewThreeLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: viewThree, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        // Set width and height constraints
        let viewThreeLabelWidthConstraint = NSLayoutConstraint(item: viewThreeLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100)
        
        let viewThreeLabelHeightConstraint = NSLayoutConstraint(item: viewThreeLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100)
        
        // Apply constraints
        viewThree.addConstraints([viewThreeLabelXCenter, viewThreeLabelYCenter, viewThreeLabelWidthConstraint, viewThreeLabelHeightConstraint])
    }

}
