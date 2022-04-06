//
//  CollectionViewCells.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/8/21.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell {
    
    
    static let reuseIdentifier = "tableCollectionViewCell"
    
    var categories: Category? {
        didSet{configureCell()}
    }
    
    let lableTitle: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.boldSystemFont(ofSize: 16)
        lable.textColor = .black
        lable.text = "Welcome Joy!"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    let taskamount: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.boldSystemFont(ofSize: 12)
        lable.textColor = .lightGray
        lable.text = "40 Task"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    let lowerView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemPurple
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureUI()
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
//        self.layer.borderColor = UIColor.systemPurple.cgColor
//        self.layer.borderWidth = 1

    
    }
    
    func configureCell() {
        lableTitle.text = categories?.catagory
        taskamount.text = categories?.taskAmount
//        lowerView.backgroundColor = categories?.color
        
    }
    
    func configureUI() {
        addSubview(lableTitle)
        lableTitle.centerXAnchor.constraint(equalTo: centerXAnchor) .isActive = true
        lableTitle.centerYAnchor.constraint(equalTo: centerYAnchor) .isActive = true
        
        addSubview(taskamount)
        taskamount.topAnchor.constraint(equalTo: lableTitle.topAnchor, constant: -20) .isActive = true
        taskamount.leftAnchor.constraint(equalTo: lableTitle.leftAnchor) .isActive = true
        
        addSubview(lowerView)
        lowerView.heightAnchor.constraint(equalToConstant: 5) .isActive = true
        lowerView.widthAnchor.constraint(equalToConstant: 80) .isActive = true
        lowerView.topAnchor.constraint(equalTo: lableTitle.bottomAnchor, constant: 10) .isActive = true
        lowerView.centerXAnchor.constraint(equalTo: centerXAnchor) .isActive = true
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
