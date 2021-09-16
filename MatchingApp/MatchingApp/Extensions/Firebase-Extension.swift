//
//  Firevase-Extension.swift
//  MatchingApp
//
//  Created by taniguchi shuji on 2021/09/16.
//

import Firebase
import FirebaseFirestore
import FirebaseAuth

// MARK: - Auth
extension Auth {
    static func createUserToFireAuth(email: String?, password: String?, name: String?, completion: @escaping (Bool) -> Void) {
        guard let email = email else { return }
        guard let password = password else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (auth, err) in
            if let err = err {
                print("auth情報の保存に失敗: ", err)
                return
            }
            
            guard let uid = auth?.user.uid else { return }
            Firestore.setUserDataToFirestore(email: email ,uid: uid, name: name) { success in
                completion(success)
                
            }
        }
    }
    
    static func loginWithFireAuth(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            if let err = err {
                print("ログインに失敗:　", err)
                completion(false)
                return
            }
            
            print("ログインに成功")
            completion(true)
        }
    }
    

    

}

// MARK: - Firestore
extension Firestore {
    static func setUserDataToFirestore(email: String, uid: String, name: String?, completion: @escaping (Bool) -> ()) {
        guard let name = name else { return }
        
        let document = [
            "name" : name,
            "email": email,
            "createdAt": Timestamp()
        ] as [String : Any]
        
        Firestore.firestore().collection("users").document(uid).setData(document){
            err in
            
            if let err = err {
                print("ユーザ情報のfirestoreへの保存に失敗: ", err)
                return
            }
            
            completion(true)
            print("ユーザ情報のfirestoreへの保存に成功")
        }
    }
    
    static func fetchUserFromFirestore(uid: String, compeltion: @escaping (User?) -> Void) {
        Firestore.firestore().collection("users").document(uid).getDocument { (snapshot, err) in
            if let err = err {
                print("ユーザ情報の取得に失敗:", err)
                compeltion(nil)
                return
            }
            
            guard let dic = snapshot?.data() else { return }
            let user = User.init(dic: dic)
            compeltion(user)
            
        }
    }
    
    static func fetchUsersFromFirestore(completion: @escaping ([User]) -> Void) {
        Firestore.firestore().collection("users").getDocuments { (snapshots, err) in
            if let err = err {
                print("ユーザ情報の取得に失敗: ", err)
                return
            }
            
            
            let users = snapshots?.documents.map({ (snapshot) -> User in
                let dic = snapshot.data()
                let user = User(dic: dic)
                return user
            })
            
            completion(users ?? [User]())
        }
    }
}
