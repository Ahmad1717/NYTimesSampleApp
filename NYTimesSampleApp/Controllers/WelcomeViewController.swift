//
//  WelcomeViewController.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBAction func buttonActionGetStarted(_ sender: UIButton) {
        
        // fetch data
        fetchMostViewedArticles { articles in
            
            // push listing controller
            ListingViewController.push { controller in
                var articleViewModels = [ArticleViewModel]()
                
                articles.forEach { articleViewModels.append(ArticleViewModel(article: $0)) }
                
                controller.articleViewModels = articleViewModels
            }
        }
    }
}

private extension WelcomeViewController {
    func fetchMostViewedArticles(completion: @escaping GenericClosure<[Article]>) {
        
        // show loading indicator
        LoadingIndicator.shared.show()
        
        // fetch data
        ServiceManager.shared.request(wrapper: ServiceWrapper(module: MostViewedModule.fetchMostViewed)) {  (result: Result<MostViewedResponse>) in
            
            // hide loading indicator
            LoadingIndicator.shared.dismiss()
                        
            switch result {
            case .success(let response): completion(response.results)
            case .failure(let error): print(error)
            }
        }
    }
}
