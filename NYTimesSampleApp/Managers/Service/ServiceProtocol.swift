//
//  ServiceProtocol.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation


protocol ServiceProtocol {
    func request<T: Decodable>(wrapper: ServiceWrapper, shouldInvokeErrorForcefully: Bool, completion: @escaping GenericClosure<Result<T>>)
    func clearAllSessions()
}

extension ServiceProtocol {
    func request<T: Decodable>(wrapper: ServiceWrapper, shouldCompleteForcefully: Bool = false, headerClosure: HeaderClosure? = nil, completion: @escaping GenericClosure<Result<T>>) {
        request(wrapper: wrapper, shouldInvokeErrorForcefully: shouldCompleteForcefully, completion: completion, headerClosure: headerClosure)
    }
}
