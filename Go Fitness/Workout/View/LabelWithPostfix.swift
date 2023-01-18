//
//  LabelWithPostfix.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 18/01/2023.
//

import UIKit

final class LabelWithPostfix: UIView {
    private let label = UILabel()
    private let postFixLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Public Functions
    
    func set(model: Model) {
        label.text = model.title
        postFixLabel.text = model.postFix.rawValue
    }
    
    //MARK: - Private Functions
    
    private func setupView() {
        setupLabel()
        setupPostFixLabel()
    }
    
    private func setupLabel() {
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        let top = label.topAnchor.constraint(equalTo: topAnchor)
        let leading = label.leadingAnchor.constraint(equalTo: leadingAnchor)
        NSLayoutConstraint.activate([top, leading])
        
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 32)
    }
    
    private func setupPostFixLabel() {
        addSubview(postFixLabel)
        
        postFixLabel.translatesAutoresizingMaskIntoConstraints = false
        let bottom = postFixLabel.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: -4)
        let leading = postFixLabel.leadingAnchor.constraint(equalTo: label.trailingAnchor)
        let trailing = postFixLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        NSLayoutConstraint.activate([bottom, leading, trailing])
        
        postFixLabel.textColor = .lightGray
        postFixLabel.layer.opacity = 0.5
        postFixLabel.font = .boldSystemFont(ofSize: 20)
    }
    
}

extension LabelWithPostfix {
    struct Model {
        let title: String
        let postFix: PostFix
    }
    
    enum PostFix: String {
        case min
        case exercise
    }
}
