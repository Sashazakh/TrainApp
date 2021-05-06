//
//  SceneDelegate.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import UIKit
import RxSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = scene

        setInitialVc()
        
        window?.makeKeyAndVisible()
    }
    
    func setInitialVc() {
        let isAuth = UserDefaults.standard.bool(forKey: "isAuth")
        if isAuth {
            guard let userIdString = UserDefaults.standard.string(forKey: "userId"),
                  let userId = UUID(uuidString: userIdString) else { return }
            let vc = TabBarAssemble().build(userId: userId)
            window?.rootViewController = vc
            
        } else {
            let loginVC = LoginAssembly().build()
            let navigationVC = UINavigationController(rootViewController: loginVC)
            
            navigationVC.navigationBar.isHidden = true
            window?.rootViewController = navigationVC
        }
    }
    
    
    func setRootViewController(viewController: UIViewController) {
        window?.rootViewController = viewController
    }
}

