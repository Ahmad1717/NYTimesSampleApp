//
//  ServiceManagerStub.swift
//  NYTimesSampleAppTests
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation
@testable import NYTimesSampleApp

class ServiceManagerStub: ServiceProtocol {

    var resultShouldBeReturn: MostViewedResponse?

    func request<T: Decodable>(wrapper: ServiceWrapper, completion: @escaping GenericClosure<Result<T>>) {
        guard let resultShouldBeReturn = resultShouldBeReturn as? T else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error"])
            completion(.failure(error))
            return
        }

        completion(.success(resultShouldBeReturn))
    }
}
