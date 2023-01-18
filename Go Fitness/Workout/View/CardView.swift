//
//  CardView.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 13/01/2023.
//

import UIKit

final class CardView: UIView {
    private let containerView = ContainerView()
    
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let timeLabel = LabelWithPostfix()
    private let exerciseLabel = LabelWithPostfix()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Actions
    
    private func setupView() {
        setupContainerView()
        setupStackView()
        setupTitleTabel()
        setupTimeLabel()
    }
    
    private func setupContainerView() {
        addSubview(containerView)
        
        let top = containerView.topAnchor.constraint(equalTo: topAnchor)
        let leading = containerView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailing = containerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottom = containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        NSLayoutConstraint.activate([top, leading, trailing, bottom])
    }
    
    private func setupStackView() {
        containerView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let height = stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2/3)
        let leading = stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        let trailing = stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        let centerY = stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        NSLayoutConstraint.activate([height, leading, trailing, centerY])
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
    }
    
    private func setupTitleTabel() {
        stackView.addArrangedSubview(titleLabel)
        
        titleLabel.text = "20 Minutes Workout"
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 36)
        titleLabel.adjustsFontSizeToFitWidth = true
        
    }
    private func setupTimeLabel() {
        let container = UIView()
        stackView.addArrangedSubview(container)
        
        container.addSubview(timeLabel)
        container.addSubview(exerciseLabel)
        
        let _ = {
            timeLabel.translatesAutoresizingMaskIntoConstraints = false
            let top = timeLabel.topAnchor.constraint(equalTo: container.topAnchor)
            let leading = timeLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor)
            let height = timeLabel.heightAnchor.constraint(equalTo: container.heightAnchor)
            NSLayoutConstraint.activate([top, leading, height])
            
            timeLabel.set(model: LabelWithPostfix.Model(title: "22", postFix: .min))
        }()
        
        let _ = {
            exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
            let top = exerciseLabel.topAnchor.constraint(equalTo: container.topAnchor)
            let leading = exerciseLabel.leadingAnchor.constraint(equalTo: self.timeLabel.trailingAnchor, constant: 15)
            let height = exerciseLabel.heightAnchor.constraint(equalTo: container.heightAnchor)
            NSLayoutConstraint.activate([top, leading, height])
            
            exerciseLabel.set(model: LabelWithPostfix.Model(title: "8", postFix: .exercise))
        }()

    }
    
}
