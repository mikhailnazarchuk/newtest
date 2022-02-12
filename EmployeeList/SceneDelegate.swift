//
//  SceneDelegate.swift
//  EmployeeList
//
//  Created by Mykhailo Nazarchuk on 22/01/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
       
        let navigation = UINavigationController(rootViewController: EmployeesListViewController())
       
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
