//
//  CatagoriesHeaderViewViewController.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/10/21.
//

import UIKit

class TitleView: UIView {
    
    let lableTitle: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.boldSystemFont(ofSize: 28)
        lable.textColor = .black
        lable.text = "Welcome Joy!"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .creamWhite
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(lableTitle)
        lableTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 50) .isActive = true
        lableTitle.centerYAnchor.constraint(equalTo: centerYAnchor) .isActive = true
        lableTitle.heightAnchor.constraint(equalToConstant: 80) .isActive = true
    }
    
    }
    



