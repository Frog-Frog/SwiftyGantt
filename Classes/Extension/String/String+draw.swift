//
//  String+draw.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/18.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

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
