//
//  EmployeeDetailsViewController.swift
//  EmployeeList
//
//  Created by Mykhailo Nazarchuk on 25/01/2022.
//

import UIKit

class EmployeeDetailsViewController: UIViewController {
    
    var employeeId: Int?
    private var employee: Employee?
    let apiClient = ApiClient()
    
    private let idLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        layout()
        
        guard let id = employeeId else { return }
        apiClient.fetchEmployee(ApiClient.Endpoint.employeeId(id)) { [weak self] employee in
            guard let self = self else { return }
            
            guard let employee = employee else {
                self.idLabel.text = "failed to fetch info"
                return
            }
            self.idLabel.text = "successfully fetched info about \(employee.id)"
        }
    }
    
    private func layout() {
        view.addSubview(idLabel)
        idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        idLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
