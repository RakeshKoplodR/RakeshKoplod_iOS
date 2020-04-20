//
//  UserView.swift
//  Rakesh_Koplod_iOS
//
//  Created by Rakesh on 20/04/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import UIKit
import SwiftUI
import Foundation
import URLImage

struct UserView: View {
    var userViewModel:UserViewModel
    
   var body: some View {
       HStack {
        //Create imageview and load the image from the URL
        URLImage(URL(string:  "\(userViewModel.userImageUrl)")!, delay: 0.25) { proxy in
               proxy.image.resizable()
                   .frame(width: 90, height: 90)
           }
           //Use vertical stack to show user details like User name, User type, User profile URL
           VStack {
               HStack {
                   Text("User Name : ").foregroundColor(.gray)
                Text(userViewModel.userName).foregroundColor(.black)
                   Spacer()
               }
               HStack {
                Text("User Type : ").foregroundColor(.gray)
                Text(userViewModel.userType).foregroundColor(.black)
                   Spacer()
               }
            HStack {
             Text("User URL : ").foregroundColor(.gray)
                Text(userViewModel.userProfileUrl).foregroundColor(.blue)
                Spacer()
            }
           }
       }
   }
}
