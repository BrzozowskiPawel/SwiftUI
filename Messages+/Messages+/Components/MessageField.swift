//
//  MessageField.swift
//  Messages+
//
//  Created by Paweł Brzozowski on 25/04/2022.
//

import SwiftUI

struct MessageField: View {
    @State private var message = ""
    
    var body: some View {
        HStack {
            CurstomTextField(placeholder: Text("Enter your message here"), text: $message)
            Button {
                print("MESSAGE SENT")
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
    }
}

struct CurstomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var comit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: comit)
        }
    }
}
