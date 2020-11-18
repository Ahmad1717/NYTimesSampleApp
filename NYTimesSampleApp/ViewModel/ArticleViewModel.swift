//
//  ArticleViewModel.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation

struct ArticleViewModel {
    
    let title: String
    let date: String
    let subtitle: String
    
    init(article: Article) {
        self.title = article.title
        self.date = article.publishedDate
        self.subtitle = article.byline
    }
}
