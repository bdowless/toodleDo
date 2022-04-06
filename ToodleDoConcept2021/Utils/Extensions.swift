//
//  Extensions.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/7/21.
//

import UIKit

extension UIColor {
    static func rgb(red:CGFloat, green:CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static let creamWhite = rgb(red: 252, green: 248, blue: 250)
}

