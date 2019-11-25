//
//  Utils.swift
//  PlayBird
//
//  Created by Imran on 25/11/19.
//  Copyright © 2019 Im. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

#if !(arch(x86_64) || arch(arm64))
func atan2(y: CGFloat, x: CGFloat) -> CGFloat {
    return CGFloat(atan2f(Float(y), Float(x)))
}
func sqrt(a: CGFloat) -> CGFloat {
    return CGFloat(sqrtf(Float(a)))
}
#endif

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat (Float(arc4random()) / Float(UInt32.max))
    }
    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min < max)
        return CGFloat.random() * (max - min) + min
    }
    
    static func randomBetween(min: CGFloat, max: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(min - max) + min
    }
}


