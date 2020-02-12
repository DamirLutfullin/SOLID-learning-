//
//  NetworkManager.swift
//  SOLID(learning)
//
//  Created by Дамир Лутфуллин on 11.02.2020.
//  Copyright © 2020 Damir Lutfullin. All rights reserved.
//

import Foundation

protocol Networking {
    func request(urlString: String, clouser: @escaping (Data?, Error?) -> ())
}

class NetworkManager: Networking {
    
    func request(urlString: String, clouser: @escaping (Data?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let session = createDataTask(request: request, completion: clouser)
        session.resume()
    }

    internal func createDataTask(request: URLRequest, completion: @escaping (Data?, Error?) -> ()) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
