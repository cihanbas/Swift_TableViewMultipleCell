//
// Created by cihan bas on 29.10.2020.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    var tableView = UITableView()
    private var viewModel = ProfileViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = viewModel
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = 100
        view.backgroundColor = .magenta
        tableView.register(EmailCell.self, forCellReuseIdentifier: EmailCell.identifier)
        tableView.register(AboutCell.self, forCellReuseIdentifier: AboutCell.identifier)
        tableView.register(FriendCell.self, forCellReuseIdentifier: FriendCell.identifier)
        view.addSubview(tableView)
        tableView.frame = view.frame
     }
}
