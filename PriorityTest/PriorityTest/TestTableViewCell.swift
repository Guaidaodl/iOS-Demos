//
//  TestTableViewCell.swift
//  PriorityTest
//
//  Created by linyb on 8/28/16.
//  Copyright © 2016 Guaidaodl. All rights reserved.
//

import UIKit

protocol TestTableViewCellDelegate:class {
    func onCellHeightChange();
}

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var showBottom: NSLayoutConstraint!
    var show = true

    weak var delegate: TestTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .None
        bringSubviewToFront(titleLabel)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    @IBAction func onPressed(sender: AnyObject) {
        if show {
            showBottom.constant = 0
            show = false
        } else {
            showBottom.constant = 58
            show = true
        }

        delegate?.onCellHeightChange()
    }
}
