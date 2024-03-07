//
//  MyCardView.swift
//  bankApp
//
//  Created by Zhamilia Zhanakeeva on 5/3/24.
//

import UIKit
class MyCardView: UIView {
    private let fromLabel = MakerView().makerLabel(text: "С карты", textColor: .darkGray)
    private let userCardImage = MakerView().makerImageView()
    private let stack = MakerView().makerStack(axis: .vertical, alignment: .leading)
    private let userCardName = MakerView().makerLabel(text: "")
    private let userCardNumber = MakerView().makerLabel(text: "", textColor: .darkGray)
    var initialUserAmount: Double = 0.0
    let userAmount = MakerView().makerLabel(text: "")
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureCard(name: String, number: String, amount: Double, image: UIImage?) {
        userCardName.text = name
        userCardNumber.text = number
        initialUserAmount = amount
        userAmount.text = "\(amount) KGS"
        userCardImage.image = image
    }
    
    private func setupUI() {
        addSubview(fromLabel)
        NSLayoutConstraint.activate([
            fromLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            fromLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        addSubview(userCardImage)
        NSLayoutConstraint.activate([
            userCardImage.topAnchor.constraint(equalTo: fromLabel.bottomAnchor, constant: 5),
            userCardImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userCardImage.heightAnchor.constraint(equalToConstant: 50),
            userCardImage.widthAnchor.constraint(equalToConstant: 70)
        ])
        addSubview(userAmount)
        NSLayoutConstraint.activate([
            userAmount.centerYAnchor.constraint(equalTo: userCardImage.centerYAnchor),
            userAmount.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            userAmount.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: userCardImage.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: userCardImage.trailingAnchor, constant: 10),
            stack.heightAnchor.constraint(equalToConstant: 50),
            stack.trailingAnchor.constraint(equalTo: userAmount.leadingAnchor, constant: 3)
        ])
        stack.addArrangedSubview(userCardName)
        stack.addArrangedSubview(userCardNumber)
    }
}
