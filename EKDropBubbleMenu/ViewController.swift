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
        menu.createMenu(self, position: CGPointMake(200, 200), arrowPosition: .Up)
        menu.addButton(UIButton())
        menu.addButton(UIButton())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

