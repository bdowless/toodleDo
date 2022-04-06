//
//  CatagoriesModel.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/10/21.
//

import UIKit

struct Category {
    var catagory: String
    var taskAmount: String?
    var color: UIColor
    let id: String = NSUUID().uuidString
    var image: UIImage?
}

let catagories: [Category] = [
    Category(catagory: "Buisness", taskAmount: "40 Task", color: .green),
    Category(catagory: "Personal", taskAmount: "28 Task", color: .blue),
    Category(catagory: "Shopping", taskAmount: "12 Task", color: .red),
    Category(catagory: "Bills", taskAmount: "7 Task", color: .yellow),
    Category(catagory: "Chores", taskAmount: "4 Tasks", color: .systemPink)
]

let categoriesclicked: [Category] = [ Category(catagory: "Buisness", taskAmount: "", color: .systemGreen, image: #imageLiteral(resourceName: "ic_person_outline_white_2x")),
                                      Category(catagory: "Personal", taskAmount: "", color: .systemBlue, image: #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")),
                                      Category(catagory: "Shopping", taskAmount: "", color: .systemOrange, image: #imageLiteral(resourceName: "ic_lock_outline_white_2x")),
                                      Category(catagory: "Bills", taskAmount: "", color: .systemRed, image: #imageLiteral(resourceName: "ic_menu_white_3x"))


]




//struct Workout {
//    var title: String
//    var image: UIImage
//}
//
//
//
//let workouts: [Workout] = [
//    Workout(title: "Shoulders", image: #imageLiteral(resourceName: "pngtree-minimalistic-blue-cartoon-character-sport-fitness-background-image_257041")),
//    Workout(title: "Legs", image: #imageLiteral(resourceName: "91cf2d96b6f71c752fd3d372436c0ed1a56c1bb8_2_690x387")),
//    Workout(title: "Arms", image: #imageLiteral(resourceName: "photo-1558611848-73f7eb4001a1")),
//    Workout(title: "Cardio", image: #imageLiteral(resourceName: "cartoon-man-woman-do-standing-toe-touch-exercise-design-72909071")),
//]


