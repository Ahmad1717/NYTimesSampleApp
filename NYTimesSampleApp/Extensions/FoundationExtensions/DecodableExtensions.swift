//
//  DecodableExtensions.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 27/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation

extension Decodable {

    static func decode<T: Decodable>(path: String, completion: @escaping (Result<T>) -> Void) {
        guard let path = Bundle.main.path(forResource: path, ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)

        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(T.self, from: data)

            completion(.success(response))

        } catch let error {
            completion(.failure(error))
        }
    }
}
