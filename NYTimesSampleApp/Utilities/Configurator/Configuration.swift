//
//  Configuration.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Foundation

final class Configuration {

    static let current = Configuration()

    var all = Parameters()

    private var environment: Environment {

        guard let environment = Environment.attributes.decode(Environment.self) else {
            fatalError("ADD Environment TO YOUR CONFIGURATION FILE!!!")
        }
        return environment
    }

    private init() {
        all = Bundle.main.infoDictionary?["Configuration"] as? Parameters ?? [:]
    }
}

extension Configuration {
    var baseUrl: URL? {
        return createBaseURL()
    }
}

private extension Configuration {

    func createBaseURL() -> URL? {

        guard let host = Configuration.current.environment.host, let `protocol` = Configuration.current.environment.`protocol`, let apiVersion = Configuration.current.environment.apiVersion, let deployment = Configuration.current.environment.deployment, let module = Configuration.current.environment.module   else {
            fatalError("ADD HOST, PROTOCOL, API VERSION, DEPLOYMENT AND MODULE TO YOUR CONFIGURATION FILE!!!")
        }

        var urlComponents = URLComponents()
        urlComponents.scheme = `protocol`
        urlComponents.host = host

        if let portString = Configuration.current.environment.port, let port = Int(portString) {
            urlComponents.port = port
        }

        // add deployment and api version
        var url = urlComponents.url

        // add deployment
        url = url?.appendingPathComponent(deployment)

        // add module
        url = url?.appendingPathComponent(module)

        // add api version
        url = url?.appendingPathComponent(apiVersion)

        return url
    }
}

private extension Configuration {

    struct Environment: Decodable {

        var `protocol`: String?
        var host: String?
        var port: String?
        var scheme: String?
        var apiVersion: String?
        var deployment: String?
        var module: String?

        static var attributes: Parameters {
            return Configuration.current.all["Environment"] as? Parameters ?? [:]
        }

        private enum CodingKeys: String, CodingKey {
            case `protocol` = "Protocol"
            case host = "Host"
            case port = "Port"
            case scheme = "Scheme"
            case apiVersion = "ApiVersion"
            case deployment = "Deployment"
            case module = "Module"
        }
    }
}
