//
//  ViewController.swift
//  MVP_two
//
//  Created by AnatoliiOstapenko on 19.03.2022.
//

import UIKit

class UserViewController: UIViewController, UserPresenterDelegate {

    public let userTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    let presenter = Presenter()
    var array: [UserModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userTableView)
        tableViewConstraints()
        userTableView.dataSource = self
        userTableView.delegate = self
        presenter.getUsers()
        presenter.setViewDelegate(delegate: self)
        
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
    
    func presentUsers(users: [UserModel]) {
        array = users
        DispatchQueue.main.async {
            self.userTableView.reloadData()
        }
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(button)
        present(alert, animated: true, completion: nil)
    }

}
// MARK: - TableView DataSource
extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row].name
        return cell
    }
    
    
}

// MARK: - TableView Delegate
extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // avoid gray background of selected row
        
        presenter.didSelectRow(user: array[indexPath.row])
    }
}

