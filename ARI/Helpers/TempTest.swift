//
//  TempTest.swift
//  ARI
//
//  Created by Maxim Spiridonov on 21/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//
import  UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
