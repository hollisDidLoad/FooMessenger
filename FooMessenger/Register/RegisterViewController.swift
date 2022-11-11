//
//  RegisterViewController.swift
//  FooMessenger
//
//  Created by Hollis Kwan on 10/9/22.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    let contentView = RegisterView()
    let viewModel = RegisterViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButtonTappedSetup()
        profileImageHereTappedSetup()
        navSetup()
    }
    
    private func navSetup() {
        title = "Create Account"
    }
    
    private func registerButtonTappedSetup() {
        contentView.registerButton.addTarget(
            self,
            action: #selector(registerButtonTapped),
            for: .touchUpInside)
    }
    
    @objc private func registerButtonTapped() {
        let registerErrorModel = RegisterErrorModel()
        resigningTextFields()
        viewModel.verifySignUpCredentials(
            with: contentView.emailTextField,
            with: contentView.passwordTextField,
            with: contentView.firstNameTextField,
            with: contentView.lastNameTextField,
            errorLabel: contentView.errorLabel,
            missingInformationCompletion: { [weak self] in
                self?.contentView.errorMessage(registerErrorModel.missingInformation)
            }, accountExistsCompletion: { [weak self] in
                self?.contentView.errorMessage(registerErrorModel.userAlreadyExists)
            }, passwordLessThanSixCompletion: { [weak self] in
                self?.contentView.errorMessage(registerErrorModel.passwordLessThanSix)
            }, completion: { [weak self] in
                self?.transitionToMessenger()
            })
    }
    
    func transitionToMessenger() {
        let messengerVC = MessengerViewController()
        self.present(messengerVC, animated: true)
    }
    
    private func resigningTextFields() {
        contentView.emailTextField.resignFirstResponder()
        contentView.passwordTextField.resignFirstResponder()
        contentView.firstNameTextField.resignFirstResponder()
        contentView.lastNameTextField.resignFirstResponder()
    }
    
    private func profileImageHereTappedSetup() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(profileImageHereTapped))
        contentView.fooLogoImageView.addGestureRecognizer(gesture)
        contentView.fooLogoImageView.isUserInteractionEnabled = true
    }
    
    @objc
    private func profileImageHereTapped() {
        presentPhotoActionSheet()
    }
}


extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == contentView.emailTextField {
            contentView.passwordTextField.becomeFirstResponder()
        } else if textField == contentView.passwordTextField {
            registerButtonTapped()
        }
        return true
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentCamera() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func presentPhotoLibrary() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: nil,
                                            message: nil,
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        actionSheet.addAction(UIAlertAction(title: "Take Photo",
                                            style: .default,
                                            handler: { [weak self] _ in    self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library",
                                            style: .default,
                                            handler: { [weak self] _ in self?.presentPhotoLibrary()
            
        }))
        present(actionSheet, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        picker.dismiss(animated: true)
        self.contentView.fooLogoImageView.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
