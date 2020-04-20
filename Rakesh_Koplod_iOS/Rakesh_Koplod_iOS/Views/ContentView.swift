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
    
    //Created observable for UserViewModel which will be get notified once we get the response
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        //Add navigation view to the screen
        NavigationView {
            //User vertical stack to populate list
            VStack {
                //Show loading on the UI untill we get the data froms erver
                if userViewModel.isLoadingData {
                    Text(Constants.LOADING)
               } else {
                    //Update UI once we get data from UserViewModel
                    List(userViewModel.userViewModels) { userViewModel in
                        //Create Tableview Cell for every viewModel which we have received
                        UserView(userViewModel: userViewModel)
                    }
                }
            }
            .navigationBarTitle(Text("Git Users list")) //Add navigation title
        }.navigationViewStyle(StackNavigationViewStyle()) // Support all orientations and all devices (iPhone and iPad)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

