//
//  ApiClient.swift
//  EmployeeList
//
//  Created by Mykhailo Nazarchuk on 22/01/2022.
//

import Foundation

class ApiClient {
    
    struct Constants {
        static let baseUrl = "https://dummy.restapiexample.com/api/v1/"
    }
    
    struct Endpoint {
        static let employees: String = "employees"
        static func employeeId(_ id: Int) -> String {
            return "employee/\(id)"
        }
    }
    
    func fetch(_ e: String, completion: @escaping ([Employee]?) -> Void) {
        guard let url = URL(string: Constants.baseUrl + e) else { return }
        fetchEmployees(url: url) { employees in
            DispatchQueue.main.async { completion(employees) }
        }
    }
    
    func fetchEmployee(_ e: String, completion: @escaping (Employee?) -> Void) {
        guard let url = URL(string: Constants.baseUrl + e) else { return }
        fetchEmployeeData(url: url) { employee in
            DispatchQueue.main.async { completion(employee) }
        }
    }
    
}

private extension ApiClient {
    
    func fetchEmployees(url: URL, completion: @escaping ([Employee]?) -> Void) {
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let employeeResponse = try JSONDecoder().decode(EmployeeResponse.self, from: data)
                completion(employeeResponse.data)
            } catch let error {
                print("\(error)")
                completion(nil)
            }
            
        }).resume()
    }
    
    func fetchEmployeeData(url: URL, completion: @escaping (Employee?) -> Void) {
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let employeeResponse = try JSONDecoder().decode(Employee.self, from: data)
                completion(employeeResponse)
            } catch let error {
                print("\(error)")
                completion(nil)
            }
            
        }).resume()
    }
}
