//
//  WelcomePresnterTests.swift
//  NYTimesSampleAppTests
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import XCTest
@testable import NYTimesSampleApp

class WelcomePresnterTests: XCTestCase {

    var viewSpy: WelcomViewSpy!
    var presenter: WelcomePresenterInput!
    var stub: ServiceManagerStub!

    override func setUpWithError() throws {
        viewSpy = WelcomViewSpy()
        stub = ServiceManagerStub()
        presenter = WelcomePresenter(view: viewSpy, interactor: stub)
    }

    override func tearDownWithError() throws {
        viewSpy = nil
        presenter = nil
    }

    func testFetchDataSuccess() {
        //Given
        stub.resultShouldBeReturn = MostViewedResponse.result()

        //When
        presenter.fetchData()

        //Then
        XCTAssertEqual(viewSpy.showListingCallCount, 1)
        XCTAssertEqual(viewSpy.hideLoadingCallCount, 1)
        XCTAssertEqual(viewSpy.showListingCallCount, 1)
        XCTAssertEqual(viewSpy.passedDataSource?.count, 3)
    }
}
