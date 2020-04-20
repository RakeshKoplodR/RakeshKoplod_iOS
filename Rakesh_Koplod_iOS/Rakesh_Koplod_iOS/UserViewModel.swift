//
//  UserViewModel.swift
//  Rakesh_Koplod_iOS
//
//  Created by Rakesh on 20/04/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import UIKit

class UserViewModel: ObservableObject, Identifiable {

    @Published private(set) var isLoadingData = false
    @Published var movies = [User]()
    @Published var userViewModels = [UserViewModel]()
    private let api_url_base = "https://api.github.com/users"
    
    var userName:String = ""
    var userImageUrl:String = ""
    var userType:String = ""
    var userProfileUrl:String = ""
    
    init() {
        isLoadingData = true
        getUsersList()
    }
    
    init(user:User) {
        self.userName = user.login
        self.userType = user.type
        self.userImageUrl = user.avatar_url
        self.userProfileUrl = user.url
    }

    func getUsersList() {
        NetworkManager().loadDataNormal(url: api_url_base) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return
            }
            let movies = try! JSONDecoder().decode([User].self, from: data)
            DispatchQueue.main.async {
                self.userViewModels = UserDataMapper().mapUsersData(users: movies)
                self.isLoadingData = false
            }
        }
    }
}
