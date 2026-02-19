//
//  TravelRouteController.swift
//  WeatherApp
//
//  Created by yekta on 17.02.2026.
//

import Foundation
import UIKit
import SwiftUI
import MapKit

class TravelRouteController: UIViewController, UISearchTextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .init(named: "DeepCharcoal")
        setupUI()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.overrideUserInterfaceStyle = .dark
        mapView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        return mapView
    }()
    
    private let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemThickMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.backgroundColor = .init(named: "DeepCharcoal")
        blurView.layer.cornerRadius = 10
        blurView.clipsToBounds = true
        return blurView
    }()
    
    private let startTextField: UISearchTextField = {
        let textField = UISearchTextField()
        textField.placeholder = NSLocalizedString("START", comment: "Başlangıç:")
        textField.textAlignment = .left
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        return textField
    }()
    
    private let arrivalTextField: UISearchTextField = {
        let textField = UISearchTextField()
        textField.placeholder = NSLocalizedString("ARRIVAL", comment: "Varış:")
        textField.textAlignment = .left
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        return textField
    }()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func dismissKeyboard(){
        view.endEditing(true)
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .darkGray
        scrollView.layer.cornerRadius = 20
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        return stackView
    }()
    
    private let alertWeatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "exclamationmark.circle")
        return imageView
    }()
    
    private let alertWeatherView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private let alertWeatherLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("WEATHER_ALERT", comment: "Hava Alarmı")
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private func setupUI() {
        view.addSubview(mapView)
        view.addSubview(blurView)
        view.addSubview(startTextField)
        view.addSubview(arrivalTextField)
        view.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        scrollView.addSubview(alertWeatherImage)
        scrollView.addSubview(alertWeatherView)
        scrollView.addSubview(alertWeatherLabel)
        
        startTextField.delegate = self
        arrivalTextField.delegate = self
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        blurView.translatesAutoresizingMaskIntoConstraints = false
        startTextField.translatesAutoresizingMaskIntoConstraints = false
        arrivalTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        alertWeatherImage.translatesAutoresizingMaskIntoConstraints = false
        alertWeatherView.translatesAutoresizingMaskIntoConstraints = false
        alertWeatherLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
            
            blurView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            blurView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            blurView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            blurView.bottomAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.topAnchor, constant: 120),
            
            startTextField.topAnchor.constraint(equalTo: blurView.safeAreaLayoutGuide.topAnchor, constant: 10),
            startTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            startTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            startTextField.bottomAnchor.constraint(equalTo: blurView.safeAreaLayoutGuide.topAnchor, constant: 40),
            
            arrivalTextField.topAnchor.constraint(equalTo: startTextField.safeAreaLayoutGuide.topAnchor, constant: 45),
            arrivalTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            arrivalTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            arrivalTextField.bottomAnchor.constraint(equalTo: blurView.safeAreaLayoutGuide.topAnchor, constant: 85),
            
            scrollView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -25),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            // Sadece YATAY kaydırmayı kapatıp DİKEY kaydırma yapmak için genişliği sabitliyoruz
            contentStackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            alertWeatherView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 30),
            alertWeatherView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            alertWeatherView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            alertWeatherView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
        ])
    }
    
}

#Preview {
    TravelRouteController()
}
