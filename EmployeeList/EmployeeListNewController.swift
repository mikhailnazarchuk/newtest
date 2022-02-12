//
//  EmployeeListNewController.swift
//  EmployeeList
//
//  Created by Алексей Дёшин on 12.02.2022.
//

import Foundation
import Then
import UIKit

class EmployeeListNewController: UIViewController {
    
    let viewModel = AddEmployeesViewModel()
    
    private let idLabel = UILabel().then {
        $0.text = "Id"
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let idText = UITextField().then {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let nameText = UITextField().then {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let salaryText = UITextField().then {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let ageText = UITextField().then {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(idLabel)
        view.addSubview(idText)
        view.addSubview(nameText)
        view.addSubview(salaryText)
        view.addSubview(ageText)
        
        idLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        idText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        
        idText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        idText.leftAnchor.constraint(equalTo: idLabel.rightAnchor, constant: 10).isActive = true
        idText.widthAnchor.constraint(equalToConstant: 100).isActive = true
        idText.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        nameText.topAnchor.constraint(equalTo: idText.bottomAnchor, constant: 10).isActive = true
        nameText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        nameText.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameText.heightAnchor.constraint(equalToConstant: 20).isActive = true

        
        salaryText.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 10).isActive = true
        salaryText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        salaryText.widthAnchor.constraint(equalToConstant: 100).isActive = true
        salaryText.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        ageText.topAnchor.constraint(equalTo: salaryText.bottomAnchor, constant: 10).isActive = true
        ageText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        ageText.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ageText.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        layout()
    }
    
    func add() {
        // guard let
        viewModel.addEmployees(e: Employee(id: Int(idText.text), name: nameText.text, salary: salaryText.text, age: ageText.text))
    }
}
