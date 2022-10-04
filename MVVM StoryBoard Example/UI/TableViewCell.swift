//
//  TableViewCell.swift
//  MVVM StoryBoard Example
//
//  Created by Paulo Antonelli on 04/10/22.
//

import Foundation
import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet weak var employeeIdLabel: UILabel!
    @IBOutlet weak var employeeNameLabel: UILabel!
    
    var employeeData: EmployeeData? {
        didSet {
            self.employeeIdLabel.text = String(describing: employeeData?.id)
            self.employeeNameLabel.text = employeeData?.employee_name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
