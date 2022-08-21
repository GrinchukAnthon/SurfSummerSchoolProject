//
//  AuthorizationLoginTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 21.08.2022.
//

import UIKit

final class AuthorizationLoginTableViewCell: UITableViewCell {
    
//    MARK: - Views
    
    @IBOutlet private weak var authorizationConteinerView: UIView!
    @IBOutlet private weak var authorizationLoginLabel: UILabel!
    @IBOutlet private weak var authorizationLoginTextField: UITextField!
    @IBOutlet private weak var topTextFieldConstraint: NSLayoutConstraint!

    
//    MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperence()
    }
}

//    MARK: - Private Methods

private extension AuthorizationLoginTableViewCell {
    
    func configureApperence() {
        selectionStyle = .none
        configureAuthorizationConteinerView()
        configureAuthorizationLoginLabel()
        configurAauthorizationLoginTextField()
    }
    func configureAuthorizationConteinerView() {
        authorizationConteinerView.backgroundColor = .surfWhiteForConteinerViewAutorizationScreen
        setupCorners(authorizationConteinerView)
    }
    func configureAuthorizationLoginLabel() {
        authorizationLoginLabel.text = "Логин"
        authorizationLoginLabel.font = .systemFont(ofSize: 12)
        authorizationLoginLabel.textColor = .surfLidhtGreyForLabelAutorizationScreen
        authorizationLoginLabel.isHidden = true
    }
    func configurAauthorizationLoginTextField() {
        authorizationLoginTextField.font = .systemFont(ofSize: 16, weight: .regular)
        authorizationLoginTextField.borderStyle = .none
        authorizationLoginTextField.placeholder = "Логин"
        authorizationLoginTextField.keyboardType = .numberPad
        authorizationLoginTextField.addTarget(
            self,
            action: #selector(authorizationLoginTextFieldDidAnimation),
            for: .allEditingEvents
        )
        authorizationLoginTextField.delegate = self
    }
    @objc func authorizationLoginTextFieldDidAnimation() {
        guard !(authorizationLoginTextField.text?.isEmpty ?? true) else { return }
        
        authorizationLoginLabel.isHidden = authorizationLoginTextField.text?.isEmpty ?? false
        authorizationLoginTextField.placeholder = ""
        
        UIView.animate(withDuration: 0) {
            self.topTextFieldConstraint.constant = 48
            self.layoutIfNeeded()
        }
    }
    func setupCorners(_ view: UIView) {
        let corners = UIRectCorner(
            arrayLiteral: [
                UIRectCorner.topRight,
                UIRectCorner.topLeft
            ]
        )
        let cornerSize = CGSize(width: 10, height: 10)
        let maskPath = UIBezierPath(
            roundedRect: view.bounds,
            byRoundingCorners: corners,
            cornerRadii: cornerSize
        )
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        view.layer.mask = maskLayer
    }
}
