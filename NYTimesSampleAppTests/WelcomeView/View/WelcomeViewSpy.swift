//
//  WelcomeViewSpy.swift
//  NYTimesSampleAppTests
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation
@testable import NYTimesSampleApp

class WelcomViewSpy: WelcomePresentable {

    var showLoadingCallCount = 0
    var hideLoadingCallCount = 0
    var showListingCallCount = 0
    var showErrorCallCount = 0

    var passedDataSource: [Article]?

    func showLoadingIndicator() {
        showLoadingCallCount += 1
    }

    func hideLoadingIndicator() {
        hideLoadingCallCount += 1
    }

    func showListingController(dataSource: [Article]) {
        showListingCallCount += 1
        passedDataSource = dataSource
    }

    func showAlert(error: Error) {
        showErrorCallCount += 1
    }
}
