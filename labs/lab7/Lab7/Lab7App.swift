//
//  Lab7App.swift
//  Lab7
//
//  Created by Gaurav Shah on 4/7/21.
//

import SwiftUI

@main
struct Lab7App: App {
    var body: some Scene {
        WindowGroup {
            ParentView(taskmodel: TaskModel.init())
        }
    }
}
