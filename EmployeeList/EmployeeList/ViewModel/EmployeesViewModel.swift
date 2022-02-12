//
//  EmployeesViewModel.swift
//  EmployeeList
//
//  Created by Mykhailo Nazarchuk on 22/01/2022.
//

import UIKit

class EmployeesViewModel: NSObject {
    
    weak var delegate: EmployeesControllerProtocol?
    
    private let apiClient = ApiClient()
    private var employees: [Employee] = []
    
    func fetchAllEmployees(completion: @escaping () -> Void) {
        apiClient.fetch(ApiClient.Endpoint.employees) { [weak self] employees in
            self?.employees = employees ?? []
            completion()
        }
    }
    
    func getEmployee(forIndex index: Int) -> Employee? {
        guard index < employees.count else { return nil }
        return employees[index]
    }
    
}

extension EmployeesViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.id, for: indexPath) as? EmployeeTableViewCell else { return UITableViewCell() }
        
        cell.fillData(employees[indexPath.row])
        return cell
    }
    
}
