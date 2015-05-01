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
    private let hideButtonsAnimationDuration = 0.2
    private let showButtonsAnimationDuration = 0.6
    private let spaceBetweenButtonsCenter: CGFloat = 50.0
    
    private var menuButton = UIButton()
    private var containerButton: [UIButton] = []
    private let menuButtonImageView = UIImageView(image: UIImage(named: "ArrowGray"))
    private var rotateCount = 0
    private var position: CGPoint!
    private var initialCorner: CGFloat!
    private var buttonsAreShown = false
    private var arrow: ArrowPosition?
    
    // MARK: - Publics
    
    func createMenu(viewController: UIViewController, position: CGPoint, arrowPosition: ArrowPosition) {
        self.position = position
        arrow = arrowPosition
        customizeMainButton(position)
        view.addSubview(menuButton)
        viewController.addChildViewController(self)
        viewController.view.addSubview(view)
        didMoveToParentViewController(viewController)
    }
    
    func addButton(button: UIButton) {
        customizeButton(button)
        containerButton.append(button)
        view.insertSubview(button, belowSubview: menuButton)
        button.hidden = true
    }
    
    func showButtons() {
        for i in 0..<containerButton.count {
            containerButton[i].hidden = false
            UIView.animateWithDuration(showButtonsAnimationDuration, delay: 0.0, usingSpringWithDamping: 50.0, initialSpringVelocity: 25.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.containerButton[i].frame = CGRectMake(self.position.x, (self.position.y + CGFloat(i + 1) * self.spaceBetweenButtonsCenter), self.buttonSize, self.buttonSize)
                }, completion: { (success: Bool) -> Void in
            })
        }
    }
    
    func hideButtons() {
        for i in 0..<containerButton.count {
            UIView.animateWithDuration(hideButtonsAnimationDuration, delay: 0.0, options: UIViewAnimationOptions.TransitionNone, animations: { () in
                self.containerButton[i].frame = CGRectMake(self.position.x, self.position.y, self.buttonSize, self.buttonSize)
                }) { _ in
                    self.containerButton[i].hidden = true
            }
        }
    }
    
    // MARK: - Privates
    
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
    
    private func customizeButton(button: UIButton) {
        button.frame = CGRectMake(position.x + buttonSize / 2, position.y + buttonSize / 2, 0, 0)
        button.layer.cornerRadius = buttonSize / 2
        button.layer.shadowColor = UIColor.grayColor().CGColor
        button.layer.shadowOffset = CGSizeMake(2, 2)
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 0.5
        button.backgroundColor = UIColor.orangeColor()
    }
    
    private func prepareImageForArrowPosition(position: ArrowPosition?) {
        if let position = position {
            switch(position) {
            case .Up:
                initialCorner = 90.0
            case .Right:
                initialCorner = 180.0
            case .Down:
                initialCorner = 270.0
            default:
                return
            }
            menuButtonImageView.transform = CGAffineTransformMakeRotation((initialCorner * CGFloat(M_PI)) / 180.0)
        }
    }
    
    func rotateArrowButton() {
        buttonsAreShown ? hideButtons() : showButtons()
        UIView.animateWithDuration(rotateAnimationDuration, animations: {
            self.menuButtonImageView.transform = CGAffineTransformMakeRotation((self.initialCorner + 180.0 * CGFloat(self.rotateCount) * CGFloat(M_PI)) / 180.0)
            self.rotateCount++
        })
        buttonsAreShown = !buttonsAreShown
    }
}