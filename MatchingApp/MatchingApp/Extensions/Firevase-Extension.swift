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
    

}

// MARK: - Firestore
extension Firestore {
    static func setUserDataToFirestore(email: String, uid: String, name: String?, completion: @escaping (Bool) -> ()) {
        guard let name = name else { return }
        
        let document = [
            "name" : name,
            "email": email,
            "creatAt": Timestamp()
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
}
