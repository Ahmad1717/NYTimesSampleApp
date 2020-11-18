//
//  UIResponderExtensions.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

protocol Identifiable {
    static var identifier: String { get }
}

extension UIResponder: Identifiable {
    
    static var identifier: String {
        return "\(self)"
    }
}
