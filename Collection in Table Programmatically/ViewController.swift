//
//  ViewController.swift
//  Collection in Table Programmatically
//
//  Created by user on 04.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableOfCollection: UITableView = {
        let table = UITableView()
        table.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.id)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableOfCollection.delegate = self
        tableOfCollection.dataSource = self
        view.addSubview(tableOfCollection)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableOfCollection.frame = view.bounds

    }

}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOfCollection.dequeueReusableCell(withIdentifier: MyTableViewCell.id, for: indexPath) as! MyTableViewCell
        let array = info.all[indexPath.row]
        cell.data = array
        cell.configure()
        cell.backgroundColor = .green
        return cell
    }

    
}
