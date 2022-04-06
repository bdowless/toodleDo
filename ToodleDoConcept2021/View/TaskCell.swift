//
//  CatagoriesHeaderView.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/7/21.
//

import UIKit

//protocol tweetCellDelegate: class {
//    // required functions that are part of protocol.
//    // any class that conforms to protocol has to implement these functions
//    func handleProfileImageTapped()
//}

class TaskCell: UITableViewCell {
    
    var Task: TaskModel? {
        didSet{configureCellFromTaskArray()}
    }
    
//    private lazy var taskImageView: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFit
//        iv.clipsToBounds = true
//        iv.heightAnchor.constraint(equalToConstant: 24) .isActive = true
//        iv.widthAnchor.constraint(equalToConstant: 24) .isActive = true
//        iv.layer.cornerRadius = 24 / 2
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.backgroundColor = .red
//        let tap = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
//        iv.addGestureRecognizer(tap)
//        iv.isUserInteractionEnabled = true
//        return iv
//    }()
//
//    weak var delegate: tweetCellDelegate?
    
    let view: UIView = {
        let iv = UIView()
        iv.backgroundColor = .white
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.text = "Work Meeting at 3"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.tintColor = .systemRed
        button.backgroundColor = .white
        button.layer.cornerRadius = 24 / 2
        button.layer.borderColor = UIColor.systemPurple.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.isUserInteractionEnabled = true

        return button
    }()
//
//    let actionButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.tintColor = .white
//        button.backgroundColor = .twitterblue
//        button.setImage(#imageLiteral(resourceName: "new_tweet"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.cornerRadius = 56/2
//        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
//        return button
//
//    }()
    
     
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureView()
        contentView.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Helpers
    
    @objc func buttonTapped() {
        print("Button has been tapped")
//        delegate?.handleProfileImageTapped()
    }
    
    func configureUI() {
        backgroundColor = .creamWhite
        
        
    }
    
    func configureCellFromTaskArray(){
        taskLabel.text = Task?.tasksss
    }
    
    func configureView() {
        addSubview(view)
        view.heightAnchor.constraint(equalToConstant: 50) .isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor, constant: 15) .isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor, constant: -15) .isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7) .isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: 7) .isActive = true
        
        addSubview(taskLabel)
        taskLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 100) .isActive = true
        taskLabel.centerYAnchor.constraint(equalTo: centerYAnchor) .isActive = true
        
        addSubview(checkButton)
        checkButton.heightAnchor.constraint(equalToConstant: 24) .isActive = true
        checkButton.widthAnchor.constraint(equalToConstant: 24) .isActive = true
        checkButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20) .isActive = true
        checkButton.centerYAnchor.constraint(equalTo: centerYAnchor) .isActive = true
        
    }
}
