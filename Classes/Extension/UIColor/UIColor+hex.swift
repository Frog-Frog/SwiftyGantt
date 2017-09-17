//
//  UIColor+hex.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/17.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

extension UIColor {
    class func hex (string : String, alpha : CGFloat) -> UIColor {
        let hex = string.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hex)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            return UIColor.white
        }
    }
}
