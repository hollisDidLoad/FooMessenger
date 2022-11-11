//
//  GradientRegisterButton.swift
//  FooMessenger
//
//  Created by Hollis Kwan on 10/9/22.
//

import Foundation
import UIKit

class GradientRegisterButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [
            UIColor.systemYellow.cgColor,
            UIColor.systemPink.cgColor,
            UIColor.systemRed.cgColor,
            UIColor.systemOrange.cgColor,
            UIColor.systemPink.cgColor ]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = 25
        layer.insertSublayer(l, at: 0)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle("Register", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return l
    }()
}
