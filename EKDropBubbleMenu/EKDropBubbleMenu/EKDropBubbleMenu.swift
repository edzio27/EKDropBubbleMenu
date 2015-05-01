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
    private let rotateAnimationDuration = 0.2
    private let spaceBetweenButtonsCenter = 50.0
    
    private var menuButton = UIButton()
    private var containerButton: [UIButton] = []
    private let menuButtonImageView = UIImageView(image: UIImage(named: "Arrow"))
    private var rotateCount = 1
    private var arrow: ArrowPosition?
    
    // MARK: - Publics
    
    func createMenu(viewController: UIViewController, position: CGPoint, arrowPosition: ArrowPosition) {
        arrow = arrowPosition
        customizeViews(position)
        view.addSubview(menuButton)
        viewController.addChildViewController(self)
        viewController.view.addSubview(view)
        didMoveToParentViewController(viewController)
    }
    
    func addButton(button: UIButton) {
        containerButton.append(button)
        view.addSubview(button)
    }
    
    // MARK: - Privates
    
    private func customizeViews(position: CGPoint) {
        customizeMainButton(position)
        customizeButtonsInContainer(position)
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
    
    private func customizeButtonsInContainer(position: CGPoint) {
        for button in containerButton {
            button.frame = CGRectMake(position.x + buttonSize / 2, position.y + buttonSize / 2, 0, 0)
            button.layer.cornerRadius = buttonSize / 2
            button.layer.shadowColor = UIColor.grayColor().CGColor
            button.layer.shadowOffset = CGSizeMake(2, 2)
            button.layer.shadowRadius = 2
            button.layer.shadowOpacity = 0.5
            button.backgroundColor = UIColor.orangeColor()
        }
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
        for i in 0..<containerButton.count {
            UIView.animateWithDuration(rotateAnimationDuration, delay: 0.0, options: UIViewAnimationOptions.TransitionNone, animations: { () in
                self.containerButton[i].frame = CGRectMake(200, 100, self.buttonSize, self.buttonSize)
                }) { _ in
                    
            }
        }
    }
}