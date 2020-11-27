//
//  StringExtensions.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 27/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation

// localization
prefix operator &&

prefix func && (string: String) -> String {
    return NSLocalizedString(string, comment: "")
}
