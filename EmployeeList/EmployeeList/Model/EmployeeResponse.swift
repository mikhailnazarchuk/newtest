//
//  EmployeeResponse.swift
//  EmployeeList
//
//  Created by Mykhailo Nazarchuk on 22/01/2022.
//

import Foundation

struct EmployeeResponse: Decodable {
  let data: [Employee]
}

struct Employee: Decodable {
    let id: Int
    let name: String
    let salary: Int
    let age: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "employee_name"
        case salary = "employee_salary"
        case age = "employee_age"
    }
}
