//
//  RegisterViewModel.swift
//  FooMessenger
//
//  Created by Hollis Kwan on 10/9/22.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel {
    
    func verifySignUpCredentials(
        with emailTextField: UITextField,
        with passwordTextField: UITextField,
        with firstNameTextField: UITextField,
        with lastNameTextField: UITextField,
        errorLabel: UILabel?,
        missingInformationCompletion: @escaping (() -> Void),
        accountExistsCompletion: @escaping () -> Void,
        passwordLessThanSixCompletion: @escaping () -> Void,
        completion: @escaping (() -> Void)
    ) {
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
            !email.isEmpty,
            !password.isEmpty,
            !firstName.isEmpty,
            !lastName.isEmpty
        else
        { return missingInformationCompletion() }
        
        if password.count >= 6 {
            Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in
                if error != nil {
                    accountExistsCompletion()
                    return
                }
                
                let database = Firestore.firestore()
                database.collection("Users").addDocument(data: ["firstName": firstName, "lastName": lastName, "uid" : result?.user.uid as Any])
                errorLabel?.text?.removeAll()
                completion()
            })
        } else {
            passwordLessThanSixCompletion()
        }
    }
}

