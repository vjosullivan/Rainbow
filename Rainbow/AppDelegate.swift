//
//  AppDelegate.swift
//  Rainbow
//
//  Created by Vincent O'Sullivan on 23/04/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let redVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RedViewController") as! RedViewController

        window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController(rootViewController: redVC)
        nav.isNavigationBarHidden = true

        //Add TransitionCoordinator as navigation controller's delegate

        window?.rootViewController = nav
        window?.makeKeyAndVisible()

        return true
    }
}

