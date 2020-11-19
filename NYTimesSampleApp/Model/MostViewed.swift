//
//  MostViewedResponse.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation

struct MostViewedResponse: Decodable {
    let status: String?
    let results: [Article]?
    
    private enum CodingKeys: String, CodingKey {
        case status
        case results
    }
}

enum MostViewedModule: ServiceModule {
    
    case fetchMostViewed
    
    var method: RequestMethod {
        switch self {
        case .fetchMostViewed: return .get
        }
    }
    
    var module: Module? {
        switch self {
        case .fetchMostViewed: return .viewed
        }
    }
    
    var path: Path? {
        switch self {
        case .fetchMostViewed: return .period
        }
    }
    
    var parameters: Parameters? { nil }
    
    //apikey added to the defaults parameters
}
