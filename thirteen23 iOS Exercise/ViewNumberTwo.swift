//
//  ViewNumberTwo.swift
//  thirteen23 iOS Exercise
//
//  Created by Toph Matta on 10/24/15.
//  Copyright © 2015 Toph Matta. All rights reserved.
//

import UIKit

class ViewNumberTwo: UIView {

    // Create new label and view
    var viewTwo: UIView!
    var viewTwoLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        setupViewTwo()
        setupViewTwoLabel()
    }
    
    func setupViewTwo(){
        
        // Initialize viewTwo
        self.viewTwo = UIView()
        
        // Set props
        self.viewTwo.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.viewTwo.layer.cornerRadius = 100.0
        self.viewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        // Add to super view
        self.addSubview(viewTwo)
        
        // Set X & Y center to super view
        let viewTwoCenterXConstraint = NSLayoutConstraint(item: self.viewTwo, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let viewTwoCenterYConstraint = NSLayoutConstraint(item: self.viewTwo, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        // Set width and height
        let viewTwoWidthConstraint = NSLayoutConstraint(item: self.viewTwo, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 200)
        
        let viewTwoHeightConstraint = NSLayoutConstraint(item: self.viewTwo, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 200)
        
        // Apply contsraints
        self.addConstraints([viewTwoCenterXConstraint, viewTwoCenterYConstraint, viewTwoWidthConstraint, viewTwoHeightConstraint])
        
    }
    
    func setupViewTwoLabel(){
        
        // Initialize label
        self.viewTwoLabel = UILabel()
        
        // Set label props
        self.viewTwoLabel.text = "2"
        self.viewTwoLabel.textColor = UIColor.whiteColor()
        self.viewTwoLabel.textAlignment = NSTextAlignment.Center
        self.viewTwoLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 50)
        
        self.viewTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add to super view
        viewTwo.addSubview(viewTwoLabel)
        
        // Set X & Y center to super view
        let viewTwoLabelXCenter = NSLayoutConstraint(item: viewTwoLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: viewTwo, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let viewTwoLabelYCenter = NSLayoutConstraint(item: viewTwoLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: viewTwo, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        // Set width and height constraints
        let viewTwoLabelWidthConstraint = NSLayoutConstraint(item: viewTwoLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100)
        
        let viewTwoLabelHeightConstraint = NSLayoutConstraint(item: viewTwoLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100)
        
        // Apply constraints
        viewTwo.addConstraints([viewTwoLabelXCenter, viewTwoLabelYCenter, viewTwoLabelWidthConstraint, viewTwoLabelHeightConstraint])
    }

}
