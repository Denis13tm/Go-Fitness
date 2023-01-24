//
//  ViewController.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 11/01/2023.
//

import UIKit

final class WorkoutVC: UIViewController {

    var safeArea: UILayoutGuide!
    let workoutView = WorkoutCell()
    let tableView = UITableView()
    
    let nameList = ["Adam", "Shown", "Otabek", "Chaeyoen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        safeArea = view.layoutMarginsGuide
        view.backgroundColor = UIColor(named: "baseColor")
//        setGradientBackground()
        
        setupNavigation()
        setupTableView()
    }
    
    private func setupNavigation() {
        navigationItem.title = "Workout"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = UIColor(named: "baseColor")
//        tabBarController?.tabBar.barTintColor = UIColor.brown
//        tabBarController?.tabBar.tintColor = UIColor.yellow
    }
    
    private func setupContainerView() {
        view.addSubview(workoutView)
        
        workoutView.translatesAutoresizingMaskIntoConstraints = false
        let top = workoutView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15)
        let leading = workoutView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        let trailing = workoutView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        let height = workoutView.heightAnchor.constraint(equalToConstant: 180)
        NSLayoutConstraint.activate([top, leading, trailing, height])
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let top = tableView.topAnchor.constraint(equalTo: safeArea.topAnchor)
        let leading = tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailing = tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bottom = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        NSLayoutConstraint.activate([top, leading, trailing, bottom])
        
        tableView.backgroundColor = .clear
        
        tableView.register(WorkoutCell.self, forCellReuseIdentifier: "cellID")
        tableView.dataSource = self
        tableView.delegate = self
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

extension WorkoutVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        guard let workoutCell = cell as? WorkoutCell else {
            return cell
        }
        
        let model = WorkoutCellModel(
            title: nameList[indexPath.row],
            time: Int.random(in: 7...23),
            exercises: Int.random(in: 3...5))
        
        workoutCell.set(model: model)
        
        return workoutCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}


