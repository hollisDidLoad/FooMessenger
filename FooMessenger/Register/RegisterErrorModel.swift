//
//  RegisterErrorModel.swift
//  FooMessenger
//
//  Created by Hollis Kwan on 10/9/22.
//

import Foundation

struct RegisterErrorModel {
    let missingInformation: String = "Missing Information!\n Please fill in fields"
    let userAlreadyExists: String = "Email Already Exist!\nPlease Try Another Email"
    let passwordLessThanSix: String = "Password must contain a minimum of 6 characters."
}
