//
//  MessageBubble.swift
//  Messages+
//
//  Created by Paweł Brzozowski on 25/04/2022.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = true
    
    var body: some View {
        VStack(alignment: message.recived ? .leading : .trailing) {
            HStack {
                Text(message.test)
                    .padding()
                    .background(message.recived ? Color("Gray") : Color("Peach"))
                    .cornerRadius(30)
                    
            }
            .frame(maxWidth: 300, alignment: message.recived ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.system(size: 10))
                    .padding(message.recived ? .leading : .trailing, 20)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.recived ? .leading : .trailing)
        .padding(message.recived ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "1234", test: "I like chease 🤥", recived: false, timestamp: Date()))
    }
}
