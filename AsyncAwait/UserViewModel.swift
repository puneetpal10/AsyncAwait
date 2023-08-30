//
//  UserViewModel.swift
//  AsyncAwait
//
//  Created by puneet pal on 22/08/23.
//

import Foundation

protocol UserServices: AnyObject {
    func reloadData()
}

class UserViewModel {
    
    let api = Network()
    weak var userDelegate: UserServices?
    
    var users: [UserModel] = [] {
        didSet {
            self.userDelegate?.reloadData()
        }
    }

//@MainActor performs tasks on the main thread.
   @MainActor func fetchUsers() {
        Task {
            let user: [UserModel] = try await api.fetchUsers(url: userURL)
            users = user
        }
    }
}
