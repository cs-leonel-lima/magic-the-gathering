//
//  AppDelegate.swift
//  magic-the-gathering
//
//  Created by leonel.menezes.lima on 17/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
}

extension AppDelegate {
    func setupWindow() {
        self.window = UIWindow()
        self.window?.makeKeyAndVisible()
        let mainView = SetTableViewController(style: .grouped)
        self.window?.rootViewController = mainView
        
    }
}
