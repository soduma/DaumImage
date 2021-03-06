//
//  SceneDelegate.swift
//  DaumImage
//
//  Created by 장기화 on 2022/04/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.tintColor = .label
        window?.rootViewController = UINavigationController(rootViewController: SearchViewController())
        window?.makeKeyAndVisible()
    }
}

