//
//  CreateWorkoutVC.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 24/01/2023.
//

import UIKit

final class CreateWorkoutVC: UIViewController {
    private let safeArea: UILayoutGuide!
    private let titleLabel = UILabel()
    private let workoutNameTF = UITextField()
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .red
    }
    
}
