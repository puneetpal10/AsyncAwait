//
//  ViewController.swift
//  AsyncAwait
//
//  Created by puneet pal on 22/08/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userTableView: UITableView!
    private let viewModel = UserViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.userDelegate = self
        viewModel.fetchUsers()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        else { return UITableViewCell() }

        var content = cell.defaultContentConfiguration()
        content.text = viewModel.users[indexPath.row].name
        cell.contentConfiguration = content
        
        return cell
    }
}



struct UserModel: Decodable {
    let name: String
}


extension ViewController: UserServices {
    func reloadData() {
        self.userTableView.reloadData()
    } 
}
