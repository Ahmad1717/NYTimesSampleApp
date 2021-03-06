//
//  UIViewControllerExtensions.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

protocol Instantiatable {
    static func instantiate(from storyboardIdentifier: UIStoryboard.Storyboard) -> Self
}

extension UIViewController: Instantiatable { }

extension Instantiatable where Self: UIViewController {

    static func instantiate(from storyboardIdentifier: UIStoryboard.Storyboard = .main) -> Self {

        guard let viewController = UIStoryboard(storyboard: storyboardIdentifier).instantiateViewController(withIdentifier: identifier) as? Self else {
            return Self()
        }
        return viewController
    }
}
