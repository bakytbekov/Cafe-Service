//
//  Animations.swift
//  F
//
//  Created by ZYFAR on 13.07.17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit

class Animations: UIViewController {

    func incorrectPasswordAnimation(label: UILabel) {
        UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            label.center.x += 10
        }, completion: nil)
        
        UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            label.center.x -= 20
        }, completion: nil)
        
        UIView.animate(withDuration: 0.1, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            label.center.x += 10
        }, completion: nil)
    }
}
