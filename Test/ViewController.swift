//
//  ViewController.swift
//  Test
//
//  Created by Head HandH on 28.01.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(named: "Colors/white")
        
        view.addSubview(logoImageView)
        view.addSubview(containerView)
        view.addSubview(containerButton)
        
        NSLayoutConstraint.activate(
            [
                logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                logoImageView.topAnchor.constraint(equalTo: view.topAnchor),
                
                containerView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
                containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Margin.horizontal),
                containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Margin.horizontal),
                
                phoneContainer.heightAnchor.constraint(equalToConstant: 56),
                
                containerButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 272),
                containerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ]
        )
        
    }
    
    enum Constants {
        enum Margin {
            static let horizontal: CGFloat = 30
        }
        
        static let paddingX: CGFloat = 16
        static let paddingY: CGFloat = 64
        static let space: CGFloat = 20
        static let UIComponentHeight: CGFloat = 50
    }
    
    private var containerViewSubviews: [UIView] {
        [
            titleLabel,
            phoneContainer,
            loginButton
        ]
    }
    
    private var containerButtonSubviews: [UIView] {
        [
            appleButton,
            VKButton,
            classButton,
            facebookButton
        ]
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = .brown
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var containerView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: containerViewSubviews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 30
        return stackView
    }()
    
    lazy var containerButton: UIStackView = {
        let buttonStackView = UIStackView(arrangedSubviews: containerButtonSubviews)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fill
        buttonStackView.alignment = .fill
        buttonStackView.spacing = 12
        return buttonStackView
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Auth/Logo")
        return imageView
    } ()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .init(rawValue: 800))
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "ВХОД ИЛИ \nРЕГИСТРАЦИЯ"
        return label
    }()
    
    lazy var phoneContainer: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Colors/textField")
        view.layer.cornerRadius = 8
        view.attributedPlaceholder = NSAttributedString (string: "Номер телефона", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(named: "Colors/phoneNumber")])
        view.delegate = self
        return view
    }()
    
    
    lazy var loginButton: UIButton  = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "Colors/blue")
        button.setTitle("Получить код", for: .normal)
        button.setTitleColor(UIColor(named: "Colors/white"), for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        return button
    }()
    
    lazy var appleButton: UIButton = {
        let appleButton = UIButton()
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        appleButton.setImage(UIImage(named: "Auth/appleButton"), for: .normal)
        return appleButton
    }()
    
    lazy var VKButton: UIButton = {
        let vkButton = UIButton()
        vkButton.translatesAutoresizingMaskIntoConstraints = false
        vkButton.setImage(UIImage(named: "Auth/VKButton"), for: .normal)
        return vkButton
    }()
    
    lazy var classButton: UIButton = {
        let classButton = UIButton()
        classButton.translatesAutoresizingMaskIntoConstraints = false
        classButton.setImage(UIImage(named: "Auth/classButton"), for: .normal)
        return classButton
    }()
    
    lazy var facebookButton: UIButton = {
        let facebookButton = UIButton()
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.setImage(UIImage(named: "Auth/facebookButton"), for: .normal)
        return facebookButton
    }()
    
    /*private let maxNumberCount = 11
    private let regex = try! NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
    
    private func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else { return "+" }
            
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: [], range: range, withTemplate: "")
            
        if number.count > maxNumberCount {
                let maxIndex = number.index(number.startIndex, offsetBy: maxNumberCount)
                number = String(number[number.startIndex..<maxIndex])
        }
            
        if shouldRemoveLastDigit {
                let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
                number = String(number[number.startIndex..<maxIndex])
        }
            
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex..<maxIndex
            
        if number.count < 7 {
        
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3", options: .regularExpression, range: regRange)
            } else {
                let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
                number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3-$4-$5", options: .regularExpression, range: regRange)
            }
            
            return "+" + number
        }*/
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }
        
       /* let fullString = (textField.text ?? "") + string
        textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)*/

        return true
    }
    
}
