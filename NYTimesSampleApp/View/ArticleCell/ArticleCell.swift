//
//  ArticleCell.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    var articleViewModel: ArticleViewModel? {
        didSet {
            configreView()
        }
    }
    
    @IBOutlet private (set) weak var labelTitle: UILabel?
    @IBOutlet private (set) weak var labelSubtitle: UILabel?
    @IBOutlet private (set) weak var labelDate: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configreView()
    }
}

private extension ArticleCell {
    func configreView() {
        labelTitle?.text = articleViewModel?.title
        labelSubtitle?.text = articleViewModel?.subtitle
        labelDate?.text = articleViewModel?.date
    }
}
