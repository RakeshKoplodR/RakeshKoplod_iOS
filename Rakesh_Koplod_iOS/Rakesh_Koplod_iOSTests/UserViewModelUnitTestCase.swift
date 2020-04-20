//
//  UserViewModelUnitTestCase.swift
//  Rakesh_Koplod_iOSTests
//
//  Created by Rakesh on 20/04/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import XCTest

class UserViewModelUnitTestCase: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let userModel = UserViewModel()
        TestUtils().waitForException(timeout: 10)
        let userViewModels = getTestDataToBeVerified()
        print(userModel.userViewModels)
        XCTAssertNotEqual(userModel.userViewModels.count, 0)
        for i in stride(from: 0, to: userViewModels.count, by: 1){
            XCTAssertEqual(userModel.userViewModels[i].userName, userViewModels[i].userName)
            XCTAssertEqual(userModel.userViewModels[i].userType, userViewModels[i].userType)
            XCTAssertEqual(userModel.userViewModels[i].userProfileUrl, userViewModels[i].userProfileUrl)
        }
    }
    
    private func getTestDataToBeVerified() -> [UserViewModel]{
        var userViewModels = [UserViewModel]()
       for user in getUserModels(){
           //Get every user from array and create UserViewModel using dependency injection
           let userViewModel:UserViewModel = UserViewModel(user: user)
           userViewModels.append(userViewModel)
       }
        return userViewModels
    }
    
    private func getUserModels() -> [User]{
        var users = [User]()
        let user1:User = User()
        user1.login = "mojombo"
        user1.type = "User"
        user1.url = "https://api.github.com/users/mojombo"
        users.append(user1)
        
        let user2:User = User()
        user2.login = "defunkt"
        user2.type = "User"
        user2.url = "https://api.github.com/users/defunkt"
        users.append(user2)
        
        let user3:User = User()
        user3.login = "pjhyett"
        user3.type = "User"
        user3.url = "https://api.github.com/users/pjhyett"
        users.append(user3)
        
        return users
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
