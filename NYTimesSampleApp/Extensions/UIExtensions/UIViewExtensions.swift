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
}

extension UIView {

    // get nib from bundle
    class var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }

    // get nib name
    class var nibName: String {
        return identifier
    }
}
