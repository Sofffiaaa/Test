//
//  MaterialTextField.swift
//  Test
//
//  Created by Head HandH on 15.03.2023.
//

import Foundation
import UIKit

class MaterialTextField: UIView {
    
    enum State {
        case `default`
        case active
        case error(message: String)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        addSubview(textField)
        addSubview(placeholderLabel)
        addSubview(separatorView)
        addSubview(errorLabel)
        
    }

    required init?(coder: NSCoder){
        fatalError("init(coder)")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textField.frame = textFieldFrame(state: state)
        placeholderLabel.frame = placeholderLabelFrame(state: state)
        separatorView.frame = separstorViewFrame(state: state)
        errorLabel.frame = errorLabelFrame(state: state)
        
        if bounds.height != errorLabel.frame.maxY{
            invalidateIntrinsicContentSize()
        }
        
    }
    
    override var intrinsicContentSize: CGSize {
        .init(width: UIView.noIntrinsicMetric, height: errorLabel.frame.maxY)
    }
    
    private enum Constants {
        static let textFieldHeight: CGFloat = 50
        static let separatorHeight: CGFloat = 1
    }
    
    func textFieldFrame(state: State) -> CGRect {
        .init(origin: .zero,
              size: .init(width: bounds.width,
                          height: Constants.textFieldHeight
                         )
             )
    }
    
    func placeholderLabelFrame(state: State) -> CGRect {
        
        
        .zero
    }
    
    func separstorViewFrame(state: State) -> CGRect {
        .init(x: 0,
              y: textFieldFrame(state: state).maxY,
              width: bounds.width,
              height: Constants.separatorHeight
        )
    }
    
    func errorLabelFrame(state: State) -> CGRect {
        
        let size = errorLabel.sizeThatFits(.init(width: bounds.width, height: 0))
        
        return .init(
            x: 0,
            y: Constants.textFieldHeight + Constants.separatorHeight,
            width: bounds.width,
            height: size.height
        )
    }
    
    private(set) var state: State = .default
    
    func update(state: State, animated: Bool) {
        UIView.animate(withDuration: animated ? 0.3 : 0) {
            self.update(state: state)
            self.layoutIfNeeded()
            self.superview?.layoutIfNeeded()
        }
    }
    
    private func update(state: State){
        self.state = state
        
        switch state {
        case .`default`:
            separatorView.backgroundColor = .lightGray
            errorLabel.text = nil
            errorLabel.alpha = 0
            errorLabel.transform = .init(translationX: 0, y: -21)
        case .active:
            separatorView.backgroundColor = .blue
            errorLabel.text = nil
            errorLabel.alpha = 0
            errorLabel.transform = .init(translationX: 0, y: -21)
        case .error(let message):
            separatorView.backgroundColor = .red
            errorLabel.text = message
            errorLabel.alpha = 1
        }
    
        setNeedsLayout()
    }
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private lazy var placeholderLabel: UILabel = {
        let placeholderLabel = UILabel()
        textField.backgroundColor = .yellow
        return placeholderLabel
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .red
        return separatorView
    }()
    
    private lazy var errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.numberOfLines = 0
        errorLabel.backgroundColor = .orange
        return errorLabel
    }()
    
    
}


