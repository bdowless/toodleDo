//
//  CategoryService.swift
//  ToodleDoConcept2021
//
//  Created by Brandon Dowless on 10/18/21.
//

import Firebase
import UIKit

typealias FirestoreCompletion = (((Error?) ->Void)?)

struct CategoryService {
    static let shared = CategoryService()
    
//    func uploadCategory(categoryTitle: String, categoryColor: UIColor, completion: @escaping(Error?, DatabaseRefrence) -> Void) {
//        let values = ["title" : categoryName,
//                      "categoryColor" : categoryColor]
//    }
    

    
    func uploadCategory(categoryTitle: String, categoryColor: UIColor, completion: FirestoreCompletion) {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
        let query = Firestore.firestore().collection("users")
            .document("OSuh0z2bsbWwt8cdTct4")
            .collection("categories")
        
        let values = ["title" : categoryTitle,
                      "categoryColor" : categoryColor] as [String : Any]
        
        query.addDocument(data: values, completion: completion)
    }
    
    func fetchTasks(forCategory category: Category) {
        let query = Firestore.firestore().collection("users")
            .document("OSuh0z2bsbWwt8cdTct4")
            .collection("tasks")
        
        
        query.whereField("categoryID", isEqualTo: category.id).getDocuments { (snapshot, error) in
            
        }
        
    }
    
}



//struct TweetService {
//    static let shared = TweetService()
//
//    func uploadTweet(caption: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//
//        let values = ["uid": uid,
//                      "timestamp": Int(NSDate().timeIntervalSince1970),
//                      "likes": 0,
//                      "retweets": 0,
//                      "caption": caption] as [String : Any]
//
//        DB_TWEETS.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
//        }
