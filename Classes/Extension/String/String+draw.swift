//
//  String+draw.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/18.
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

extension String {
    func draw(at: CGPoint, withAttributes: [String: Any]?) {
        let string = self as NSString
        string.draw(at: at, withAttributes: withAttributes)
    }
    
    
    func draw(in rect: CGRect, withAttributes: [String : Any]?) {
        let string: NSString = self as NSString
        string.draw(in: rect, withAttributes: withAttributes)
    }
}
