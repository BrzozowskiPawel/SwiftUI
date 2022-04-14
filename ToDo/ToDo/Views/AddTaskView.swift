//
//  AddTaskView.swift
//  ToDo
//
//  Created by Paweł Brzozowski on 14/04/2022.
//

import SwiftUI

struct AddTaskView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create a new task")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.123, saturation: 0.662, brightness: 1.0))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
