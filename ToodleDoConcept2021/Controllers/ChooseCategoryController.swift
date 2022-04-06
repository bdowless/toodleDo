//
//  UploadTaskController.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/14/21.
//

import UIKit

protocol chooseCategoryControllerDelegate{
    func handleCategorytapped(category: Category)
}

let reuseidentifiertv = "reuse"

class chooseCategoryController: UIViewController {
    
    //MARK: Properties
    
    var delegate: chooseCategoryControllerDelegate?
    
  
    
    let tableview: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .creamWhite
        tableview.register(CatagoriesTableViewCell.self, forCellReuseIdentifier: reuseidentifiertv)
        return tableview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


    
    
    func configureUI() {
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
        tableview.centerXAnchor.constraint(equalTo: view.centerXAnchor) .isActive = true
        tableview.centerYAnchor.constraint(equalTo: view.centerYAnchor) .isActive = true
        tableview.heightAnchor.constraint(equalTo: view.heightAnchor) .isActive = true
        tableview.widthAnchor.constraint(equalTo: view.widthAnchor) .isActive = true
    }
    

    
    
}

extension chooseCategoryController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoriesclicked.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: reuseidentifiertv, for: indexPath) as! CatagoriesTableViewCell
        cell.categories = categoriesclicked[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {

            tableview.deselectRow(at: indexPath, animated: true)
            self.dismiss(animated: true, completion: nil)
            return
        } else {
            return
        }
    }
}
   

