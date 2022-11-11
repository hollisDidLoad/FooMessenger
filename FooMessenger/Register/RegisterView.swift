//
//  RegisterView.swift
//  FooMessenger
//
//  Created by Hollis Kwan on 10/9/22.
//

import Foundation
import UIKit

class RegisterView: UIView {
    
    let fooLogoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "profileimagehere")
        view.contentMode = .scaleAspectFit
        return view
    }()

    let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "First Name"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.returnKeyType = .continue
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Last Name"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.returnKeyType = .continue
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemBackground
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
    
    let registerButton = GradientRegisterButton()
    
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
    
    override func layoutSubviews() {
        fooLogoImageView.layer.cornerRadius = fooLogoImageView.frame.height/2
        fooLogoImageView.layer.masksToBounds = false
        fooLogoImageView.clipsToBounds = true
    }
    
    private func setupConstraints() {
        addSubview(fooLogoImageView)
        addSubview(firstNameTextField)
        addSubview(lastNameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
        addSubview(errorLabel)
        
        
        fooLogoImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 30).isActive = true
        fooLogoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        fooLogoImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        fooLogoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        firstNameTextField.topAnchor.constraint(equalTo: fooLogoImageView.bottomAnchor).isActive = true
        firstNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        firstNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        firstNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 10).isActive = true
        lastNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        lastNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        lastNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 10).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        errorLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor).isActive = true
        errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        errorLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func errorMessage(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}
