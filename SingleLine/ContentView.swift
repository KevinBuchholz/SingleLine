//
//  ContentView.swift
// 
//
//  Created by Kevin Buchholz on 5/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.black)
                .padding()
            NavigationLink("Let's play with some harmful behaviors!!!", destination: SingleLine())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
