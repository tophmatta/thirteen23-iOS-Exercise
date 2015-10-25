//
//  SlideAnimator.swift
//  thirteen23 iOS Exercise
//
//  Created by Toph Matta on 10/22/15.
//  Copyright © 2015 Toph Matta. All rights reserved.
//

import UIKit

class SlideAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 1.0
    var presenting = true
    var originFrame = CGRect.zero
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView()!
        containerView.backgroundColor = UIColor.purpleColor()
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        let offScreenBottom = CGAffineTransformMakeTranslation(containerView.bounds.width/2, 2*containerView.bounds.height)
        
        let offScreenTop = CGAffineTransformMakeTranslation(containerView.bounds.width/2, -2*containerView.bounds.height)
        
        let offScreenLeft = CGAffineTransformMakeTranslation(-containerView.bounds.width*2, containerView.bounds.height/2)
        
        let offScreenRight = CGAffineTransformMakeTranslation(containerView.bounds.width*2, containerView.bounds.height/2)
        
        let screenMidX = UIScreen.mainScreen().bounds.width/2
        let screenMidY = UIScreen.mainScreen().bounds.height/2
        
        
        
        if fromViewController.view is HomeView{
            toViewController.view.transform = offScreenBottom
        }
        
        containerView.addSubview(toViewController.view)        
        
    
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            
            
            
            toViewController.view.transform = CGAffineTransformMakeTranslation(screenMidX, screenMidY)
            
            if fromViewController.view is HomeView{
                fromViewController.view.transform = CGAffineTransformMakeTranslation(0, -containerView.bounds.height)
            }
            
            
            
            }) { (finished) -> Void in
                transitionContext.completeTransition(finished)
                
                print(finished)
        }
        
        
        
        
        
    }

}
