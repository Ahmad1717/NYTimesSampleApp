//
//  Configurator.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation


class Configurator {

    static func createListingController(dataSource:  [Article]) -> ListingViewController {
        let viewController = ListingViewController.instantiate()
        let presenter = ListingPresenter(view: viewController, dataSource: dataSource)
        viewController.presenter = presenter
        return viewController
    }
    
    static func createWelcomeController() -> WelcomeViewController {
        let viewController = WelcomeViewController.instantiate()
        let presenter = WelcomePresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
