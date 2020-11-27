//
//  ServiceModule.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]

public enum ContentType {
    case jsonEncoded
    case urlEncoded
}

protocol ServiceModule {
    var method: RequestMethod { get }
    var parameters: Parameters? { get }
    var module: Module? { get }
    var path: Path? { get }
    var contentType: ContentType { get }
    func url(baseUrl: URL?) -> URL?
}

extension ServiceModule {

    func url(baseUrl: URL?) -> URL? {

        var url = baseUrl

        if let module = module {
            url?.appendPathComponent("/\(module.rawValue)")
        }

        if let path = path {
            url?.appendPathComponent("/\(path.rawValue)")
        }

        return url
    }
}

extension ServiceModule {
    var method: RequestMethod { .get }
    var parameters: Parameters? { nil }
    var module: Module? { nil }
    var path: Path? { nil }
    var contentType: ContentType { .urlEncoded }
}

enum RequestMethod: String {
    case get = "GET"
}

enum Module: String {
    case viewed
}

enum Path: String {
    case period = "1.json"
}
