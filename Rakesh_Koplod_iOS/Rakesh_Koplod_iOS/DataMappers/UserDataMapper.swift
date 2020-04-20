//
//  UserDataMapper.swift
//  Rakesh_Koplod_iOS
//
//  Created by Rakesh on 20/04/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import UIKit

class UserDataMapper: NSObject {
    
    func mapUsersData(users:[User]) -> [UserViewModel] {
        var userViewModels = [UserViewModel]()
        for user in users{
            let userViewModel:UserViewModel = UserViewModel(user: user)
            userViewModels.append(userViewModel)
        }
        return userViewModels
    }

}
