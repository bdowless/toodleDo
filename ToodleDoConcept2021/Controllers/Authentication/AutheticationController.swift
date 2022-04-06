//
//  AutheticationController.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/25/21.
//
import UIKit

class RegisterController: UIViewController {
    
    //MARK: Properties
    
    let backgroundView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 20
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    let registerLable: UILabel = {
        let lable = UILabel()
        lable.text = "Register"
        lable.font = UIFont.boldSystemFont(ofSize: 36)
        lable.textColor = .white
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    
    let toodleDoLable: UILabel = {
        let lable = UILabel()
        lable.text = "Create Your ToodleDo Profile "
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
        textfield.attributedPlaceholder = NSAttributedString(string: "FullName", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var fullNameContainerView: UIView = {
        let iv = Utilities().inputContainerView(leftimage: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: secondtextfield)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var thirdtextfield: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.font = UIFont.boldSystemFont(ofSize: 14)
        textfield.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var emailContainerView: UIView = {
        let iv = Utilities().inputContainerView(leftimage: #imageLiteral(resourceName: "mail"), textField: thirdtextfield)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var fourthtextfield: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.font = UIFont.boldSystemFont(ofSize: 14)
        textfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var passwordContainerView: UIView = {
        let iv = Utilities().inputContainerView(leftimage: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: fourthtextfield)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register User", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 50) .isActive = true
        button.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
        
        return button
    }()
    
    let alreadyHaveAnAccountButton: UIButton = {
        
        let attributedTitle = NSMutableAttributedString(string: "Already Have An Account ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.systemBlue])
        
        attributedTitle.append(NSAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.systemBlue]))
        
        let button = UIButton()
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradient()
        configureUI()

    }
    
    //MARK: Selectors
    
    @objc func handleRegisterButton() {
        
        guard let email = thirdtextfield.text else { return }
        guard let password = fourthtextfield.text else { return }
        guard let username = firsttextfield.text else { return }
        guard let fullname = secondtextfield.text else { return }
        
        
        
        let credentials = AuthCredentials(email: email, password: password, username: username, fullname: fullname)
        
        
        AuthService.shared.registerUser(credentials: credentials) { (error) in
            print("DEBUG: Succesfully registered user")
        }
    }
    
    @objc func handleSignIn() {
        dismiss(animated: true, completion: nil)
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
        
        let stack = UIStackView(arrangedSubviews: [registerLable, toodleDoLable])
        stack.spacing = 12
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 72) .isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20) .isActive = true
        
        let stackContainerView = UIStackView(arrangedSubviews: [usernameContainerView, emailContainerView, fullNameContainerView, passwordContainerView, registerButton])
        stackContainerView.axis = .vertical
        stackContainerView.spacing = 20
        stackContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.addSubview(stackContainerView)
        stackContainerView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 80) .isActive = true
        stackContainerView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 28) .isActive = true
        stackContainerView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -28) .isActive = true

        backgroundView.addSubview(alreadyHaveAnAccountButton)
        alreadyHaveAnAccountButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -18) .isActive = true
        alreadyHaveAnAccountButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor) .isActive = true
        
        
        
        
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
    

