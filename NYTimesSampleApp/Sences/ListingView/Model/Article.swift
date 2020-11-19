//
//  Article.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation

struct Article: Decodable {
    let id : Int?
    let title: String?
    let publishedDate: String?
    let byline: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case publishedDate = "published_date"
        case byline
    }
}
