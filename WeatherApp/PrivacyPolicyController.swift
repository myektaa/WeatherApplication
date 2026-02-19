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
        
        self.view.backgroundColor = .init(named: "DeepCharcoal")
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
    
    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "multiply")!
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func dismissTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    private func setupUI() {
        view.addSubview(dismissButton)
        view.addSubview(privacyPolicyTitle)
        view.addSubview(privacyPolicyDescription)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        privacyPolicyTitle.translatesAutoresizingMaskIntoConstraints = false
        privacyPolicyDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dismissButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: 100),
            dismissButton.heightAnchor.constraint(equalToConstant: 30),
            dismissButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120),
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
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
