//
//  Result.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
