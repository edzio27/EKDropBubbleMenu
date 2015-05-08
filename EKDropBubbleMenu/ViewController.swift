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
        menu.createMenu(self, position: CGPointMake(20, 510), menuDirection: .Up)
        var button1 = EKButton()
        var button2 = EKButton()
        var button3 = EKButton()
        button1.onButtonPressed = { () in
            var alertView = UIAlertView(title: "Button 1 clicked", message: "", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            menu.hideButtons()
        }
        menu.addButton(button1)
        button2.onButtonPressed = { () in
            var alertView = UIAlertView(title: "Button 2 clicked", message: "", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            menu.hideButtons()
        }
        menu.addButton(button2)
        button3.onButtonPressed = { () in
            var alertView = UIAlertView(title: "Button 3 clicked", message: "", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            menu.hideButtons()
        }
        menu.addButton(button3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

