//
//  AppDelegate.swift
//  Crypto Challenge
//
//  Created by Victor Morei on 14.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

   lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rootView = CryptoCurrenciesViewController()
        let rootController = UINavigationController(rootViewController: rootView)

        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
        
        return true
    }
}

