//
//  CrayonViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Victor Zhong on 2/16/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonViewController: UIViewController {

    // MARK: - Outlets and Properties
    @IBOutlet weak var tableView: UITableView!
    var crayons = Crayon.allTheCrayons

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CrayonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        let crayonAtRow = crayons[indexPath.row]
        let red = CGFloat(crayonAtRow.red / 255)
        let green = CGFloat(crayonAtRow.green / 255)
        let blue = CGFloat(crayonAtRow.blue / 255)

        cell.textLabel?.text = crayonAtRow.name
        cell.detailTextLabel?.text = crayonAtRow.hex
        cell.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)

        if crayonAtRow.name == "Black" {
            cell.textLabel?.textColor = .white
            cell.detailTextLabel?.textColor = .white
        }

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectedCell = sender as? UITableViewCell,
            let cellAtIndexPath = tableView.indexPath(for: selectedCell),
            let detailView = segue.destination as? DetailViewController {
            if segue.identifier == "crayonSegue" {
                detailView.crayon = crayons[cellAtIndexPath.row]
            }
        }
    }
}
