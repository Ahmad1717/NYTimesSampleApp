//
//  ServiceWrapper.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation

class ServiceWrapper {
    
    private (set) var serviceModule: ServiceModule
    
//    var cachePolicy: URLRequest.CachePolicy {
//        return URLRequest.CachePolicy.useProtocolCachePolicy
//    }
    
    init(module: ServiceModule) {
        serviceModule = module
    }
}

extension ServiceWrapper {
    
    var defaultParameters: Parameters? { ["api-key": "AfM2bls4Ivj4ocNtPrijutXDH4n4BqNL"] }
    
    var parameters: Parameters? {
        serviceModule.parameters
    }
    
    var method: RequestMethod {
        serviceModule.method
    }
    
    var url: URL? {
        serviceModule.url(baseUrl: Configuration.current.baseUrl)
    }
    
    var contentType: ContentType { serviceModule.contentType }
}
