//
//  ParentView.swift
//  Lab7
//
//  Created by Gaurav Shah on 4/7/21.
//

import SwiftUI


struct ParentView: View {
    //TODO: CREATE A VARIABLE INSTANCE OF TASKMODEL WITH THE CORRECT TAG
    
    var body: some View {
        VStack (alignment: .leading){
            
            //TODO: CREATE A TEXT ELEMENT WITH YOUR APP TITLE
            
            //TODO: CREATE THE ELEMENTS OF OUR LIST
            //TODO OPTIONAL: USE THE TASKCELL STRUCT TO FORMAT THE TASKS
            
            Button(action: {
                //LEAVE BLANK
            }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("New Task")
                }
            }.padding()
        }
    }
}

class TaskModel: ObservableObject {
    @Published var tasks: [Tasks] = [
        Tasks(title: "Buy groceries", completed: false, deadline: "April 10"),
        Tasks(title: "Clean Room", completed: false, deadline: "April 11"),
        Tasks(title: "Submit Homework", completed: false, deadline:"April 14"),
        Tasks(title: "Study for Midterm", completed: false, deadline: "April 17"),
       ]
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView(taskmodel: TaskModel.init())
    }
}

