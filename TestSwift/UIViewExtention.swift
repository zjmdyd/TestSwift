//
//  UIViewExtention.swift
//  TestSwift
//
//  Created by ZJ on 14/09/2017.
//  Copyright © 2017 HY. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var x: CGFloat {
        get{
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    var y: CGFloat {
        get{
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var width: CGFloat {
        get{
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var height: CGFloat {
        get{
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var size: CGSize {
        get{
            return self.frame.size
        }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    //MARK:
    var top: CGFloat {
        get{
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var bottom: CGFloat {
        get{
            return self.frame.origin.y + self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.frame.size.height
            self.frame = frame
        }
    }
    
    var left: CGFloat {
        get{
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    var right: CGFloat {
        get{
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.frame.size.width
            self.frame = frame
        }
    }
}

extension UIColor {
    var maskViewColor: UIColor {
        get{
            let value: Float = 40 / 255.0
            return UIColor.init(colorLiteralRed: value, green: value, blue: value, alpha: 1.0)
        }
    }
}

import CoreGraphics

extension UIImage {
    class func createImage(color: UIColor, frame: CGRect) -> UIImage {
        UIGraphicsBeginImageContext(frame.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
