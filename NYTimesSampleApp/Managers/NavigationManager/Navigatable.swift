//
//  Navigatable.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

protocol Navigatable {}

extension UIViewController: Navigatable {}

extension Navigatable where Self: UIViewController {

    typealias UpdateHandler = (Self) -> Void

    func push(navigationController: UINavigationController? = nil, shouldPreventMultiplePushing: Bool = true, customTransition: CATransitionType? = nil, updateHandler: UpdateHandler? = nil) {

        // abort if we dont have a navigation controller
        guard let currentNavigationController = navigationController ?? topController()?.navigationController else { return }

        // abort if we are inhibiting multiple pushes and if the top contoller is the controller we are trying to push
        guard !(shouldPreventMultiplePushing && type(of: topController() ?? UIViewController()) == type(of: self)) else { return }

        // update the controller to push
        updateHandler?(self)

        // push
        currentNavigationController.pushViewController(self, animated: true)
    }
}
