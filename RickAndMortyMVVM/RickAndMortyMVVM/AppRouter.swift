//
//  AppRouter.swift
//  RickAndMortyMVVM
//
//  Created by Sinan Kulen on 27.12.2021.
//

import UIKit

final class AppRouter {
    
    let window : UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewController = CharacterListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
