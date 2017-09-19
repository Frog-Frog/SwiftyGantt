//
//  NSObject+stringFromClass.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/19.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//
//  https://github.com/PKPK-Carnage/SwiftyGantt

/**
 [SwiftyGantt]
 
 Copyright (c) [2017] [Tomosuke Okada]
 
 This software is released under the MIT License.
 http://opensource.org/licenses/mit-license.ph
 */

import Foundation

extension NSObject {
    class func stringFromClass() -> String {
        return String(describing: type(of: self))
    }
}
