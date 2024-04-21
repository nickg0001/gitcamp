//
//  ContentView.swift
//  camper
//
//  Created by Nick Gibson on 4/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
    
        ZStack {
            
            
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                
                Image("CAMPER")
                    .resizable()
                    .cornerRadius(51.0)
                    .aspectRatio(contentMode: .fit)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("CAMP")
                    .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/).fontWeight(.black).foregroundColor(Color.white)
                }
                }

                
            }
            
        }
    


#Preview {
    ContentView()
}
