//
//  MessengerViewController.swift
//  FooMessenger
//
//  Created by Hollis Kwan on 10/9/22.
//

import Foundation
import UIKit

class MessengerViewController: UIViewController {
    
    let contentView = MessengerView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let loggedIn = UserDefaults.standard.bool(forKey: "loggedIn")
        
        if !loggedIn {
            let loginVc = LoginViewController()
            loginVc.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(loginVc, animated: false)
        }
    }
    
    private func navSetup() {
        title = "Messenger"
    }
}
