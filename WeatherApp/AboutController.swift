//
//  AboutController.swift
//  WeatherApp
//
//  Created by yekta on 18.02.2026.
//

import Foundation
import UIKit

class AboutController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .init(named: "DeepCharcoal")
        setupUI()
    }
    
    private let aboutTitle: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("ABOUT_US", comment: "Hakkımızda")
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let aboutTitle2: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("ABOUT_US_TITLE", comment: "Hakkımızda Başlığı")
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let aboutText: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("ABOUT_US_TEXT", comment: "Hakkında Metni")
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
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
        view.addSubview(aboutTitle)
        view.addSubview(aboutText)
        view.addSubview(aboutTitle2)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        aboutTitle.translatesAutoresizingMaskIntoConstraints = false
        aboutText.translatesAutoresizingMaskIntoConstraints = false
        aboutTitle2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dismissButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: 100),
            dismissButton.heightAnchor.constraint(equalToConstant: 30),
            dismissButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120),
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            aboutTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            aboutTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            aboutTitle2.topAnchor.constraint(equalTo: aboutTitle.bottomAnchor, constant: 20),
            aboutTitle2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            aboutText.topAnchor.constraint(equalTo: aboutTitle.bottomAnchor, constant: 65),
            aboutText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            aboutText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            
        ])
    }
    
}

#Preview {
    AboutController()
}
