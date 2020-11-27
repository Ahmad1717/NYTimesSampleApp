//
//  WelcomePresenter.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

protocol WelcomePresenterInput {

    var title: String { get }
    func fetchData()
}

protocol WelcomePresentable: AnyObject {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showListingController(dataSource: [Article])
    func showAlert(error: Error)
}

final class WelcomePresenter: WelcomePresenterInput {

    private weak var view: WelcomePresentable?
    private var interactor: ServiceProtocol?

    var title: String { &&"Common.Welcome" }

    init(view: WelcomePresentable, interactor: ServiceProtocol) {
        self.view = view
        self.interactor = interactor
    }

    func fetchData() {

        view?.showLoadingIndicator()

        // fetch data
        interactor?.request(wrapper: ServiceWrapper(module: MostViewedModule.fetchMostViewed)) { [weak self] (result: Result<MostViewedResponse>) in
            guard let weakSelf = self else { return }

            weakSelf.view?.hideLoadingIndicator()

            switch result {
            case .success(let response): weakSelf.view?.showListingController(dataSource: response.results ?? [Article]())
            case .failure(let error): weakSelf.view?.showAlert(error: error)
            }
        }
    }
}
