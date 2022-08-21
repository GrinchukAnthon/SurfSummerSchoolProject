//
//  AuthorizationPasswordTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 21.08.2022.
//

import UIKit

final class AuthorizationPasswordTableViewCell: UITableViewCell {
    
//    MARK: - Views
    
    @IBOutlet private weak var authorizationConteinerView: UIView!
    @IBOutlet private weak var authorizationPasswordLabel: UILabel!
    @IBOutlet private weak var authorizationPasswordTextField: UITextField!
    @IBOutlet private weak var topTextFieldConstraint: NSLayoutConstraint!
    
    var passwordTextUpdated: ((_ text: String?) -> Void)?

    var iconClick = false
    let imageIcon = UIImageView()
    
//    MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperence()
    }
}

//    MARK: - Private Methods

private extension AuthorizationPasswordTableViewCell {
    
    func configureApperence() {
        selectionStyle = .none
        configureAuthorizationConteinerView()
        configureAuthorizationPasswordLabel()
        configurAauthorizationPasswordTextField()
    }
    func configureAuthorizationConteinerView() {
        authorizationConteinerView.backgroundColor = .surfWhiteForConteinerViewAutorizationScreen
        setupCorners(authorizationConteinerView)
    }
    func configureAuthorizationPasswordLabel() {
        authorizationPasswordLabel.text = "Пароль"
        authorizationPasswordLabel.font = .systemFont(ofSize: 12)
        authorizationPasswordLabel.textColor = .surfLidhtGreyForLabelAutorizationScreen
        authorizationPasswordLabel.isHidden = true
    }
    func configurAauthorizationPasswordTextField() {
        authorizationPasswordTextField.font = .systemFont(ofSize: 16, weight: .regular)
        authorizationPasswordTextField.borderStyle = .none
        authorizationPasswordTextField.placeholder = "Пароль"
        authorizationPasswordTextField.textContentType = .password
        authorizationPasswordTextField.isSecureTextEntry = true
        authorizationPasswordTextField.addTarget(
            self,
            action: #selector(authorizationLoginTextFieldDidAnimation),
            for: .allEditingEvents
        )
        configureShowPasswordButton()
    }
    func configureShowPasswordButton() {
        imageIcon.image = UIImage(assetIdentifier: .closedEye)
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(assetIdentifier: .closedEye).size.width, height: UIImage(assetIdentifier: .closedEye).size.height)
        imageIcon.frame = CGRect(x: -10, y: 0, width: UIImage(assetIdentifier: .closedEye).size.width, height: UIImage(assetIdentifier: .closedEye).size.height)
        authorizationPasswordTextField.rightView = contentView
        authorizationPasswordTextField.rightViewMode = .always
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tap:)))
        imageIcon.isUserInteractionEnabled = true
        imageIcon.addGestureRecognizer(tapGest)
    }
    @objc func authorizationLoginTextFieldDidAnimation() {
        guard !(authorizationPasswordTextField.text?.isEmpty ?? true) else { return }
        
        authorizationPasswordLabel.isHidden = authorizationPasswordTextField.text?.isEmpty ?? false
        authorizationPasswordTextField.placeholder = ""
        passwordTextUpdated?(authorizationPasswordTextField.text)
        
        UIView.animate(withDuration: 0) {
            self.topTextFieldConstraint.constant = 48
            self.layoutIfNeeded()
        }
    }
    @objc func imageTapped(tap: UITapGestureRecognizer) {
        let tappedImage = tap.view as! UIImageView
        
        if iconClick {
            iconClick = false
            tappedImage.image = UIImage(assetIdentifier: .openEye)
            authorizationPasswordTextField.isSecureTextEntry = false
        } else {
            iconClick = true
            tappedImage.image = UIImage(assetIdentifier: .closedEye)
            authorizationPasswordTextField.isSecureTextEntry = true
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
