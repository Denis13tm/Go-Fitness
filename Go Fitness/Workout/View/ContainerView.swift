//
//  ContainerView.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 13/01/2023.
//

import UIKit

final class ContainerView: UIView {
    private let upperShadowView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = UIColor(named: "mainColor")
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.masksToBounds = false
        
        setupUpperShadowLayer()
    }
    
    private func setupUpperShadowLayer() {
        addSubview(upperShadowView)
        
        upperShadowView.translatesAutoresizingMaskIntoConstraints = false
        let top = upperShadowView.topAnchor.constraint(equalTo: topAnchor)
        let leading = upperShadowView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailing = upperShadowView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottom = upperShadowView.bottomAnchor.constraint(equalTo: bottomAnchor)
        NSLayoutConstraint.activate([top, leading, trailing, bottom])
        
        upperShadowView.layer.backgroundColor = (UIColor(named: "mainColor")?.cgColor)
        upperShadowView.layer.cornerRadius = 10
        upperShadowView.layer.shadowColor = UIColor.white.cgColor
        upperShadowView.layer.shadowRadius = 3.0
        upperShadowView.layer.shadowOpacity = 0.3
        upperShadowView.layer.shadowOffset = CGSize(width: -3, height: -3)
        upperShadowView.layer.masksToBounds = false
        
    }
    
    
}
