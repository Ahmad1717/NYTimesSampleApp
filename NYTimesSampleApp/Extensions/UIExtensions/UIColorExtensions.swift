//
//  UIColorExtensions.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

prefix operator **

// Restricted scope of ** operator to this file only.
prefix func ** (name: String) -> UIColor {
    return UIColor(named: name) ?? UIColor.white
}

// Background
extension UIColor {
    static let navigationColor = **"NavigationColor"
}
