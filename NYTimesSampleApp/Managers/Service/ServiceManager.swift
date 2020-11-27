//
//  ServiceManager.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Alamofire

class ServiceManager {

    static let shared = ServiceManager()

    private lazy var manager: Alamofire.Session = {
        let configuration = URLSessionConfiguration.af.default
        let session = Session(configuration: configuration)
        return session
    }()

    private init() {
        // Restricting Service manager initialisation other than shared access.
    }

    func decode<T: Decodable>(request: URLRequest, completion: @escaping GenericClosure<Result<T>>) {

        manager.request(request).validate().responseDecodable { (response: AFDataResponse<T>) in

            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension ServiceManager: ServiceProtocol {

    func request<T: Decodable>(wrapper: ServiceWrapper, completion: @escaping GenericClosure<Result<T>>) {

        guard let request = wrapper.urlRequest else { return }
        decode(request: request, completion: completion)
    }
}

extension ServiceWrapper: URLRequestConvertible {

    var qualifiedUrl: URL {
        return url ?? URL(fileURLWithPath: url?.absoluteString ?? "")
    }

    func asURLRequest() throws -> URLRequest {

        var requestParams = parameters
        if let defaultParameters = defaultParameters {
            requestParams = defaultParameters.merging(parameters ?? [:]) { _, custom in custom }
        }

        let urlRequest = try URLRequest(url: qualifiedUrl, method: HTTPMethod(rawValue: method.rawValue))

        return try contentType == .jsonEncoded ? Alamofire.JSONEncoding.default.encode(urlRequest, with: requestParams) : Alamofire.URLEncoding.default.encode(urlRequest, with: requestParams)
    }
}
