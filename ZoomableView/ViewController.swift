//
//  ViewController.swift
//  ZoomableView
//
//  Created by Savvycom2021 on 19/09/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        if indexPath.row == 0 {
            cell.setData(type: .view)
        } else if indexPath.row == 1 {
            cell.setData(type: .image)
        } else if indexPath.row == 2 {
            cell.setData(type: .video)
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width
    }
}

extension ViewController: CustomTableViewCellDelegate {
    func customCellDidZoom(cell: CustomTableViewCell) {
        tableView.isScrollEnabled = false
    }
    
    func customCellEndZoom(cell: CustomTableViewCell) {
        tableView.isScrollEnabled = true
    }
}
