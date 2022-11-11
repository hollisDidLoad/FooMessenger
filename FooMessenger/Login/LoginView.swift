//
//  LoginView.swift
//  FooMessenger
//
//  Created by Hollis Kwan on 10/9/22.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let fooLogoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "foomessenger")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.returnKeyType = .continue
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let loginButton = GradientLoginButton()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        label.layer.cornerRadius = 25
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(fooLogoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(errorLabel)
        
        fooLogoImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 40).isActive = true
        fooLogoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        fooLogoImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        fooLogoImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: fooLogoImageView.bottomAnchor, constant: -50).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        errorLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30).isActive = true
        errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        errorLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func errorMessage(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}
