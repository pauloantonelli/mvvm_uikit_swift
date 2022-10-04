//
//  Employee.swift
//  MVVM StoryBoard Example
//
//  Created by Paulo Antonelli on 01/10/22.
//

import Foundation

class Employee: Decodable {
    let status: String
    let data: Array<EmployeeData>
}

class EmployeeData: Decodable {
    let id: Int
    let employee_name: String
    let employee_salary: Int
    let employee_age: Int
    let profile_image: String
    
    enum CodingKeyType: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
