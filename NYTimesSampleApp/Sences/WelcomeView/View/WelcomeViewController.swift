//
//  WelcomeViewController.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    var presenter: WelcomePresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    @IBAction private func buttonActionGetStarted(_ sender: UIButton) {
        
        // fetch data
        presenter?.fetchData()
    }
}
    
extension WelcomeViewController: WelcomePresentable {
    func showLoadingIndicator() {
        LoadingIndicator.shared.show()
    }
    
    func hideLoadingIndicator() {
        LoadingIndicator.shared.dismiss()
    }
    
    func ShowListingController(dataSource: [Article]) {
        Configurator.createListingController(dataSource: dataSource).push()
    }
}

private extension WelcomeViewController {
    func configureView() {
        title = presenter?.title
    }
}
