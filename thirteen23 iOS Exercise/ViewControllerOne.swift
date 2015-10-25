//
//  ViewControllerOne.swift
//  thirteen23 iOS Exercise
//
//  Created by Toph Matta on 10/22/15.
//  Copyright © 2015 Toph Matta. All rights reserved.
//

import UIKit

class ViewControllerOne: UIViewController {

    // Declare subviews to handle long press gesture recognizer
    var rightGestureView: UIView!
    var leftGestureView: UIView!
    
    // Create circleView labels
    var labelHome: UILabel!
    var labelTwo: UILabel!
    
    let transition = SlideAnimator()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = ViewNumberOne()
                
        // Add right and left gesture views
        addGestureViews()
        
        // Create gesture recognizers & set props
        let longGestureRight = UILongPressGestureRecognizer(target: self, action: "longPressed:")
        longGestureRight.minimumPressDuration = 1.0
        
        let longGestureLeft = UILongPressGestureRecognizer(target: self, action: "longPressed:")
        longGestureLeft.minimumPressDuration = 1.0
        
        
        // Add gesture recognizers to gesture subviews
        self.leftGestureView.addGestureRecognizer(longGestureLeft)
        
        self.rightGestureView.addGestureRecognizer(longGestureRight)
        
        
        // MARK: Buttons
        
        // ViewTwo button
        labelTwo = UILabel()
        labelTwo.frame = CGRectMake(0, 0, 50, 50)
        labelTwo.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        labelTwo.text = "2"
        labelTwo.textColor = UIColor.whiteColor()
        labelTwo.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        labelTwo.textAlignment = NSTextAlignment.Center
        
        
        // HomeView button
        labelHome = UILabel()
        labelHome.frame = CGRectMake(0, 0, 50, 50)
        labelHome.backgroundColor = UIColor.blackColor()
        labelHome.text = "h"
        labelHome.textColor = UIColor.whiteColor()
        labelHome.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        labelHome.textAlignment = NSTextAlignment.Center
        
    }
    
    func longPressed(longPress: UIGestureRecognizer){
        
        // Grab press location
        let circleCenterX = longPress.locationInView(view).x-25
        let circleCenterY = longPress.locationInView(view).y-25
        
        // Set a reg circle radius
        let circleWidth = CGFloat(50)
        let circleHeight = circleWidth
        
        // Create circle view frame
        let circleViewCenter = CircleMenu(frame: CGRectMake(circleCenterX, circleCenterY, circleWidth, circleHeight))
        
        let circleViewTop = CircleMenu(frame: CGRectMake(circleCenterX, circleCenterY, circleWidth, circleHeight))
        
        let circleViewMiddle = CircleMenu(frame: CGRectMake(circleCenterX, circleCenterY, circleWidth, circleHeight))
        
        
        // Set circleView props w/ tags
        circleViewCenter.layer.cornerRadius = 25
        circleViewCenter.tag = 1323
        
        circleViewTop.layer.cornerRadius = 25
        circleViewTop.tag = 1324
        
        circleViewMiddle.layer.cornerRadius = 25
        circleViewMiddle.tag = 1325
        
        
        // Set VC's for transitions
        let viewHome = ViewController()
        let viewTwo = ViewControllerTwo()
        
        
        // MARK:Actions for right gesture view
        if(longPress.state == UIGestureRecognizerState.Ended && longPress.view == rightGestureView){
            
            
            // Location test constants
            
            // Top
            let locationInCircleViewTop = longPress.locationInView(self.view.viewWithTag(1324)!)
            let touchInsideCircleViewTop = CGRectContainsPoint(self.view.viewWithTag(1324)!.bounds, locationInCircleViewTop)
            
            if touchInsideCircleViewTop {
                
                // Set delegate for custom transition
                viewHome.transitioningDelegate = self
                viewHome.modalPresentationStyle = UIModalPresentationStyle.Custom
                
                // Transition to viewHome
                presentViewController(viewHome, animated: true, completion: nil)
                
                print("this worked top")
                
            }
            
            // Middle
            let locationInCircleViewMiddle = longPress.locationInView(self.view.viewWithTag(1325)!)
            let touchInsideCircleViewMiddle = CGRectContainsPoint(self.view.viewWithTag(1325)!.bounds, locationInCircleViewMiddle)
            
            if touchInsideCircleViewMiddle {
                
                // Set delegate for custom transition
                viewTwo.transitioningDelegate = self
                viewTwo.modalPresentationStyle = UIModalPresentationStyle.Custom
                
                // Transition to viewTwo
                presentViewController(viewTwo, animated: true, completion: nil)
                
                print("this worked middle")
                
            }
            
            
            
            // Animate to remove all circleViews
            UIView.animateWithDuration(0.35, animations: { () -> Void in
                
                self.view.viewWithTag(1323)!.alpha = 0.0
                self.view.viewWithTag(1324)!.alpha = 0.0
                self.view.viewWithTag(1325)!.alpha = 0.0
                
                }, completion: { (Bool) -> Void in
                    
                    // Remove from super view
                    if self.view.viewWithTag(1323)!.alpha == 0.0{
                        
                        self.view.viewWithTag(1323)!.removeFromSuperview()
                        self.view.viewWithTag(1324)!.removeFromSuperview()
                        self.view.viewWithTag(1325)!.removeFromSuperview()
                        
                    }
            })
        }
        else if(longPress.state == UIGestureRecognizerState.Began && longPress.view == rightGestureView){
            
            // Add circleViews to where longPress occured
            self.view.addSubview(circleViewCenter)
            self.view.addSubview(circleViewTop)
            self.view.addSubview(circleViewMiddle)
            
            // Add labels to circleViews
            circleViewTop.addSubview(labelHome)
            circleViewMiddle.addSubview(labelTwo)
            
            
            // Set animation initial conditions
            circleViewCenter.alpha = 0.0
            circleViewMiddle.alpha = 0.0
            circleViewTop.alpha = 0.0
            
            
            // Animate center circleView
            UIView.animateWithDuration(0.35, animations: { () -> Void in
                
                circleViewCenter.alpha = 0.2
                circleViewCenter.clipsToBounds = true
                
                circleViewTop.userInteractionEnabled = true
                
                circleViewCenter.layoutIfNeeded()
            })
            
            // Animate surrounding circleViews
            UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.35, initialSpringVelocity: 0.05, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                
                // Top
                circleViewTop.alpha = 1.0
                circleViewTop.transform = CGAffineTransformMakeTranslation(-47.0, -60.0)
                circleViewTop.clipsToBounds = true
                
                // Middle
                circleViewMiddle.alpha = 1.0
                circleViewMiddle.transform = CGAffineTransformMakeTranslation(-65.0, 0)
                circleViewMiddle.clipsToBounds = true

                }, completion: nil)
        }
        
        
        // MARK:Actions for left gesture view
        if(longPress.state == UIGestureRecognizerState.Ended && longPress.view == leftGestureView){
            
            // Location test constants
            
            // Top
            let locationInCircleViewTop = longPress.locationInView(self.view.viewWithTag(1324)!)
            let touchInsideCircleViewTop = CGRectContainsPoint(self.view.viewWithTag(1324)!.bounds, locationInCircleViewTop)
            
            if touchInsideCircleViewTop {
                
                // Set delegate for custom transition
                viewHome.transitioningDelegate = self
                viewHome.modalPresentationStyle = UIModalPresentationStyle.Custom
                
                // Transition to viewHome
                presentViewController(viewHome, animated: true, completion: nil)
                
                print("this worked top")
                
            }
            
            // Middle
            let locationInCircleViewMiddle = longPress.locationInView(self.view.viewWithTag(1325)!)
            let touchInsideCircleViewMiddle = CGRectContainsPoint(self.view.viewWithTag(1325)!.bounds, locationInCircleViewMiddle)
            
            if touchInsideCircleViewMiddle {
                
                // Set delegate for custom transition
                viewTwo.transitioningDelegate = self
                viewTwo.modalPresentationStyle = UIModalPresentationStyle.Custom
                
                // Transition to viewTwo
                presentViewController(viewTwo, animated: true, completion: nil)
                
                print("this worked middle")
                
            }
            
            // Animate to remove all circleViews
            UIView.animateWithDuration(0.35, animations: { () -> Void in
                
                
                self.view.viewWithTag(1323)!.alpha = 0.0
                self.view.viewWithTag(1324)!.alpha = 0.0
                self.view.viewWithTag(1325)!.alpha = 0.0
                
                }, completion: { (Bool) -> Void in
                    
                    // Remove from super view
                    if self.view.viewWithTag(1323)!.alpha == 0.0{
                        
                        self.view.viewWithTag(1323)!.removeFromSuperview()
                        self.view.viewWithTag(1324)!.removeFromSuperview()
                        self.view.viewWithTag(1325)!.removeFromSuperview()
                        
                    }
            })
            
        }
        else if(longPress.state == UIGestureRecognizerState.Began && longPress.view == leftGestureView){
            
            // Add circleView to where longPress occured
            self.view.addSubview(circleViewCenter)
            self.view.addSubview(circleViewTop)
            self.view.addSubview(circleViewMiddle)
            
            // Add labels to circleViews
            circleViewTop.addSubview(labelHome)
            circleViewMiddle.addSubview(labelTwo)
            
            // Set animation initial conditions
            circleViewCenter.alpha = 0.0
            circleViewMiddle.alpha = 0.0
            circleViewTop.alpha = 0.0
            
            
            // Animate center circleView
            UIView.animateWithDuration(0.35, animations: { () -> Void in
                
                circleViewCenter.alpha = 0.2
                circleViewCenter.clipsToBounds = true
                
                circleViewCenter.layoutIfNeeded()
            })
            
            // Animate surrounding circleViews
            UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.35, initialSpringVelocity: 0.05, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                
                // Top
                circleViewTop.alpha = 1.0
                circleViewTop.transform = CGAffineTransformMakeTranslation(47.0, -60.0)
                circleViewTop.clipsToBounds = true
                
                // Middle
                circleViewMiddle.alpha = 1.0
                circleViewMiddle.transform = CGAffineTransformMakeTranslation(65.0, 0)
                circleViewMiddle.clipsToBounds = true
                
                }, completion: nil)
            
        }
    }
    
    
    func addGestureViews(){
        
        // Initialize right gesture view and set props
        self.rightGestureView = UIView()
        self.rightGestureView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add to super view
        self.view.addSubview(rightGestureView)
        
        // Define constraints
        let rightGestureViewTopConstraint = NSLayoutConstraint(item: rightGestureView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.TopMargin, multiplier: 1, constant: 0)
        
        let rightGestureViewBottomConstraint = NSLayoutConstraint(item: rightGestureView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.BottomMargin, multiplier: 1, constant: 0)
        
        let rightGestureViewRightConstraint = NSLayoutConstraint(item: rightGestureView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        
        let rightGestureViewCenterConstraint = NSLayoutConstraint(item: rightGestureView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        // Add constraints
        self.view.addConstraints([rightGestureViewTopConstraint, rightGestureViewBottomConstraint, rightGestureViewRightConstraint, rightGestureViewCenterConstraint])
        
        
        // Initialize left gesture view and set props
        self.leftGestureView = UIView()
        self.leftGestureView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add to super view
        self.view.addSubview(leftGestureView)
        
        // Define constraints
        let leftGestureViewTopConstraint = NSLayoutConstraint(item: leftGestureView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.TopMargin, multiplier: 1, constant: 0)
        
        let leftGestureViewBottomConstraint = NSLayoutConstraint(item: leftGestureView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.BottomMargin, multiplier: 1, constant: 0)
        
        let leftGestureViewLeftConstraint = NSLayoutConstraint(item: leftGestureView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        
        let leftGestureViewCenterConstraint = NSLayoutConstraint(item: leftGestureView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        // Add constraints
        self.view.addConstraints([leftGestureViewTopConstraint, leftGestureViewBottomConstraint, leftGestureViewLeftConstraint, leftGestureViewCenterConstraint])
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewControllerOne: UIViewControllerTransitioningDelegate{
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return transition
        
    }
}
