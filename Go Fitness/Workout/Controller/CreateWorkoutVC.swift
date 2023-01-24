//
//  CreateWorkoutVC.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 24/01/2023.
//

import UIKit

final class CreateWorkoutVC: UIViewController {
    private var safeArea: UILayoutGuide!
    private let titleLabel = UILabel()
    private let workoutNameTF = UITextField()
    private let saveAndCancelButtons = SaveAndCancelButton()
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        safeArea = view.layoutMarginsGuide
        view.backgroundColor = UIColor(named: "baseColor")
        setupNavigation()
        setupTitleLabel()
        setupNameTextField()
        setupSaveAndCancelButtons()
    }
    
    private func setupNavigation() {
        navigationItem.title = "Create"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = UIColor(named: "baseColor")
        
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let top = titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30)
        let leading = titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        let trailing = titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        NSLayoutConstraint.activate([top, leading, trailing])
        
        titleLabel.text = "Name"
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 22)
    }
    
    private func setupNameTextField() {
        view.addSubview(workoutNameTF)
        
        workoutNameTF.translatesAutoresizingMaskIntoConstraints = false
        let top = workoutNameTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
        let leading = workoutNameTF.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        let trailing = workoutNameTF.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        let height = workoutNameTF.heightAnchor.constraint(equalToConstant: 60)
        NSLayoutConstraint.activate([top, leading, trailing, height])
        
        workoutNameTF.backgroundColor = UIColor(named: "baseColor")
        workoutNameTF.layer.cornerRadius = 10
        workoutNameTF.layer.shadowColor = UIColor.black.cgColor
        workoutNameTF.layer.shadowRadius = 2.0
        workoutNameTF.layer.shadowOpacity = 0.5
        workoutNameTF.layer.shadowOffset = CGSize(width: 3, height: 3)
        workoutNameTF.layer.masksToBounds = false
    }
    
    private func setupSaveAndCancelButtons() {
        view.addSubview(saveAndCancelButtons)
        
        saveAndCancelButtons.translatesAutoresizingMaskIntoConstraints = false
        let bottom = saveAndCancelButtons.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        let trailing = saveAndCancelButtons.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        let centerX = saveAndCancelButtons.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        NSLayoutConstraint.activate([bottom, trailing, centerX])
        
        saveAndCancelButtons.delegate = self
    }
    
    
}


extension CreateWorkoutVC: SaveAndCancelButtonsDelegate {
    func onCancel() {
        navigationController?.popViewController(animated: true)
    }
    
    func onSave() {
        print("Saved !!!")
    }
}
