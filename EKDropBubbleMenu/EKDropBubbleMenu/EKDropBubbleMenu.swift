//
//  EKDropBubbleMenu.swift
//  EKDropBubbleMenu
//
//  Created by Edzio27 on 28.04.2015.
//  Copyright (c) 2015 tooploox.com. All rights reserved.
//

import Foundation
import UIKit

enum ArrowPosition: Int {
    case Up = 0
    case Down
    case Left
    case Right
}

class EKDropBubbleMenu: UIViewController {
    
    // MARK: - Constants
    
    private let buttonSize: CGFloat = 40.0
    private let buttonImagePadding: CGFloat = 12.0
    private let rotateAnimationDuration = 0.5
    
    private var menuButton = UIButton()
    private var itemButton1 = UIButton()
    private var itemButton2 = UIButton()
    private var itemButton3 = UIButton()
    private let menuButtonImageView = UIImageView(image: UIImage(named: "Arrow"))
    private var rotateCount = 1
    private var arrow: ArrowPosition?
    
    // MARK: - Publics
    
    func createMenu(viewController: UIViewController, position: CGPoint, arrowPosition: ArrowPosition) {
        arrow = arrowPosition
        customizeViews(position)
        view.addSubview(itemButton1)
        view.addSubview(itemButton2)
        view.addSubview(itemButton3)
        view.addSubview(menuButton)
        
        viewController.addChildViewController(self)
        viewController.view.addSubview(view)
        self.didMoveToParentViewController(viewController)
    }
    
    private func customizeViews(position: CGPoint) {
        customizeMainButton(position)
        customizeItemButton(position)
    }
    
    private func customizeMainButton(position: CGPoint) {
        menuButton.frame = CGRectMake(position.x, position.y, buttonSize, buttonSize)
        menuButton.layer.cornerRadius = buttonSize / 2
        menuButton.layer.shadowColor = UIColor.grayColor().CGColor
        menuButton.layer.shadowOffset = CGSizeMake(2, 2)
        menuButton.layer.shadowRadius = 2
        menuButton.layer.shadowOpacity = 0.5
        menuButton.backgroundColor = UIColor.orangeColor()
        menuButton.addTarget(self, action: "rotateArrowButton", forControlEvents: UIControlEvents.TouchUpInside)
        
        prepareImageForArrowPosition(arrow)
        menuButtonImageView.frame = CGRectMake(
            buttonImagePadding,
            buttonImagePadding,
            buttonSize - 2 * buttonImagePadding,
            buttonSize - 2 * buttonImagePadding
        )
        menuButton.addSubview(menuButtonImageView)
    }
    
    private func customizeItemButton(position: CGPoint) {
        itemButton1.frame = CGRectMake(position.x + buttonSize / 2, position.y + buttonSize / 2, 0, 0)
        itemButton1.layer.cornerRadius = buttonSize / 2
        itemButton1.layer.shadowColor = UIColor.grayColor().CGColor
        itemButton1.layer.shadowOffset = CGSizeMake(2, 2)
        itemButton1.layer.shadowRadius = 2
        itemButton1.layer.shadowOpacity = 0.5
        itemButton1.backgroundColor = UIColor.orangeColor()
        
        itemButton2.frame = CGRectMake(position.x + buttonSize / 2, position.y + buttonSize / 2, 0, 0)
        itemButton2.layer.cornerRadius = buttonSize / 2
        itemButton2.layer.shadowColor = UIColor.grayColor().CGColor
        itemButton2.layer.shadowOffset = CGSizeMake(2, 2)
        itemButton2.layer.shadowRadius = 2
        itemButton2.layer.shadowOpacity = 0.5
        itemButton2.backgroundColor = UIColor.orangeColor()
        
        itemButton3.frame = CGRectMake(position.x + buttonSize / 2, position.y + buttonSize / 2, 0, 0)
        itemButton3.layer.cornerRadius = buttonSize / 2
        itemButton3.layer.shadowColor = UIColor.grayColor().CGColor
        itemButton3.layer.shadowOffset = CGSizeMake(2, 2)
        itemButton3.layer.shadowRadius = 2
        itemButton3.layer.shadowOpacity = 0.5
        itemButton3.backgroundColor = UIColor.orangeColor()
    }

    
    private func prepareImageForArrowPosition(position: ArrowPosition?) {
        if let position = position {
            switch(position) {
            case .Up:
                menuButtonImageView.transform = CGAffineTransformMakeRotation((90.0 * CGFloat(M_PI)) / 180.0)
            case .Right:
                menuButtonImageView.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 180.0)
            case .Down:
                menuButtonImageView.transform = CGAffineTransformMakeRotation((270.0 * CGFloat(M_PI)) / 180.0)
            default:
                return
            }
        }
    }
    
    func rotateArrowButton() {
        transformItemButton()
        UIView.animateWithDuration(rotateAnimationDuration, animations: {
            self.menuButtonImageView.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(self.rotateCount) * CGFloat(M_PI)) / 180.0)
            self.rotateCount++
        })
    }
    
    func transformItemButton() {
        UIView.animateWithDuration(rotateAnimationDuration, delay: 0.0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            self.itemButton1.frame = CGRectMake(200, 150, self.buttonSize, self.buttonSize)
        }) { (success: Bool) -> Void in

        }
        
        UIView.animateWithDuration(rotateAnimationDuration, delay: 0.0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            self.itemButton2.frame = CGRectMake(200, 100, self.buttonSize, self.buttonSize)
            }) { (success: Bool) -> Void in
                
        }
        
        UIView.animateWithDuration(rotateAnimationDuration, delay: 0.0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            self.itemButton3.frame = CGRectMake(200, 50, self.buttonSize, self.buttonSize)
            }) { (success: Bool) -> Void in
                
        }
    }
}