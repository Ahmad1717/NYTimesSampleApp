//
//  ServiceManager.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import Alamofire

class ServiceManager {
    
    //   typealias HeaderClosure = GenericClosure<[String: String]>
    
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
        
        manager.request(request).validate().responseDecodable { [weak self] (response: AFDataResponse<T>) in
            
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
    
    func request<T: Decodable>(wrapper: ServiceWrapper, shouldInvokeErrorForcefully: Bool = false, completion: @escaping GenericClosure<Result<T>>) {
        guard let request = wrapper.urlRequest else { return }
        decode(request: request, shouldCompleteForcefully: shouldInvokeErrorForcefully, completion: completion, headerClosure: headerClosure)
    }
    
    func clearAllSessions() {
        manager.session.getAllTasks {
            $0.forEach { $0.cancel() }
        }
    }
}


