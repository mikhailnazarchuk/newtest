//
//  ViewController.swift
//  EmployeeList
//
//  Created by Mykhailo Nazarchuk on 22/01/2022.
//

// MVVM
// Model View ViewModel

import UIKit
import Then

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({ addSubview($0) })
    }
}

protocol EmployeesControllerProtocol: AnyObject {
    func reloadData()
}

class EmployeesListViewController: UIViewController {
    
    let tableView = UITableView()
    
    let fetchButton = UIButton().then {
        $0.setTitle("Fetch All", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
    }
    
    let loader = UIActivityIndicatorView().then {
        $0.style = .large
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let viewModel = EmployeesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        viewModel.delegate = self
        
        config()
        layout()
    }
    
    private func layout() {
        view.addSubviews(tableView, fetchButton, loader)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        fetchButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        fetchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
        loader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loader.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func config() {
        tableView.delegate = self
        tableView.dataSource = viewModel
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.id)
        tableView.backgroundColor = .white
        
        fetchButton.addTarget(self, action: #selector(fetchData), for: .touchUpInside)
    }
    
    @objc func fetchData() {
        fetchButton.isHidden = true
        
        loader.startAnimating()
        viewModel.fetchAllEmployees { [weak self] in
            self?.loader.stopAnimating()
            self?.tableView.reloadData()
            self?.fetchButton.isHidden = false
        }
    }

}

extension EmployeesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 100 }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let employee = viewModel.getEmployee(forIndex: indexPath.row) else { return }
        
        let vc = EmployeeDetailsViewController().then {
            $0.employeeId = employee.id
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension EmployeesListViewController: EmployeesControllerProtocol {
    func reloadData() { tableView.reloadData() }
}
