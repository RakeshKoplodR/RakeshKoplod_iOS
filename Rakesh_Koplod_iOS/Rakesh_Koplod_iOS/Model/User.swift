//
//  User.swift
//  Rakesh_Koplod_iOS
//
//  Created by Rakesh on 20/04/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import UIKit
import Foundation

class User: Decodable, Identifiable {
     
    var login:String = ""
    var avatar_url:String = ""
    var type:String = ""
    var url:String = ""
    
    init() {
        
    }
}

