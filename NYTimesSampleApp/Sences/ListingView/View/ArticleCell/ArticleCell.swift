//
//  ArticleCell.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

protocol ArticleCellPresentable {
    func configure(with item: Article)
}

class ArticleCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var bylineLabel: UILabel?
    @IBOutlet private weak var publishedDateLabel: UILabel?
}

extension ArticleCell: ArticleCellPresentable {
    func configure(with item: Article) {
        titleLabel?.text = item.title ?? ""
        bylineLabel?.text = item.byline ?? ""
        publishedDateLabel?.text = item.publishedDate ?? ""
    }
}