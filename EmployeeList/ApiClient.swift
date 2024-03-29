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
        static let addUrl = "https://dummy.restapiexample.com/api/v1/create"
    }
    
    struct Endpoint {
        static let employees: String = "employees"
        static func employeeId(_ id: Int) -> String {
            return "employee/\(id)"
        }
        static let create: String = "create"
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
    
    func createNew(_ e: String, employee: Employee, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: Constants.baseUrl + e) else {
            completion(false)
            return
        }
        let jsonData = try? JSONSerialization.data(withJSONObject: employee)
        
        var request = URLRequest(url: url)
        request.httpBody = jsonData
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, err in
            guard err == nil else {
                completion(false)
                return
            }
            completion(true)
        }.resume()
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
