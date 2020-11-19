//
//  ArticleCellSpy.swift
//  NYTimesSampleAppTests
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation
@testable import NYTimesSampleApp

class ArticleCellSpy: ArticleCellPresentable {
    var configreCallCount = 0
    
    func configure(with item: Article) {
        configreCallCount += 1
    }
}
