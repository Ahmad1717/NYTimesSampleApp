//
//  AppDelegate.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 18/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        return true
    }
}

extension AppDelegate {
    static var shared: AppDelegate? { UIApplication.shared.delegate as? AppDelegate }
    
    var rootViewController: UIViewController? {
        get { return window?.rootViewController }
        set {
            window?.rootViewController = newValue
            guard let currentWindow = window else { return }
            UIView.transition(with: currentWindow, duration: 0.6, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
