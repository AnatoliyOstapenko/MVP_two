//
//  Presenter.swift
//  MVP_two
//
//  Created by AnatoliiOstapenko on 19.03.2022.
//

import Foundation
import UIKit

protocol UserPresenterDelegate: AnyObject {
    func presentUsers(users: [UserModel])
    func presentAlert(title: String, message: String)
}

typealias PresenterDelegate = UserPresenterDelegate & UIViewController

class Presenter {
    weak var userPresenterDelegate: PresenterDelegate?
    
    func setViewDelegate(delegate: PresenterDelegate) {
        self.userPresenterDelegate = delegate
    }
    func didSelectRow(user: UserModel) {
        userPresenterDelegate?.presentAlert(title: user.name, message: "lives in \(user.address.city)")
    }
    
    func getUsers() {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard error == nil, let data = data else { return }
            do {
                let data = try JSONDecoder().decode([UserModel].self, from: data)
                self?.userPresenterDelegate?.presentUsers(users: data)
            } catch { print(error.localizedDescription)}
        }
        task.resume()
    }
    
}

