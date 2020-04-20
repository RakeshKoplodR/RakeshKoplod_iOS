//
//  NetworkManager.swift
//  Rakesh_Koplod_iOS
//
//  Created by Rakesh on 19/04/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import UIKit
import Foundation
import Combine

class NetworkManager: ObservableObject {

    func loadDataNormal(url : String , completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard let url = URL(string: "\(url)") else { return }
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else { return }
            completion(data, nil)
        }.resume()
    }
    
    
}
