//
//  SlideAnimator.swift
//  thirteen23 iOS Exercise
//
//  Created by Toph Matta on 10/22/15.
//  Copyright © 2015 Toph Matta. All rights reserved.
//

import UIKit

class SlideAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.75
    
    // Set duration of transition
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    // Tell animator object to perform transition
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // Create container view
        let containerView = transitionContext.containerView()!
        containerView.backgroundColor = UIColor.purpleColor()
        
        // Create to and from VCs
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!

        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        
        // Designate final frame when animation completes
        let finalFrame = transitionContext.finalFrameForViewController(toViewController)
        
        
        // Starting region from toViewController based on transition direction needed
        let offsetScreenBottom = UIScreen.mainScreen().bounds.height
        
        let offsetScreenTop = -UIScreen.mainScreen().bounds.height
        
        let offsetScreenRight = UIScreen.mainScreen().bounds.width
        
        let offsetScreenLeft = -UIScreen.mainScreen().bounds.width
        
        
        // Set initial starting point of toVC view based on fromVC
        
        // From home to view 1,2, or 3
        if fromViewController.view is HomeView{
            toViewController.view.frame = CGRectOffset(finalFrame, 0, offsetScreenBottom)
        }
        
        
        
        // From view1 to home
        if fromViewController.view is ViewNumberOne && toViewController.view is HomeView {
            toViewController.view.frame = CGRectOffset(finalFrame, 0, offsetScreenTop)
        }
        
        // From view1 to view2
        if fromViewController.view is ViewNumberOne && toViewController.view is ViewNumberTwo{
            toViewController.view.frame = CGRectOffset(finalFrame, offsetScreenRight, 0)
        }
        
        
        // From view2 to home
        if fromViewController.view is ViewNumberTwo && toViewController.view is HomeView {
            toViewController.view.frame = CGRectOffset(finalFrame, 0, offsetScreenTop)
        }
        
        // From view2 to view1
        if fromViewController.view is ViewNumberTwo && toViewController.view is ViewNumberOne{
            toViewController.view.frame = CGRectOffset(finalFrame, offsetScreenLeft, 0)
        }
        
        // From view2 to view3
        if fromViewController.view is ViewNumberTwo && toViewController.view is ViewNumberThree{
            toViewController.view.frame = CGRectOffset(finalFrame, offsetScreenRight, 0)
        }
        
        
        // From view3 to home
        if fromViewController.view is ViewNumberThree && toViewController.view is HomeView {
            toViewController.view.frame = CGRectOffset(finalFrame, 0, offsetScreenTop)
        }
        
        // From view3 to view2
        if fromViewController.view is ViewNumberThree && toViewController.view is ViewNumberTwo{
            toViewController.view.frame = CGRectOffset(finalFrame, offsetScreenLeft, 0)
        }
        
        
        // Add to and from VCs for transition to container view
        containerView.addSubview(toViewController.view)
        containerView.addSubview(fromViewController.view)
        
    
        // Call animation on toVC and fromVC
        UIView.animateWithDuration(duration, animations: { () -> Void in
            
            // From home to view 1,2, or 3
            if fromViewController.view is HomeView{
                fromViewController.view.transform = CGAffineTransformMakeTranslation(0, offsetScreenTop)
                toViewController.view.frame = finalFrame
            }
            
            
            // From view1 to home
            if fromViewController.view is ViewNumberOne && toViewController.view is HomeView{
                fromViewController.view.transform = CGAffineTransformMakeTranslation(0, offsetScreenBottom)
                toViewController.view.frame = finalFrame
            }
            
            // From view1  to view2
            if fromViewController.view is ViewNumberOne && toViewController.view is ViewNumberTwo{
                fromViewController.view.transform = CGAffineTransformMakeTranslation(offsetScreenLeft, 0)
                toViewController.view.frame = finalFrame
            }
            
            
            // From view2 to home
            if fromViewController.view is ViewNumberTwo && toViewController.view is HomeView{
                fromViewController.view.transform = CGAffineTransformMakeTranslation(0, offsetScreenBottom)
                toViewController.view.frame = finalFrame
            }
            
            // From view2 to view1
            if fromViewController.view is ViewNumberTwo && toViewController.view is ViewNumberOne{
                fromViewController.view.transform = CGAffineTransformMakeTranslation(offsetScreenRight, 0)
                toViewController.view.frame = finalFrame
            }
            
            // From view2 to view3
            if fromViewController.view is ViewNumberTwo && toViewController.view is ViewNumberThree{
                fromViewController.view.transform = CGAffineTransformMakeTranslation(offsetScreenLeft, 0)
                toViewController.view.frame = finalFrame
            }
            
            
            // From view3 to home
            if fromViewController.view is ViewNumberThree && toViewController.view is HomeView{
                fromViewController.view.transform = CGAffineTransformMakeTranslation(0, offsetScreenBottom)
                toViewController.view.frame = finalFrame
            }
            
            // From view3  to view2
            if fromViewController.view is ViewNumberThree && toViewController.view is ViewNumberTwo{
                fromViewController.view.transform = CGAffineTransformMakeTranslation(offsetScreenRight, 0)
                toViewController.view.frame = finalFrame
            }
            
            
            }) { (finished) -> Void in
                
                transitionContext.completeTransition(finished)
                
        }
        
        
        
        
        
    }

}
