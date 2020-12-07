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
        didTapGetStarted()
    }
}

extension WelcomeViewController {
    func didTapGetStarted() {

        // fetch data
        presenter?.fetchData()
    }
}

extension WelcomeViewController: WelcomePresentable {
    func showAlert(error: Error) {
        Alert(title: &&"Common.Error", message: error.localizedDescription, preferredStyle: .alert).addAction(title: &&"Common.Ok", style: .default, handler: nil).build().show()
    }

    func showLoadingIndicator() {
        LoadingIndicator.shared.show()
    }

    func hideLoadingIndicator() {
        LoadingIndicator.shared.dismiss()
    }

    func showListingController(dataSource: [Article]) {
        Configurator.createListingController(dataSource: dataSource).push()
    }
}

private extension WelcomeViewController {
    func configureView() {
        title = presenter?.title
    }
}
