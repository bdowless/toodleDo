//
//  AddTaskController.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/21/21.
//

import UIKit

protocol AddTaskControllerDelegate {
    func shareTask(task: TaskModel)
}

class AddTaskController: UIViewController {
    
    var delegate: AddTaskControllerDelegate?
    
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitle("Add Task", for: .normal)
        button.addTarget(self, action: #selector(handleAddTarget), for: .touchUpInside)
        return button
    }()
    
    let upperView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .white
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    let upperTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .gray
        textfield.attributedPlaceholder = NSAttributedString(string: "Title", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.font = UIFont(name: "ad", size: 14)
        return textfield
    }()
    
    let spacer: UIView = {
        let spacer = UIView()
        spacer.backgroundColor = .lightGray
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer.heightAnchor.constraint(equalToConstant: 1 / 2) .isActive = true
        spacer.layer.cornerRadius = 5
        return spacer
    }()
    
    let lowerTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .gray
        textfield.attributedPlaceholder = NSAttributedString(string: "Notes", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.font = UIFont(name: "ad", size: 14)
        return textfield
    }()
    
    let categoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Category", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 66) .isActive = true
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        
        let imageview: UIImageView = {
            let iv = UIImageView()
            iv.image = #imageLiteral(resourceName: "down_arrow_24pt")
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
        
        button.addSubview(imageview)
        imageview.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -20) .isActive = true
//        imageview.topAnchor.constraint(equalTo: button.topAnchor, constant: 20) .isActive = true
        imageview.centerYAnchor.constraint(equalTo: button.centerYAnchor) .isActive = true
        
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavbar()
        view.backgroundColor = .creamWhite
    }
    
    // MARK : Selectors
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func buttonTapped() {
        let nav = UINavigationController(rootViewController: chooseCategoryController())
        present(nav, animated: true, completion: nil)
        
    }
    
    @objc func handleAddTarget() {
        guard let taskText = lowerTextField.text else { return }
        let taskobject = TaskModel(tasksss: taskText)
        delegate?.shareTask(task: taskobject)
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK : Helpers
    
    func configureNavbar() {
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.title = "Add Task"
    }
    
    
    func configureUI() {
        view.addSubview(upperView)
        upperView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120) .isActive = true
        upperView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16) .isActive = true
        upperView.heightAnchor.constraint(equalToConstant: 200) .isActive = true
        upperView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16) .isActive = true
        
        let stackview = UIStackView(arrangedSubviews: [upperTextField, spacer, lowerTextField])
        stackview.spacing = 18
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        upperView.addSubview(stackview)
        stackview.leftAnchor.constraint(equalTo: upperView.leftAnchor, constant: 10) .isActive = true
        stackview.topAnchor.constraint(equalTo: upperView.topAnchor, constant: 10) .isActive = true
        stackview.rightAnchor.constraint(equalTo: upperView.rightAnchor, constant: -1) .isActive = true
        
        view.addSubview(categoryButton)
        categoryButton.widthAnchor.constraint(equalTo: upperView.widthAnchor) .isActive = true
        categoryButton.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 50) .isActive = true
        categoryButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16) .isActive = true
        
        view.addSubview(button)
        button.heightAnchor.constraint(equalToConstant: 50) .isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10) .isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10) .isActive = true
        button.topAnchor.constraint(equalTo: categoryButton.bottomAnchor, constant: 10) .isActive = true
    }
    
    
}
