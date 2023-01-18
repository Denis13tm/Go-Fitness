//
//  ViewController.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 11/01/2023.
//

import UIKit

final class WorkoutVC: UIViewController {

    var safeArea: UILayoutGuide!
    let cardView = CardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        safeArea = view.layoutMarginsGuide
        view.backgroundColor = UIColor(named: "baseColor")
//        setGradientBackground()
        
        setupNavigation()
        setupContainerView()
        setupTableView()
    }
    
    private func setupNavigation() {
        navigationItem.title = "Workout"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func setupContainerView() {
        view.addSubview(cardView)
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        let top = cardView.topAnchor.constraint(equalTo: safeArea.topAnchor)
        let leading = cardView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        let trailing = cardView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        let height = cardView.heightAnchor.constraint(equalToConstant: 180)
        NSLayoutConstraint.activate([top, leading, trailing, height])
        
        
    }
    
    private func setupTableView() {
        
    }
    
    private func setGradientBackground() {
        let colorTop =  UIColor(named: "topColor")!.cgColor
        let colorBottom = UIColor(named: "bottomColor")!.cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }


}


