//
//  ContentView.swift
//  Rakesh_Koplod_iOS
//
//  Created by Rakesh on 19/04/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import SwiftUI
import Foundation


struct ContentView: View {
    
    @ObservedObject var networkManager = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if networkManager.isLoadingData {
                    Text(Constants.LOADING)
               } else {
                    List(networkManager.userViewModels) { userViewModel in
                        UserView(userViewModel: userViewModel)
                    }
                }
            }
            .navigationBarTitle(Text("Git Users list"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

