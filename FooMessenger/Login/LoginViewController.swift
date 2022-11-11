//
//  LoginViewController.swift
//  FooMessenger
//
//  Created by Hollis Kwan on 10/9/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    let contentView = LoginView()
    let viewModel = LoginViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButtonTapAction()
        navSetup()
    }
    
    private func navSetup() {
        navigationItem.title = "Login"
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Register",
            style: .done,
            target: self,
            action: #selector(registerButtonTapped))
    }
    
    @objc private func registerButtonTapped() {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    private func loginButtonTapAction() {
        contentView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func loginButtonTapped() {
        let loginErrorModel = LoginErrorModel()
        viewModel.authenticateLogin(
            with: contentView.emailTextField,
            with: contentView.passwordTextField,
            errorLabel: contentView.errorLabel,
            missingParametersCompletion: { [weak self] in
                self?.contentView.errorMessage(loginErrorModel.missingParameters)
            }, wrongParametersCompletion: { [weak self] in
                self?.contentView.errorMessage(loginErrorModel.wrongParameters)
            }, passwordLessThan6Completion: { [weak self] in
                self?.contentView.errorMessage(loginErrorModel.passwordLessThanSix)
            },
            completion: { [weak self] in
                self?.transitionToMessenger()
            })
    }
    
    func transitionToMessenger() {
        let messengerVC = MessengerViewController()
        self.present(messengerVC, animated: true)
    }
}
