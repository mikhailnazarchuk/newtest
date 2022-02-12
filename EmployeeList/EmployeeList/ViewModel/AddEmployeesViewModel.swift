//
//  AddEmployeesViewModel.swift
//  EmployeeList
//
//  Created by Дмитрий Тимофеев on 12.02.2022.
//

import Foundation

class AddEmployeesViewModel {
    
    private let apiClient = ApiClient()
    
    func addEmployees(e: Employee) {
        apiClient.createNew(ApiClient.Endpoint.employees, employee: e) { success in
            
        }
    }
}

