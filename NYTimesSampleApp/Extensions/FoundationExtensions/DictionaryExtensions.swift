//
//  DictionaryExtensions.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation

extension Dictionary{
    func decode<T: Decodable>(_ type: T.Type) -> T? {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            return nil
        }
    }
}

extension Decodable {
    
    static func decode<T: Decodable>(path: String, completion: @escaping (Result<T>) -> Void) {
        guard let path = Bundle.main.path(forResource: path, ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            

            let loginResponse = try JSONDecoder().decode(T.self, from: data)

            completion(.success(loginResponse))
            
        } catch let error {
            completion(.failure(error))
        }
    }
}
