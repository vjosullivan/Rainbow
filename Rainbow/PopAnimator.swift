//
//  PopAnimator.swift
//  Rainbow
//
//  Created by Vincent O'Sullivan on 24/04/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    let duration: TimeInterval
    var presenting = true
    var originFrame = CGRect.zero

    convenience override init() {
        self.init(duration: 1.0)
    }

    init(duration: TimeInterval) {
        self.duration = duration
        super.init()
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        print("Interval")
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print("Transitioning")
        guard let newView = transitionContext.view(forKey: .to) else {
            print("Destination view missing.")
            return
        }
        let containerView = transitionContext.containerView
        containerView.addSubview(newView)
        newView.alpha = 0.0
        UIView.animate(withDuration: duration, animations: {
            newView.alpha = 1.0
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
}
