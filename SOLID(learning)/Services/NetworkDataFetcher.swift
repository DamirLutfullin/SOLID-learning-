//
//  NetworkDataFetcher.swift
//  SOLID(learning)
//
//  Created by Дамир Лутфуллин on 12.02.2020.
//  Copyright © 2020 Damir Lutfullin. All rights reserved.
//

import Foundation

protocol DataFetcher {
    func generalFetch<T: Codable>(urlString: String, response: @escaping (T?)->())
    func decodeJSON<T: Codable> (type: T.Type, from data: Data?) -> T?
}

class NetworkDataFetcher: DataFetcher {
    
    var networking: Networking!
    
    func generalFetch<T: Codable>(urlString: String, response: @escaping (T?) -> () ) {
        networking.request (urlString: urlString) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: T.self, from: data)
            response(decoded)
        }
        
    }
    
    internal func decodeJSON<T: Codable> (type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let response = try decoder.decode(T.self, from: data)
            return response
        } catch let JSONError {
            print("Faled to decode JSON \(JSONError.localizedDescription)")
            return  nil
        }
    }
    
    
    init(networking: Networking = NetworkManager()) {
        self.networking = networking
    }
    
}
