//
//  ViewController.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 11/01/2023.
//

import UIKit

final class WorkoutVC: UIViewController {

    private var safeArea: UILayoutGuide!
    private let workoutView = WorkoutCell()
    private let tableView = UITableView()
    private let workoutDispatcher = try? WorkoutDispatcher()
    
    var listWorkout = ListWorkoutResponse(list: [])
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Actions...
    
    private func setupView() {
        safeArea = view.layoutMarginsGuide
        view.backgroundColor = UIColor(named: "baseColor")
        
//        setGradientBackground()
        setupNavigation()
        setupTableView()
        setupData()
    }
    
    private func setupNavigation() {
        navigationItem.title = "Workout"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = UIColor(named: "mainColor")
        tabBarController?.tabBar.barTintColor = UIColor.brown
        tabBarController?.tabBar.tintColor = UIColor.yellow
        
        let addButton = UIBarButtonItem(
            title: "Add",
            style: .plain,
            target: self,
            action: #selector(addAction))
        
        addButton.tintColor = .green
        navigationItem.rightBarButtonItem = addButton
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
    
    //MARK: - Logic
    
    func setupData() {
        guard let dispatcher = workoutDispatcher else {
            print("\(self): dispatcher was nil.")
            return
        }
        
        listWorkout = dispatcher.list(request: ListWorkoutRequest())
        tableView.reloadData()
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
    
    //MARK: -  Actions
    
    @objc private func addAction() {
        navigationController?.pushViewController(CreateWorkoutVC(), animated: true)
    }

}

extension WorkoutVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listWorkout.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        guard let workoutCell = cell as? WorkoutCell else { return cell }
        
        let response = listWorkout.list[indexPath.row]
        let model = WorkoutModel(title: response.title)
        
        workoutCell.set(model: model)
        
        return workoutCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}


