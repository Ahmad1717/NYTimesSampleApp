//
//  ListingPresenter.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation

protocol ListingPresenterInput {

    var numberOfRows: Int { get }
    var title: String { get }
    func configre(cell: ArticleCellPresentable, at indexPath: IndexPath)
}

protocol ListingPresentable: AnyObject {}

final class ListingPresenter: ListingPresenterInput {

    private var articles = [Article]()
    private weak var view: ListingPresentable?

    var numberOfRows: Int { articles.count }
    var title: String { &&"Common.NYTimes.Title" }

    init(view: ListingPresentable, dataSource: [Article]) {
        self.view = view
        articles = dataSource

    }

    func configre(cell: ArticleCellPresentable, at indexPath: IndexPath) {
        cell.configure(with: articles[indexPath.row])
    }
}
