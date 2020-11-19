//
//  WelcomePresenter.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation

protocol WelcomePresenterInput {
    
    var title: String { get }
    func fetchData()
}

protocol WelcomePresentable: AnyObject {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func ShowListingController(dataSource: [Article])
}

final class WelcomePresenter: WelcomePresenterInput {
    
    private weak var view: WelcomePresentable?

    var title: String { "Welcome" }
    
    init(view: WelcomePresentable)  {
        self.view = view
    }
    
    func fetchData() {
        
        view?.showLoadingIndicator()
        
        // fetch data
        ServiceManager.shared.request(wrapper: ServiceWrapper(module: MostViewedModule.fetchMostViewed)) { [weak self] (result: Result<MostViewedResponse>) in
            guard let weakSelf = self else { return }
            
            weakSelf.view?.hideLoadingIndicator()
            
            switch result {
            case .success(let response): weakSelf.view?.ShowListingController(dataSource: response.results ?? [Article]())
            case .failure(let error): print(error)
            }
        }
    }
}
