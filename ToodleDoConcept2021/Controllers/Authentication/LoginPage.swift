//
//  LoginPage.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/22/21.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK: Properties
    
    let backgroundView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 20
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    let loginLable: UILabel = {
        let lable = UILabel()
        lable.text = "Login"
        lable.font = UIFont.boldSystemFont(ofSize: 36)
        lable.textColor = .white
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    
    let toodleDoLable: UILabel = {
        let lable = UILabel()
        lable.text = "Welcome to ToodleDo "
        lable.textColor = .white
        lable.font = UIFont.boldSystemFont(ofSize: 16)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private lazy var firsttextfield: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.font = UIFont.boldSystemFont(ofSize: 14)
        textfield.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    private lazy var usernameContainerView: UIView = {
        let cv = Utilities().inputContainerView(leftimage: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: firsttextfield)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private lazy var secondtextfield: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.font = UIFont.boldSystemFont(ofSize: 14)
        textfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var passwordContainerView: UIView = {
        let iv = Utilities().inputContainerView(leftimage: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: secondtextfield)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 50) .isActive = true
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    let dontHaveAnAccountButton: UIButton = {
        
        let attributedTitle = NSMutableAttributedString(string: "Dont Have An Account Yet ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.systemBlue])
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.systemBlue]))
        
        let button = UIButton()
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradient()
        configureUI()

    }
    
    //MARK: Selectors
    
    @objc func handleLoginButton() {
        print("LogIN Tapped")
    }
    
    @objc func handleSignUp() {
        present(RegisterController(), animated: true, completion: nil)
    }
    
    //MARK: Helpers
    
    func configureGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.white.cgColor]
        view.layer.addSublayer(gradientLayer)
    }
    
    func configureUI() {
        view.addSubview(backgroundView)
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180) .isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor) .isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor) .isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor) .isActive = true
        
        let stack = UIStackView(arrangedSubviews: [loginLable, toodleDoLable])
        stack.spacing = 12
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 72) .isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20) .isActive = true
        
        let stackContainerView = UIStackView(arrangedSubviews: [usernameContainerView, passwordContainerView, loginButton])
        stackContainerView.axis = .vertical
        stackContainerView.spacing = 20
        stackContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.addSubview(stackContainerView)
        stackContainerView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 80) .isActive = true
        stackContainerView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 28) .isActive = true
        stackContainerView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -28) .isActive = true
        
        backgroundView.addSubview(dontHaveAnAccountButton)
        dontHaveAnAccountButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -18) .isActive = true
        dontHaveAnAccountButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor) .isActive = true

        
        
        
        
//        backgroundView.addSubview(usernameContainerView)
//        usernameContainerView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 80) .isActive = true
//        usernameContainerView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 28) .isActive = true
//        usernameContainerView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -28) .isActive = true
//        usernameContainerView.heightAnchor.constraint(equalToConstant: 50) .isActive = true
//

        
        
    }
    
//    func configurebackgroundView() {
//        backgroundView.addSubview(loginView)
//        loginView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20) .isActive = true
//        loginView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 250) .isActive = true
//        loginView.heightAnchor.constraint(equalToConstant: 50) .isActive = true
//    }
    
        
    }
    

