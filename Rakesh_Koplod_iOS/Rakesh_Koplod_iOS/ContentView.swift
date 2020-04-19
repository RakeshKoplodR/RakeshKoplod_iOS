//
//  ContentView.swift
//  Rakesh_Koplod_iOS
//
//  Created by Rakesh on 19/04/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       NavigationView {
            List {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }
            .navigationBarTitle("Menu")
       .onAppear(perform: loadData)
        }
    }
    
    func loadData() {
       NetworkManager().getDataFromURL(urlString: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return //completion(nil, error)
            }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let jsonString = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        print(jsonString)
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
