//
//  EmployeeViewModel.swift
//  MVVM StoryBoard Example
//
//  Created by Paulo Antonelli on 01/10/22.
//

import Foundation

class EmployeeViewModel {
    private var apiService: ApiService!
    private(set) var employee: Employee! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    var bindEmployeeViewModelToController: (() -> ()) = {}
    
    init() {
        self.apiService = ApiService(url: URL(string: "https://dummy.restapiexample.com/api/v1/employees")!)
        self.getEmployeeList()
    }
    
    func getEmployeeList() -> Void {
        self.apiService.get(completion: { employeeList in
            self.employee = employeeList
        })
    }
}
