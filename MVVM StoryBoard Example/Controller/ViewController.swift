//
//  ViewController.swift
//  MVVM StoryBoard Example
//
//  Created by Paulo Antonelli on 01/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var employeeTableView: UITableView!
    private var employeeViewModel: EmployeeViewModel!
    private var dataSource: EmployeeTableViewDataSource<EmployeeTableViewCell, EmployeeData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() -> Void {
        self.employeeViewModel = EmployeeViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() -> Void {
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeeViewModel.employee.data, configureCell: { (cell, evm) in
            cell.employeeIdLabel.text = String(describing: evm.id)
            cell.employeeNameLabel.text = evm.employee_name
        })
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }
}

