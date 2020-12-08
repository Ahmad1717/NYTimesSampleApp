//
//  ArticleCell.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

protocol ArticleCellPresentable {
    func configure(with item: Article?)
}

class ArticleCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var bylineLabel: UILabel?
    @IBOutlet weak var publishedDateLabel: UILabel?
}

extension ArticleCell: ArticleCellPresentable {
    func configure(with item: Article?) {
        guard let item = item else { return }
        titleLabel?.text = item.title
        bylineLabel?.text = item.byline
        publishedDateLabel?.text = item.publishedDate
    }
}
