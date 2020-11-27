//
//  Utils.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

typealias GenericClosure<T> = (T) -> Void

// find top most view controller
func topController() -> UIViewController? {

    // recursive follow
    func follow(_ from: UIViewController?) -> UIViewController? {
        if let to = (from as? UITabBarController)?.selectedViewController {
            return follow(to)
        } else if let to = (from as? UINavigationController)?.visibleViewController {
            return follow(to)
        } else if let to = from?.presentedViewController {
            return follow(to)
        } else {
            return from
        }
    }

    let root = UIApplication.shared.keyWindow?.rootViewController

    return follow(root)
}
