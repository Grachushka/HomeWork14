//
//  NetworkManager.swift
//  HomeWork14
//
//  Created by Pavel Procenko on 27/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import Foundation

class NetworkManager {
    enum NetworkError: Error {
        case error(Error)
        case cannotConvertDataToText
        case unknown
    }
    
    private let baseURL = URL(string: "https://cv.wikipedia.org")!
    static let shared = NetworkManager()
    
    private let session: URLSession
    
    private init() {
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    func requestToDos(completion: @escaping (Result<String, NetworkError>) -> Void) {
        let request = URLRequest(url: baseURL.appendingPathComponent("/wiki/Apple_Inc"))
        let task = self.session.dataTask(with: request) { data, response, error in

        DispatchQueue.main.async {
            
                guard let data = data else {
                    
                    if let error = error {
                        completion(.failure(.error(error)))
                    } else {
                        completion(.failure(.unknown))
                    }
                    return
                }
                
                guard let text = String(data: data, encoding: .utf8) else {
                    completion(.failure(.cannotConvertDataToText))
                    return
                }
                
                completion(.success(text))
            }
        }
        task.resume()

    }
}
