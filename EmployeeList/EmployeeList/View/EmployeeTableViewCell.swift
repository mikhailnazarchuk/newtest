//
//  EmployeeTableViewCell.swift
//  EmployeeList
//
//  Created by Mykhailo Nazarchuk on 22/01/2022.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    static let id = "EmployeeTableViewCell-id"
    
    let nameLabel = UILabel()
    let salaryLabel = UILabel()
    let ageLabel = UILabel()
    let pictureImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillData(_ employee: Employee?) {
        guard let employee = employee else { return }
        
        nameLabel.text = employee.name
        salaryLabel.text = "$\(employee.salary)"
        ageLabel.text = "\(employee.age) y.o."        
    }
    
    private func layout() {
        addSubview(nameLabel)
        addSubview(salaryLabel)
        addSubview(ageLabel)
        addSubview(pictureImageView)
        
        subviews.forEach({ $0.translatesAutoresizingMaskIntoConstraints = false })
        
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        
        salaryLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        salaryLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 4).isActive = true
        
        ageLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        ageLabel.leftAnchor.constraint(equalTo: salaryLabel.rightAnchor, constant: 4).isActive = true
        
        pictureImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pictureImageView.leftAnchor.constraint(equalTo: ageLabel.rightAnchor, constant: 4).isActive = true
        pictureImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        pictureImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func config() {
        pictureImageView.backgroundColor = .systemPink
    }
    
}
