//
//  UIViewExtensions.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0.0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            guard let borderCgColor = layer.borderColor else { return nil }
            return UIColor(cgColor: borderCgColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

extension UIView {

    // instantiate view from nib
    class func instantiateFromNib<T: UIView>() -> T? {
        return nib.instantiate(withOwner: nil, options: nil).first as? T
    }

    // get nib from bundle
    class var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }

    // get nib name
    class var nibName: String {
        return identifier
    }
}
