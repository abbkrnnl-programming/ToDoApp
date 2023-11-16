//
//  ProfileView.swift
//  ToDoList
//
//  Created by Абубакир on 28.10.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    profile(user: user)
                } else{
                    Text("Loading profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        //Info: Name, Email, Member since
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                
                Text("\(user.name)")
            }
            .padding()
            
            HStack{
                Text("Email: ")
                    .bold()
                
                Text("\(user.email)")
            }
            .padding()
            
            HStack{
                Text("Member since: ")
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()

        }
        
        //Sign out
        Button(action: {
            viewModel.logOut()
        }, label: {
            Text("Log Out")
                .tint(.red)
        })
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
