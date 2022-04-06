//
//  TaskModel.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/10/21.
//

import UIKit

enum DetailCellModel: Int, CaseIterable {
    case date
    case time
    case location
    case url
    
    var imageName: String {
        switch self {
        case .date: return "calendar"
        case .time: return "clock"
        case .location: return "paperplane"
        case .url: return ""
        }
    }
}

struct TaskModel {
    var tasksss: String
}

var tasks: [TaskModel] = [
    TaskModel(tasksss: "Create Login Page"),
    TaskModel(tasksss: "Finishing Building UI"),
    TaskModel(tasksss: "Work Meeting at 3"),
    TaskModel(tasksss: "Work Party This Tuesday"),
    TaskModel(tasksss: "Contact Heffe Booklow"),
    TaskModel(tasksss: "Finish Add Task Button"),
    TaskModel(tasksss: "Create Login Page"),
    TaskModel(tasksss: "Finishing Building UI"),
    TaskModel(tasksss: "Work Meeting at 3"),
    TaskModel(tasksss: "Work Party This Tuesday")

]
