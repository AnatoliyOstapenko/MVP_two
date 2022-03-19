//
//  ViewController.swift
//  MVP_two
//
//  Created by AnatoliiOstapenko on 19.03.2022.
//

import UIKit

class UserViewController: UIViewController {
    
    public let userTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userTableView)
        tableViewConstraints()
        userTableView.dataSource = self
        userTableView.delegate = self
    }
    // more easiest code to add table view
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        view.addSubview(userTableView)
//        userTableView.frame = view.bounds
//    }
    
    func tableViewConstraints() {
        userTableView.translatesAutoresizingMaskIntoConstraints = false
        userTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        userTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        userTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        userTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}
// MARK: - TableView DataSource
extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "roe is \(indexPath.row)"
        return cell
    }
    
    
}

// MARK: - TableView Delegate
extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // avoid gray background of selected row
    }
}

