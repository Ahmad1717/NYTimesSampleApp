//
//  ServiceProtocol.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation


protocol ServiceProtocol {
    func request<T: Decodable>(wrapper: ServiceWrapper, completion: @escaping GenericClosure<Result<T>>)
}

extension ServiceProtocol {
    func request<T: Decodable>(wrapper: ServiceWrapper, completion: @escaping GenericClosure<Result<T>>) {
        request(wrapper: wrapper, completion: completion)
    }
}
