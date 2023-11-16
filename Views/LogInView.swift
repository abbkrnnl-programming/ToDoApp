//
//  LogInView.swift
//  ToDoList
//
//  Created by Абубакир on 28.10.2023.
//

import SwiftUI

struct LogInView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List",
                           subtitle: "Get things done!",
                           angle: 15.0,
                           backgroundColor: Color.blue)
                
                //Login Form
                Form{
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TDLButtonView(backgroundColor: .blue, text: "Log In"){
                        viewModel.login()
                    }
                    .padding(.vertical)
                }
                .offset(y: -50)
                
                //Create Account
                VStack{
                    Text("New around here?")
                    
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Create an account")
                    }
                }
                .padding(.top, 5)
                .padding(.bottom, 50)
            }
            
            Spacer()
        }
    }
}

#Preview {
    LogInView()
}
