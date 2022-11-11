//
//  LoginErrorModel.swift
//  FooMessenger
//
//  Created by Hollis Kwan on 10/9/22.
//

import Foundation

struct LoginErrorModel {
    let missingParameters: String = "Missing Email or Password!\nPlease fill in fields."
    let wrongParameters: String = "Wrong Email or Password!\nPlease try again."
    let passwordLessThanSix: String = "Password must contain a minimum of 6 characters."
}
