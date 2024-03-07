//
//  ViewController.swift
//  bankApp
//
//  Created by Zhamilia Zhanakeeva on 5/3/24.
//

import UIKit

class TransfersViewController: UIViewController {
    private let visaImage = MakerView().makerImageView(image: UIImage(systemName: "creditcard.circle"))
    private let visaButton = MakerView().makerButton(title: "Переводы с VISA на VISA", backgroundColor: .systemBlue)
    private let elcartImage = MakerView().makerImageView(image: UIImage(systemName: "mountain.2.circle"))
    private let elcartButton = MakerView().makerButton(title: "Переводы на Элкарт", backgroundColor: .systemBlue)
    private let swiftImage = MakerView().makerImageView(image: UIImage(systemName: "globe"))
    private let swiftButton = MakerView().makerButton(title: "SWIFT переводы", backgroundColor: .systemBlue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Переводы"
        view.backgroundColor = .white
        setupUI()
        visaButton.addTarget(self, action: #selector(visaButtonTapped), for: .touchUpInside)
        elcartButton.addTarget(self, action: #selector(elcartButtonTapped), for: .touchUpInside)
        swiftButton.addTarget(self, action: #selector(swiftButtonTapped), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.addSubview(elcartImage)
        NSLayoutConstraint.activate([
            elcartImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            elcartImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            elcartImage.heightAnchor.constraint(equalToConstant: 50),
            elcartImage.widthAnchor.constraint(equalToConstant: 50)
        ])
        view.addSubview(elcartButton)
        NSLayoutConstraint.activate([
            elcartButton.centerYAnchor.constraint(equalTo: elcartImage.centerYAnchor),
            elcartButton.leadingAnchor.constraint(equalTo: elcartImage.trailingAnchor, constant: 3),
            elcartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            elcartButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        view.addSubview(visaImage)
        NSLayoutConstraint.activate([
            visaImage.bottomAnchor.constraint(equalTo: elcartImage.topAnchor, constant: -30),
            visaImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            visaImage.heightAnchor.constraint(equalToConstant: 50),
            visaImage.widthAnchor.constraint(equalToConstant: 50)
        ])
        view.addSubview(visaButton)
        NSLayoutConstraint.activate([
            visaButton.centerYAnchor.constraint(equalTo: visaImage.centerYAnchor),
            visaButton.leadingAnchor.constraint(equalTo: visaImage.trailingAnchor, constant: 3),
            visaButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            visaButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        view.addSubview(swiftImage)
        NSLayoutConstraint.activate([
            swiftImage.topAnchor.constraint(equalTo: elcartImage.bottomAnchor, constant: 30),
            swiftImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            swiftImage.heightAnchor.constraint(equalToConstant: 50),
            swiftImage.widthAnchor.constraint(equalToConstant: 50)
        ])
        view.addSubview(swiftButton)
        NSLayoutConstraint.activate([
            swiftButton.centerYAnchor.constraint(equalTo: swiftImage.centerYAnchor),
            swiftButton.leadingAnchor.constraint(equalTo: swiftImage.trailingAnchor, constant: 3),
            swiftButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            swiftButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func visaButtonTapped() {
        let vc = VisatoVisaTransferViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func elcartButtonTapped() {
        let vc = ElcartToElcartTransferViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func swiftButtonTapped() {
        let vc = SwiftTransferViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
