//
//  TaskView.swift
//  ToDo
//
//  Created by Paweł Brzozowski on 14/04/2022.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        VStack {
            Text("My tasks")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.123, saturation: 0.662, brightness: 1.0))
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
