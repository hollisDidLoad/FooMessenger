//
//  LoginViewModel.swift
//  FooMessenger
//
//  Created by Hollis Kwan on 10/9/22.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewModel {
    
    func authenticateLogin(
        with emailTextField: UITextField,
        with passwordTextField: UITextField,
        errorLabel: UILabel?,
        missingParametersCompletion: @escaping (() -> Void),
        wrongParametersCompletion: @escaping () -> Void,
        passwordLessThan6Completion: @escaping () -> Void,
        completion: @escaping (() -> Void)
    ) {
        guard let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty else { return missingParametersCompletion() }
        if password.count >= 6 {
            Auth.auth().signIn(withEmail: email, password: password, completion: { result, error in
                if error != nil {
                    wrongParametersCompletion()
                    return
                }
                errorLabel?.text?.removeAll()
                completion()
            })
        } else {
            passwordLessThan6Completion()
        }
    }
}
 
 
