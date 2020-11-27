//
//  ListingViewSpy.swift
//  NYTimesSampleAppTests
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation
@testable import NYTimesSampleApp

class ListingViewSpy: ListingPresentable {
    var reloadDataCount = 0

    func reloadData() {
        reloadDataCount += 1
    }
}
