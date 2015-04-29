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

class EKDropBubbleMenu: UIView {
    
    // MARK: - Constants
    
    private let buttonSize: CGFloat = 50.0
    private let rotateAnimationDuration = 2.0
    
    private var menuButton = UIButton()
    
    // MARK: - Publics
    
    func createMenu(viewController: UIViewController, position: CGPoint) {
        customizeViews(position)
        self.addSubview(menuButton)
        viewController.view.addSubview(self)
    }
    
    private func customizeViews(position: CGPoint) {
        customizeMainButton(position)
    }
    
    private func customizeMainButton(position: CGPoint) {
        menuButton.frame = CGRectMake(position.x, position.y, buttonSize, buttonSize)
        menuButton.layer.cornerRadius = 25.0
        menuButton.layer.shadowColor = UIColor.grayColor().CGColor
        menuButton.layer.shadowOffset = CGSizeMake(2, 2)
        menuButton.layer.shadowRadius = 2
        menuButton.layer.shadowOpacity = 0.5
        menuButton.backgroundColor = UIColor.orangeColor()
        menuButton.setImage(UIImage(named: "Arrow"), forState: .Normal)
        menuButton.addTarget(self, action: "sfsfd", forControlEvents: UIControlEvents.TouchUpInside)
        menuButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        menuButton.userInteractionEnabled = true
    }
    
    func rotateArrowButton() {
        UIView.animateWithDuration(rotateAnimationDuration, animations: {
            self.menuButton.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 180.0)
        })
    }
}