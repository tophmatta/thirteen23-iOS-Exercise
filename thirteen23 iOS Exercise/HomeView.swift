//
//  HomeView.swift
//  thirteen23 iOS Exercise
//
//  Created by Toph Matta on 10/15/15.
//  Copyright © 2015 Toph Matta. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    // Create new label and view
    var homeView: UIView!
    var homeViewLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        setupHomeView()
        setupHomeViewLabel()
    }
    
    func setupHomeView(){
        
        // Initialize homeView
        self.homeView = UIView()
        
        // Set props
        self.homeView.backgroundColor = UIColor.blackColor()
        self.homeView.layer.cornerRadius = 100.0
        self.homeView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add to super view
        self.addSubview(homeView)
        
        // Set X & Y center to super view
        let homeViewCenterXConstraint = NSLayoutConstraint(item: self.homeView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let homeViewCenterYConstraint = NSLayoutConstraint(item: self.homeView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        // Set width and height
        let homeViewWidthConstraint = NSLayoutConstraint(item: self.homeView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 200)
        
        let homeViewHeightConstraint = NSLayoutConstraint(item: self.homeView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 200)
        
        // Apply contsraints
        self.addConstraints([homeViewCenterXConstraint, homeViewCenterYConstraint, homeViewWidthConstraint, homeViewHeightConstraint])
        
    }
    
    func setupHomeViewLabel(){
        
        // Initialize label
        self.homeViewLabel = UILabel()
        
        // Set label props
        self.homeViewLabel.text = "Home"
        self.homeViewLabel.textColor = UIColor.whiteColor()
        self.homeViewLabel.textAlignment = NSTextAlignment.Center
        self.homeViewLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        
        self.homeViewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add to super view
        homeView.addSubview(homeViewLabel)
        
        // Set X & Y center to super view
        let homeViewLabelXCenter = NSLayoutConstraint(item: homeViewLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: homeView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let homeViewLabelYCenter = NSLayoutConstraint(item: homeViewLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: homeView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        // Set width and height constraints
        let homeViewLabelWidthConstraint = NSLayoutConstraint(item: homeViewLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100)
        
        let homeViewHeightConstraint = NSLayoutConstraint(item: homeViewLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100)
        
        // Apply constraints
        homeView.addConstraints([homeViewLabelXCenter, homeViewLabelYCenter, homeViewLabelWidthConstraint, homeViewHeightConstraint])
    }
}
