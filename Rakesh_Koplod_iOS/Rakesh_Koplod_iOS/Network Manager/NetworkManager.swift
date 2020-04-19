//
//  NetworkManager.swift
//  Rakesh_Koplod_iOS
//
//  Created by Rakesh on 19/04/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {

    func getDataFromURL(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: Cannot create URL from string")
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard error == nil else {
                print("Error calling api")
                return completion(nil, error)
            }
            guard let responseData = data else {
                print("Data is nil")
                return completion(nil, error)
            }
            
            let datastring = String(data: responseData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            print("Request URL ==> \(urlString)")
            print("Response from server ==> \(datastring!)")
            completion(responseData, nil)
        }
        task.resume()
    }
    
}
