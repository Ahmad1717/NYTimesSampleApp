//
//  WelcomeViewController.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServiceManager.shared.request(wrapper: ServiceWrapper(module: MostViewedModule.fetchMostViewed)) { (result: Result<MostViewedResponse>) in
                        
            switch result {
            case .success(let response):
                print(response.results.first?.title)
            case .failure(let error):
                print(error)
            }
        }
    }
}

enum MostViewedModule: ServiceModule {
    
    case fetchMostViewed
    
    var method: RequestMethod {
        switch self {
        case .fetchMostViewed: return .get
        }
    }
    
    var module: Module? {
        switch self {
        case .fetchMostViewed: return .viewed
        }
    }
    
    var path: Path? {
        switch self {
        case .fetchMostViewed: return .period
        }
    }
    
    var parameters: Parameters? { nil }
}
