//
//  TaskCell.swift
//  Lab7
//
//  Created by Gaurav Shah on 4/7/21.
//

import SwiftUI

//TASKCELL IS A VIEW OBJECT THAT FORMATS EACH ROW OF THE LIST
//CONSISTS OF AN HSTACK WITH AN IMAGE, TEXTFIELD, SPACER, TEXTFIELD


struct TaskCell: View {
    var id: Int
    @ObservedObject var taskmodel: TaskModel
    
    var body: some View {
    HStack {
        Image(systemName: taskmodel.tasks[id].completed ? "checkmark.circle.fill" : "circle")
            .resizable()
            .frame(width: 20, height: 20)
            .onTapGesture {
                taskmodel.tasks[id].completed.toggle()
              }
        TextField(taskmodel.tasks[id].title, text: $taskmodel.tasks[id].title)
        Spacer()
        TextField(taskmodel.tasks[id].deadline, text: $taskmodel.tasks[id].deadline).padding(.leading, 100)
    }
  }
}
