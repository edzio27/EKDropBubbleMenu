//
//  ViewController.swift
//  EKDropBubbleMenu
//
//  Created by Edzio27 on 28.04.2015.
//  Copyright (c) 2015 tooploox.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var menu = EKDropBubbleMenu()
        menu.createMenu(self, position: CGPointMake(150, 150), menuDirection: .Down)
        
        var button1 = EKButton()
        var button2 = EKButton()
        button1.onButtonPressed = { () in
            // TODO: Button clicked
        }
        menu.addButton(button1)
        button2.onButtonPressed = { () in
            // TODO: Button clicked
        }
        menu.addButton(button2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

