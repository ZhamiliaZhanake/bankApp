//
//  ElcarttoElcartTransferViewController.swift
//  bankApp
//
//  Created by Zhamilia Zhanakeeva on 5/3/24.
//


import UIKit

class ElcartToElcartTransferViewController: UIViewController, TransferValidation {
    private let whereToLabel = MakerView().makerLabel(text: "Куда", textColor: .darkGray)
    private let sendingCardNumberTF = MakerView().makerTextField(placeholder: "0000 0000 0000 0000")
    private let sendingAmountTF = MakerView().makerTextField(placeholder: "Cумма")
    private let sendMoneyButton = MakerView().makerButton(title: "Перевести", backgroundColor: .lightGray)
    let myCardView: MyCardView = {
        let view = MyCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.configureCard(name: "Elcart", number: "****1234", amount: 1500.0, image: UIImage(named: "elcart"))
        return view
    }()
    private let elcartInfoLabel = MakerView().makerLabel(text: "Информация о карте", textColor: .darkGray)
    private let elcartStatusLabel = MakerView().makerLabel(text: "Статус: Активна", textColor: .darkGray)
    
    override func viewDidLoad() {
        navigationItem.title = "Переводы на Элкарт"
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
        sendMoneyButton.addTarget(self, action: #selector(sendMoneyButtonTapped), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.addSubview(myCardView)
        NSLayoutConstraint.activate([
            myCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            myCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myCardView.heightAnchor.constraint(equalToConstant: 120)
        ])
        view.addSubview(whereToLabel)
        NSLayoutConstraint.activate([
            whereToLabel.topAnchor.constraint(equalTo: myCardView.bottomAnchor, constant: 30),
            whereToLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        view.addSubview(sendingCardNumberTF)
        NSLayoutConstraint.activate([
            sendingCardNumberTF.topAnchor.constraint(equalTo: whereToLabel.bottomAnchor, constant: 3),
            sendingCardNumberTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sendingCardNumberTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sendingCardNumberTF.heightAnchor.constraint(equalToConstant: 50)
        ])
        view.addSubview(sendingAmountTF)
        NSLayoutConstraint.activate([
            sendingAmountTF.topAnchor.constraint(equalTo: sendingCardNumberTF.bottomAnchor, constant: 3),
            sendingAmountTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sendingAmountTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sendingAmountTF.heightAnchor.constraint(equalToConstant: 50)
        ])
        view.addSubview(sendMoneyButton)
        NSLayoutConstraint.activate([
            sendMoneyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            sendMoneyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendMoneyButton.heightAnchor.constraint(equalToConstant: 50),
            sendMoneyButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        view.addSubview(elcartInfoLabel)
        NSLayoutConstraint.activate([
            elcartInfoLabel.topAnchor.constraint(equalTo: sendingAmountTF.bottomAnchor, constant: 20),
            elcartInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        view.addSubview(elcartStatusLabel)
        NSLayoutConstraint.activate([
            elcartStatusLabel.topAnchor.constraint(equalTo: elcartInfoLabel.bottomAnchor, constant: 5),
            elcartStatusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    @objc func sendMoneyButtonTapped() {
        guard
            let cardNumber = sendingCardNumberTF.text,
            let amountText = sendingAmountTF.text,
            let amount = Double(amountText),
            isValidSendingCardNumber(cardNumber)
        else {
            return
        }
        
        let isValidAmount = isValidSendingAmount(amount, userAmount: myCardView.initialUserAmount)
        sendMoneyButton.isEnabled = isValidAmount
        
        if isValidAmount {
            showSuccessAlert()
            sendMoneyButton.backgroundColor = .systemBlue
        } else {
            if amount < 20 {
                sendingAmountTF.text = "Минимальная сумма - 20"
            } else {
                sendingAmountTF.text = "Недостаточно средств!"
            }
            sendingAmountTF.textColor = .red
            sendingAmountTF.layer.borderColor = UIColor.red.cgColor
            sendingAmountTF.layer.borderWidth = 1.0
        }
    }
    
    private func showSuccessAlert() {
        let alert = UIAlertController(title: "Перевод успешно выполнен", message: "Операция прошла успешно!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in }))
        present(alert, animated: true, completion: nil)
    }
}
