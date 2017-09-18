//
//  String+size.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/18.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

extension String {
    func size(attributes: [String : Any]?) -> CGSize {
        let string: NSString = self as NSString
        return string.size(attributes: attributes)
    }
}
