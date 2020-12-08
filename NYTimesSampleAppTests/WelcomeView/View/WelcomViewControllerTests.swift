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

        _ = XCTWaiter.wait(for: [XCTestExpectation(description: "wait 3 sec")], timeout: 3)
        XCTAssertTrue(topController() is ListingViewController)
    }

    func testAlert() {
        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error"])
        sut?.showAlert(error: error)

        _ = XCTWaiter.wait(for: [XCTestExpectation(description: "wait 1 sec")], timeout: 1)
        XCTAssertTrue(topController() is UIAlertController)
    }

    func testNavigatableProtocol() {
        sut?.showListingController(dataSource: MostViewedResponse.result().results ?? [])
        _ = XCTWaiter.wait(for: [XCTestExpectation(description: "wait 4 sec")], timeout: 4)
        XCTAssertTrue(topController() is ListingViewController)
    }

}

private extension WelcomeViewControllerTests {
    func setSut() {
        let controller = Configurator.createWelcomeController()
        sut = makeViewControllerSut(viewController: controller)
        _ = sut?.view
    }
}
