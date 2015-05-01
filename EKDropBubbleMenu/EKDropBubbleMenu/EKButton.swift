//
//  EKButton.swift
//  EKDropBubbleMenu
//
//  Created by Edzio27 on 01.05.2015.
//  Copyright (c) 2015 tooploox.com. All rights reserved.
//

import Foundation
import UIKit

class EKButton: UIButton {
    
    var onButtonPressed: (() -> ())?
    
    override init() {
        super.init()
        addTarget(self, action: "buttonPressed", forControlEvents: UIControlEvents.TouchUpInside)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func buttonPressed() {
        onButtonPressed?()
    }
    
}