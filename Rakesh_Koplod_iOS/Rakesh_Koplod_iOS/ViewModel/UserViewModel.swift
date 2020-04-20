//
//  UserViewModel.swift
//  Rakesh_Koplod_iOS
//
//  Created by Rakesh on 20/04/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import UIKit

class UserViewModel: ObservableObject, Identifiable {

    //Create publishers for variables
    @Published var isLoadingData = false
    @Published var userViewModels = [UserViewModel]()
    
    //Properties of the viewModel
    var userName:String = ""
    var userImageUrl:String = ""
    var userType:String = ""
    var userProfileUrl:String = ""
    
    //Default constructor which will initate the network call to egt all GIT users
    init() {
        isLoadingData = true
        getUsersList()
    }
    
    //Dependency inejction to create UserViewModel
    init(user:User) {
        self.userName = user.login
        self.userType = user.type
        self.userImageUrl = user.avatar_url
        self.userProfileUrl = user.url
    }

    //This will get all users from the server by making REST API call
    func getUsersList() {
        NetworkManager().loadDataNormal(url: Constants.GET_USERS_END_POINT) { (data, error) in
            //I have used closure here which will have the data received from server.
            //Check for data areceived from server. If it is null then return from here itself
            guard let data = data, error == nil else {
                print("Failed to get data")
                return
            }
            //Decode JSON data and create the User model list
            let movies = try! JSONDecoder().decode([User].self, from: data)
            //Use main thread to update UI from the ViewModel
            DispatchQueue.main.async {
                //Pass Users list to UserDataMapper class to map User objects to the UserViewModel
                self.userViewModels = UserDataMapper().mapUsersData(users: movies)
                self.isLoadingData = false
            }
        }
    }
}
