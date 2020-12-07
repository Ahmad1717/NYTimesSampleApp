//
//  XCTestExtensions.swift
//  NYTimesSampleAppTests
//
//  Created by Ahmad Jabri on 07/12/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import XCTest
@testable import NYTimesSampleApp

extension XCTestCase {

    func makeViewControllerSut<T: UIViewController>(viewController: T) -> T {
        let controller = viewController
        AppDelegate.shared?.rootViewController = controller
        return controller
    }

}
