//
//  SearchView.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 17.08.2022.
//

import UIKit

final class SearchView: UIView {
    
    var textFieldChanged: ((_ text: String?) -> Void)?
    
    private lazy var containverView = UIView()
    private lazy var searchIcon = UIImageView()
    private lazy var textField = UITextField()
    private lazy var clearButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        containverView.backgroundColor = .surfLightGrey
        containverView.layer.cornerRadius = 16
    }
    
    private func setupViews() {
        setupSearchIcon()
        setupTextField()
        setupClearButton()
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
        addSubview(containverView)
        containverView.addSubview(searchIcon)
        containverView.addSubview(textField)
        containverView.addSubview(clearButton)
        
        containverView.translatesAutoresizingMaskIntoConstraints = false
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containverView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containverView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containverView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            containverView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            searchIcon.leadingAnchor.constraint(equalTo: containverView.leadingAnchor, constant: 10),
            searchIcon.topAnchor.constraint(equalTo: containverView.topAnchor, constant: 7),
            searchIcon.bottomAnchor.constraint(equalTo: containverView.bottomAnchor, constant: -7),
            searchIcon.widthAnchor.constraint(equalToConstant: 18),
            searchIcon.heightAnchor.constraint(equalToConstant: 18),
            
            textField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: clearButton.leadingAnchor, constant: -10),
            textField.topAnchor.constraint(equalTo: containverView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: containverView.bottomAnchor),
            
            clearButton.trailingAnchor.constraint(equalTo: containverView.trailingAnchor, constant: -10),
            clearButton.topAnchor.constraint(equalTo: containverView.topAnchor, constant: 7),
            clearButton.bottomAnchor.constraint(equalTo: containverView.bottomAnchor, constant: -7),
            clearButton.widthAnchor.constraint(equalToConstant: 18),
            clearButton.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
}
