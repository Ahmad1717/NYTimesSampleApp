//
//  ListingPresenterTest.swift
//  NYTimesSampleAppTests
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import XCTest
@testable import NYTimesSampleApp

class ListingPresnterTests: XCTestCase {
    
    var viewSpy: ListingViewSpy!
    var presenter: ListingPresenterInput!
    var dataSource = MostViewedResponse.result().results ?? []
    
    override func setUpWithError() throws {
        viewSpy = ListingViewSpy()
        
        presenter = ListingPresenter(view: viewSpy, dataSource: dataSource)
    }
    
    override func tearDownWithError() throws {
        viewSpy = nil
        presenter = nil
    }
    
    func testNumberOfRowsSuccess() {
        
        XCTAssertEqual(presenter.numberOfRows, dataSource.count)
    }
    
    func testConfigureCellSuccess() {
        
        //Given
        let viewCellSpy = ArticleCellSpy()
        
        //When
        presenter.configre(cell: viewCellSpy, at: IndexPath(row: 0, section: 0))
        
        //Then
        XCTAssertEqual(viewCellSpy.configreCallCount, 1)
    }
}
