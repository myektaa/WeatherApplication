//
//  PrivacyPolicyController.swift
//  WeatherApp
//
//  Created by yekta on 18.02.2026.
//

import Foundation
import UIKit

class PrivacyPolicyController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private let privacyPolicyTitle: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("PRIVACY_POLICY_TEXT", comment: "Gizlilik Politikamız")
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let privacyPolicyDescription: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("PRIVACY_POLICY_DESCRIPTION", comment: "Gizlilik Politikamızın Metni")
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private func setupUI() {
        view.addSubview(privacyPolicyTitle)
        view.addSubview(privacyPolicyDescription)
        
        privacyPolicyTitle.translatesAutoresizingMaskIntoConstraints = false
        privacyPolicyDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            privacyPolicyTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            privacyPolicyTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            privacyPolicyDescription.topAnchor.constraint(equalTo: privacyPolicyTitle.bottomAnchor, constant: 20),
            privacyPolicyDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            privacyPolicyDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
            ])
    }
}

#Preview {
    PrivacyPolicyController()
}
