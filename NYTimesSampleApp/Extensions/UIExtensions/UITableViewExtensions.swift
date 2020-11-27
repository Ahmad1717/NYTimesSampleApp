//
//  UITableViewExtensions.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

// Register cell functions
extension UITableView {
    func register<T: UITableViewCell>(_ : T.Type) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    func registerNib<T: UITableViewCell>(_ : T.Type) {
        register(T.nib, forCellReuseIdentifier: T.identifier)
    }
}
