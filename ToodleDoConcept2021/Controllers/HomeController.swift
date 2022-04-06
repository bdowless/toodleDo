//
//  HomeController.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/7/21.
//
import UIKit

let reuseidentifier = "TaskCell"
private let categoryCellIdentifier = "CategoryCell"

class HomeController: UIViewController {
    
    // MARK: Properties
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.setImage(#imageLiteral(resourceName: "new_tweet"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 74/2
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
        
    }()
    

    
    let tableview: UITableView = {
        let tableView = UITableView()
        tableView.register(TaskCell.self, forCellReuseIdentifier: reuseidentifier)
        tableView.register(CategoriesCell.self, forCellReuseIdentifier: categoryCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        configureUI()

    }
    
    // MARK: Selectors
    
    @objc func actionButtonTapped() {
        
        let controller = AddTaskController()
        controller.delegate = self
        
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
        
    }
    
    //MARK: Helpers

    
    func configureUI() {
        view.backgroundColor = .creamWhite
        
        view.addSubview(tableview)
        tableview.frame = view.bounds
        
        view.addSubview(actionButton)
        actionButton.heightAnchor.constraint(equalToConstant: 74) .isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 74) .isActive = true
        actionButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30) .isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20) .isActive = true
        
        
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
        
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else if section == 1 {
            return 1
        } else {
            return tasks.count
//        return section == 0 ? 1 : 10
        }
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 00 {
//            return "Hi Joy"
//        } else {
//            return "Task for the Day"
//        }
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        
        if section == 0 {
            
        let view = TitleView()
            
            return view
            
        } else if section == 1 {
            
            let view = CategoriesHeaderView()
            return view

        } else {
            let view = TaskHeaderView()
            return view
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 80
        } else if section == 1  {
            return 40
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 200
        } else {
            return 80
        }
        
//        return indexPath.section == 0 ? 200 : 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if indexPath.section == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: categoryCellIdentifier, for: indexPath) as! CategoriesCell
        } else {
         let cell = tableView.dequeueReusableCell(withIdentifier: reuseidentifier, for: indexPath) as! TaskCell
            cell.Task = tasks[indexPath.row]
            return cell
        }
        return cell
    }
    
    
}

extension HomeController: AddTaskControllerDelegate {
    func shareTask(task: TaskModel) {
        tasks.append(task)
        tableview.reloadData()
    }
    
    
}


