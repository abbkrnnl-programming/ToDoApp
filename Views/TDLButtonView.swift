//
//  TDLButtonView.swift
//  ToDoList
//
//  Created by Абубакир on 29.10.2023.
//

import SwiftUI

struct TDLButtonView: View {
    let backgroundColor: Color
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) { // Call the action closure here
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(text)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    TDLButtonView(backgroundColor: .blue, text: "text") {
        
    }
}
