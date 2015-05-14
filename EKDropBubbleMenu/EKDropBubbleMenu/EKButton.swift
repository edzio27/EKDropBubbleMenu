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

    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: "buttonPressed", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func buttonPressed() {
        onButtonPressed?()
    }
    
}