//
//  Creator.swift
//  NYTimesSampleAppTests
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation
@testable import NYTimesSampleApp

extension MostViewedResponse {
    
    
    static func result() -> MostViewedResponse {
        return MostViewedResponse(
            status: "", results: [Article(id: 1, title: "titl1", publishedDate: "date1", byline: "byline1"), Article(id: 2, title: "titl2", publishedDate: "date2", byline: "byline2"), Article(id: 3, title: "titl3", publishedDate: "date3", byline: "byline3")]
        
        )
    }
}
