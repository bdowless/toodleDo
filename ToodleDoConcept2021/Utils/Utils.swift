//
//  Utils.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/14/21.
//

import UIKit

class Utilities {
    
    func textview(UIlable: UILabel, lableText: String, caption: String, UItextfield: UITextField) -> UIView {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.heightAnchor.constraint(equalToConstant: 100) .isActive = true
        view.widthAnchor.constraint(equalToConstant: 100) .isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        

        
        
        let textfield = UItextfield
        textfield.text = caption
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.heightAnchor.constraint(equalToConstant: 20) .isActive = true
        textfield.widthAnchor.constraint(equalToConstant: 50) .isActive = true
    

        
        view.addSubview(textfield)
        textfield.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -12) .isActive = true
        textfield.topAnchor.constraint(equalTo: view.topAnchor, constant: 10) .isActive = true
        
        let lable = UIlable
        lable.text = lableText
        lable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lable)
        lable.topAnchor.constraint(equalTo: view.topAnchor, constant: -20) .isActive = true
        lable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1) .isActive = true
        lable.heightAnchor.constraint(equalToConstant: 14) .isActive = true
        lable.widthAnchor.constraint(equalTo: view.widthAnchor) .isActive = true
        
        return view
        
    }
    
    func textFieldHelper(placeholder: String, height: CGFloat) -> UITextField {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder)
        textfield.font = UIFont.boldSystemFont(ofSize: 16)
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 10
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.heightAnchor.constraint(equalToConstant: height) .isActive = true
        return textfield
    }
    
    func lableHelper(lableText: String) -> UILabel {
        let lable = UILabel()
        lable.text = lableText
        lable.font = UIFont.boldSystemFont(ofSize: 18)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }
    
    
    func inputContainerView(leftimage: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1 / 2
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 10
        view.heightAnchor.constraint(equalToConstant: 50) .isActive = true
        
        let iv = UIImageView()
        iv.image = leftimage.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .systemBlue
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 20) .isActive = true
        iv.widthAnchor.constraint(equalToConstant: 20) .isActive = true
        
        
        
        let stack = UIStackView(arrangedSubviews: [iv, textField])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10) .isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor) .isActive = true
        
        
        
        
        
        
        
        
        
        
        return view
    }
    
    
}


//let categoryTextField: UITextField = {
//    let textfield = UITextField()
//    textfield.textColor = .black
//    textfield.font = UIFont.systemFont(ofSize: 14)
//    textfield.attributedPlaceholder = NSAttributedString(string: " Enter Category")
//    textfield.translatesAutoresizingMaskIntoConstraints = false
//    textfield.backgroundColor = .white
//    textfield.layer.borderColor = UIColor.lightGray.cgColor
//    textfield.layer.borderWidth = 1
//    textfield.layer.cornerRadius = 8
//
//    return textfield
//}()

