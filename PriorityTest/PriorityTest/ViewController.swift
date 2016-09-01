//
//  ViewController.swift
//  PriorityTest
//
//  Created by linyb on 8/28/16.
//  Copyright © 2016 Guaidaodl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 96
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TestCell", forIndexPath: indexPath)

        if let testCell = cell as? TestTableViewCell {
            testCell.titleLabel.text = "Test \(indexPath.row)"
            testCell.delegate = self
        }

        return cell
    }
}

extension ViewController: TestTableViewCellDelegate {
    func onCellHeightChange() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

