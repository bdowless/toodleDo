//
//  CatagoriesCollectionViewCell.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/8/21.
//

import UIKit

class CatagoriesTableViewCell: UITableViewCell {
    
    var categories: Category? {
        didSet{configureCategoryCell()}
    }
    
    var lable: UILabel = {
        let lable = UILabel()
        lable.text = "Buisness"
        lable.font = UIFont.boldSystemFont(ofSize: 16)
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        return lable
    }()
    
    let sideView: UIView = {
        let sideview = UIView()
        sideview.backgroundColor = .systemPurple
        sideview.heightAnchor.constraint(equalToConstant: 50) .isActive = true
        sideview.widthAnchor.constraint(equalToConstant: 50) .isActive = true
        sideview.layer.cornerRadius = 25
        sideview.translatesAutoresizingMaskIntoConstraints = false
        
        return sideview
    }()
    
    let sideImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
//      iv.sizeThatFits(CGSize(width: 10, height: 10))
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 20) .isActive = true
        iv.widthAnchor.constraint(equalToConstant: 20) .isActive = true
        return iv
    }()
        
        


    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        contentView.addSubview(sideView)
        sideView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20) .isActive = true
        sideView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor) .isActive = true
        
        sideView.addSubview(sideImageView)
        sideImageView.centerXAnchor.constraint(equalTo: sideView.centerXAnchor) .isActive = true
        sideImageView.centerYAnchor.constraint(equalTo: sideView.centerYAnchor) .isActive = true
        
        contentView.addSubview(lable)
        lable.leftAnchor.constraint(equalTo: sideView.rightAnchor, constant: 36) .isActive = true
        lable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor) .isActive = true
        
        
        
        
    }
    
    func configureCategoryCell() {
        sideView.backgroundColor = categories?.color
        lable.text = categories?.catagory
        sideImageView.image = categories?.image
        
        
    }
    
        
}
    



