//
//  WelcomViewControllerTests.swift
//  NYTimesSampleAppTests
//
//  Created by Ahmad Jabri on 07/12/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import XCTest
@testable import NYTimesSampleApp

class WelcomeViewControllerTests: XCTestCase {

    var sut: WelcomeViewController?

    override func setUp() {
        super.setUp()

        setSut()
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
    }

    func test_can_load_view() {
        XCTAssertNotNil(sut, "view can load without crash")
    }

    func testSidTapGetStarted() {
        sut?.didTapGetStarted()
    }
}

private extension WelcomeViewControllerTests {
    func setSut() {
        let controller = Configurator.createWelcomeController()
        sut = makeViewControllerSut(viewController: controller)
        _ = sut?.view
    }
}
