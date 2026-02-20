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
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        return stackView
    }()
    
    private let alertWeatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "sungerBob")
        return imageView
    }()
    
    private let alertWeatherView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private let alertWeatherLabelTitle: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("WEATHER_ALERT_TITLE", comment: "Hava Alarmı Başlığı")
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let alertWeatherLabelDescription: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("WEATHER_ALERT_DESCRIPTION", comment: "Hava Alarmı Açıklaması")
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let alertWeatherImage2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "sungerBob")
        return imageView
    }()
    
    private let alertWeatherView2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private let alertWeatherLabelTitle2: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("WEATHER_ALERT_TITLE", comment: "Hava Alarmı Başlığı")
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let alertWeatherLabelDescription2: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("WEATHER_ALERT_DESCRIPTION", comment: "Hava Alarmı Açıklaması")
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let alertWeatherImage3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "sungerBob")
        return imageView
    }()
    
    private let alertWeatherView3: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private let alertWeatherLabelTitle3: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("WEATHER_ALERT_TITLE", comment: "Hava Alarmı Başlığı")
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let alertWeatherLabelDescription3: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("WEATHER_ALERT_DESCRIPTION", comment: "Hava Alarmı Açıklaması")
        label.textColor = .black
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
        
        contentStackView.addArrangedSubview(alertWeatherView)
        alertWeatherView.addSubview(alertWeatherImage)
        alertWeatherView.addSubview(alertWeatherLabelTitle)
        alertWeatherView.addSubview(alertWeatherLabelDescription)
        
        contentStackView.addArrangedSubview(alertWeatherView2)
        alertWeatherView2.addSubview(alertWeatherImage2)
        alertWeatherView2.addSubview(alertWeatherLabelTitle2)
        alertWeatherView2.addSubview(alertWeatherLabelDescription2)
        
        contentStackView.addArrangedSubview(alertWeatherView3)
        alertWeatherView3.addSubview(alertWeatherImage3)
        alertWeatherView3.addSubview(alertWeatherLabelTitle3)
        alertWeatherView3.addSubview(alertWeatherLabelDescription3)
        
        
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
        alertWeatherLabelTitle.translatesAutoresizingMaskIntoConstraints = false
        alertWeatherLabelDescription.translatesAutoresizingMaskIntoConstraints = false
        
        alertWeatherImage2.translatesAutoresizingMaskIntoConstraints = false
        alertWeatherView2.translatesAutoresizingMaskIntoConstraints = false
        alertWeatherLabelTitle2.translatesAutoresizingMaskIntoConstraints = false
        alertWeatherLabelDescription2.translatesAutoresizingMaskIntoConstraints = false
        
        alertWeatherImage3.translatesAutoresizingMaskIntoConstraints = false
        alertWeatherView3.translatesAutoresizingMaskIntoConstraints = false
        alertWeatherLabelTitle3.translatesAutoresizingMaskIntoConstraints = false
        alertWeatherLabelDescription3.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            alertWeatherView.heightAnchor.constraint(equalToConstant: 70),
            
            alertWeatherImage.topAnchor.constraint(equalTo: alertWeatherView.topAnchor, constant: 10),
            alertWeatherImage.leadingAnchor.constraint(equalTo: alertWeatherView.leadingAnchor, constant: 10),
            alertWeatherImage.widthAnchor.constraint(equalToConstant: 50),
            alertWeatherImage.heightAnchor.constraint(equalToConstant: 50),
            
            alertWeatherLabelTitle.topAnchor.constraint(equalTo: alertWeatherView.topAnchor, constant: 10),
            alertWeatherLabelTitle.leadingAnchor.constraint(equalTo: alertWeatherImage.trailingAnchor, constant: 10),
            
            alertWeatherLabelDescription.topAnchor.constraint(equalTo: alertWeatherLabelTitle.bottomAnchor, constant: 5),
            alertWeatherLabelDescription.leadingAnchor.constraint(equalTo: alertWeatherImage.trailingAnchor, constant: -15),
            alertWeatherLabelDescription.trailingAnchor.constraint(equalTo: alertWeatherView.trailingAnchor, constant: -10),
            
            alertWeatherView2.heightAnchor.constraint(equalToConstant: 70),
            
            alertWeatherImage2.topAnchor.constraint(equalTo: alertWeatherView2.topAnchor, constant: 10),
            alertWeatherImage2.leadingAnchor.constraint(equalTo: alertWeatherView2.leadingAnchor, constant: 10),
            alertWeatherImage2.widthAnchor.constraint(equalToConstant: 50),
            alertWeatherImage2.heightAnchor.constraint(equalToConstant: 50),
            
            alertWeatherLabelTitle2.topAnchor.constraint(equalTo: alertWeatherView2.topAnchor, constant: 10),
            alertWeatherLabelTitle2.leadingAnchor.constraint(equalTo: alertWeatherImage2.trailingAnchor, constant: 10),
            
            alertWeatherLabelDescription2.topAnchor.constraint(equalTo: alertWeatherLabelTitle2.bottomAnchor, constant: 5),
            alertWeatherLabelDescription2.leadingAnchor.constraint(equalTo: alertWeatherImage2.trailingAnchor, constant: -15),
            alertWeatherLabelDescription2.trailingAnchor.constraint(equalTo: alertWeatherView2.trailingAnchor, constant: -10),
            
            alertWeatherView3.heightAnchor.constraint(equalToConstant: 70),
            
            alertWeatherImage3.topAnchor.constraint(equalTo: alertWeatherView3.topAnchor, constant: 10),
            alertWeatherImage3.leadingAnchor.constraint(equalTo: alertWeatherView3.leadingAnchor, constant: 10),
            alertWeatherImage3.widthAnchor.constraint(equalToConstant: 50),
            alertWeatherImage3.heightAnchor.constraint(equalToConstant: 50),
            
            alertWeatherLabelTitle3.topAnchor.constraint(equalTo: alertWeatherView3.topAnchor, constant: 10),
            alertWeatherLabelTitle3.leadingAnchor.constraint(equalTo: alertWeatherImage3.trailingAnchor, constant: 10),
            
            alertWeatherLabelDescription3.topAnchor.constraint(equalTo: alertWeatherLabelTitle3.bottomAnchor, constant: 5),
            alertWeatherLabelDescription3.leadingAnchor.constraint(equalTo: alertWeatherImage3.trailingAnchor, constant: -15),
            alertWeatherLabelDescription3.trailingAnchor.constraint(equalTo: alertWeatherView3.trailingAnchor, constant: -10)
        ])
    }
    
}

#Preview {
    TravelRouteController()
}
