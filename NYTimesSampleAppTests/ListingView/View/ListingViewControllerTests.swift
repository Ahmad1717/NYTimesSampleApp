//
//  ListingViewControllerTests.swift
//  NYTimesSampleAppTests
//
//  Created by Ahmad Jabri on 07/12/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import XCTest
@testable import NYTimesSampleApp

class ListingViewControllerTests: XCTestCase {

    var sut: ListingViewController?

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

    func testConfigureView() {
        if let sut = sut {
            sut.configureView()
            XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
            XCTAssertTrue(sut.title == &&"Common.NYTimes.Title")
            XCTAssertTrue(sut.presenter?.numberOfRows == 3)
        }
    }

    func testArticleCell() {
        let cell = sut?.tableView?.cellForRow(at: IndexPath(row: 0, section: 0)) as? ArticleCell
        XCTAssertTrue(cell?.titleLabel?.text == "titl1")
    }
}

private extension ListingViewControllerTests {
    func setSut() {
        let controller = Configurator.createListingController(dataSource: MostViewedResponse.result().results ?? [])
        sut = makeViewControllerSut(viewController: controller)
        _ = sut?.view
    }
}
