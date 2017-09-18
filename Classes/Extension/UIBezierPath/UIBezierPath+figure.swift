//
//  UIBezierPath+figure.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/18.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

extension UIBezierPath {
    convenience init(diamondIn: CGRect) {
        self.init()
        
        self.move(to: CGPoint(x: diamondIn.origin.x + diamondIn.size.width/2, y: diamondIn.origin.y))
        self.addLine(to: CGPoint(x: diamondIn.origin.x, y: diamondIn.origin.y + diamondIn.size.height/2))
        self.addLine(to: CGPoint(x: diamondIn.origin.x + diamondIn.size.width/2, y: diamondIn.origin.y + diamondIn.size.height))
        self.addLine(to: CGPoint(x: diamondIn.origin.x + diamondIn.size.width, y: diamondIn.origin.y + diamondIn.size.height/2))
        
        self.close()
    }
    
    convenience init(triangleIn: CGRect) {
        self.init()
        
        self.move(to: CGPoint(x: triangleIn.origin.x + triangleIn.size.width/2, y: triangleIn.origin.y))
        self.addLine(to: CGPoint(x: triangleIn.origin.x, y: triangleIn.origin.y + triangleIn.size.height))
        self.addLine(to: CGPoint(x: triangleIn.origin.x + triangleIn.size.width, y: triangleIn.origin.y + triangleIn.size.height))
        
        self.close()
    }
}
