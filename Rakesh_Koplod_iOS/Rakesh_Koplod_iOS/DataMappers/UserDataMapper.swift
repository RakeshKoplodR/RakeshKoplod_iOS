//
//  UserDataMapper.swift
//  Rakesh_Koplod_iOS
//
//  Created by Rakesh on 20/04/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import UIKit

class UserDataMapper: NSObject {
    
    //This class will receive array of user models and will populate UserViewModel which will uopdate the UI
    func mapUsersData(users:[User]) -> [UserViewModel] {
        var userViewModels = [UserViewModel]()
        for user in users{
            //Get every user from array and create UserViewModel using dependency injection
            let userViewModel:UserViewModel = UserViewModel(user: user)
            userViewModels.append(userViewModel)
        }
        //Return UserViewModles array to the ViewModel
        return userViewModels
    }

}
