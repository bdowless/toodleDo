//
//  AuthService.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/26/21.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email : String
    let password: String
    let username: String
    let fullname: String
}

struct AuthService {
    static let shared = AuthService()
    
    
    func registerUser(credentials: AuthCredentials, completion: FirestoreCompletion) {
        
        let email = credentials.email
        let password = credentials.password
        let username = credentials.username
        let fullname = credentials.fullname
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if  let error = error {
                print("Error is \(error) ")
            }
            guard let uid = result?.user.uid else { return }
    
        
            let values = ["email": email,
                          "username": username,
                          "fullname": fullname] as [String : Any]
            Firestore.firestore().collection("users").document(uid).collection("userdetails").addDocument(data: values)
        }
    }
    
}
