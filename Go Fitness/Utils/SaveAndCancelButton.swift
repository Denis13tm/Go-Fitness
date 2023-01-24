//
//  SaveAndCancelButton.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 24/01/2023.
//

import UIKit

final class SaveAndCancelButton: UIView {
    var delegate: SaveAndCancelButtonsDelegate?
    private let stackView = UIStackView()
    private let cancelButton = UIButton()
    private let saveButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupStackView()
        setupCancelBtn()
        setupSaveBtn()
    }
    
    private func setupStackView() {
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let top = stackView.topAnchor.constraint(equalTo: topAnchor)
        let leading = stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailing = stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottom = stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        NSLayoutConstraint.activate([top, leading, trailing, bottom])
        
        stackView.distribution = .fillEqually
    }
    
    private func setupCancelBtn() {
        stackView.addArrangedSubview(cancelButton)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 26)
        cancelButton.addTarget(self, action: #selector(cancelBtnAction), for: .touchUpInside)
    }
    
    private func setupSaveBtn() {
        stackView.addArrangedSubview(saveButton)
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.green, for: .normal)
        saveButton.titleLabel?.font = .boldSystemFont(ofSize: 26)
        saveButton.addTarget(self, action: #selector(saveBtnAction), for: .touchUpInside)
    }
    
    //MARK: - Actions
    
    @objc private func cancelBtnAction() {
        if let delegate = delegate {
            delegate.onCancel()
        }
    }
    
    @objc private func saveBtnAction() {
        if let delegate = delegate {
            delegate.onSave()
        }
    }
    
}

protocol SaveAndCancelButtonsDelegate {
    func onCancel()
    func onSave()
}
