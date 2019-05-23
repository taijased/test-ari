//
//  UIButton + Custom.swift
//  ARI
//
//  Created by Maxim Spiridonov on 17/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit


// MARK: extension default setting for button
extension UIButton {
    static func getCustomtButton(imageName: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: imageName), for: .normal)
        button.backgroundColor = UIColor(hexValue: "#EE8C75", alpha: 1)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowRadius = 1.0
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = false
        return button
    }
}


// MARK: extension for animation button


extension UIButton {
    
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: "pulse")
    }
    
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.2
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        
        layer.add(flash, forKey: nil)
    }
    
    
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}


//
//extension NSAttributedString {
//    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
//        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
//        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
//        
//        return ceil(boundingBox.height)
//    }
//    
//    func width(withConstrainedHeight height: CGFloat) -> CGFloat {
//        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
//        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
//        
//        return ceil(boundingBox.width)
//    }
//}
//
//extension UIFont {
//    func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
//        return NSString(string: string).boundingRectWithSize(CGSize(width: width, height: DBL_MAX),
//                                                             options: NSStringDrawingOptions.UsesLineFragmentOrigin,
//                                                             attributes: [NSFontAttributeName: self],
//                                                             context: nil).size
//    }
//}


extension UILabel {
    static func getLabelSize(text: String, fontSize: CGFloat, fontName: String) -> CGSize {
        let label = UILabel()
        label.font = UIFont(name: fontName, size: fontSize)
        label.text = text

        return label.intrinsicContentSize
    }
}
