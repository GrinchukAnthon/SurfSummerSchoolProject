//
//  SearchView.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 17.08.2022.
//

import UIKit

final class SearchView: UIView {
    
    var textFieldChanged: ((_ text: String?) -> Void)?
    
    private lazy var containerView = UIView()
    private lazy var searchIcon = UIImageView()
    private lazy var textField = UITextField()
    private lazy var clearButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        setupContainerView()
        setupSearchIcon()
        setupTextField()
        setupClearButton()
    }
    
    private func setupContainerView() {
        containerView.backgroundColor = .surfLightGrey
        containerView.layer.cornerRadius = 16
    }
    
    private func setupSearchIcon() {
        searchIcon.image = UIImage(assetIdentifier: .searchTextField)
        searchIcon.contentMode = .scaleAspectFit
    }
    
    private func setupTextField() {
        textField.backgroundColor = .surfLightGrey
        textField.tintColor = .black
        textField.borderStyle = .none
        textField.font = .systemFont(ofSize: 14)
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .allEditingEvents)
    }
    
    private func setupClearButton() {
        clearButton.setImage(
            UIImage(assetIdentifier: .searchCancel).withRenderingMode(.alwaysTemplate),
            for: .normal
        )
        clearButton.tintColor = .surfGrey
        clearButton.contentMode = .scaleAspectFit
        clearButton.isHidden = true
        clearButton.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
    }
    
    @objc private func textFieldDidChange() {
        guard !(textField.text?.isEmpty ?? true) else { return }
        clearButton.isHidden = textField.text?.isEmpty ?? true
        textFieldChanged?(textField.text)
    }
    
    @objc private func clearTextField() {
        textField.text = nil
        clearButton.isHidden = true
        textField.resignFirstResponder()
    }
    
    private func setupLayout() {
        addSubview(containerView)
        containerView.addSubview(searchIcon)
        containerView.addSubview(textField)
        containerView.addSubview(clearButton)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            searchIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            searchIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 7),
            searchIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -7),
            searchIcon.widthAnchor.constraint(equalToConstant: 18),
            searchIcon.heightAnchor.constraint(equalToConstant: 18),
            
            textField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: clearButton.leadingAnchor, constant: -10),
            textField.topAnchor.constraint(equalTo: containerView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            clearButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            clearButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 7),
            clearButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -7),
            clearButton.widthAnchor.constraint(equalToConstant: 18),
            clearButton.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
}
