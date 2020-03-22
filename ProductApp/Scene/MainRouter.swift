//
//  MainRouter.swift
//  ProductApp
//
//  Created by Mohamed Mahmoud Zaki on 3/10/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import UIKit

class MainRouter {

    class var storyboard: UIStoryboard  {
        UIStoryboard(name: "Main", bundle: nil)
    }

    class func setupMainScreen() -> MainViewController {
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        mainVC.presenter = MainPresenter()
        return mainVC
    }

    class func navigateToDetailedScreen(from viewController: UIViewController, dataSource: [String]?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ItemViewController") as? ItemViewController
        vc?.imageNames = dataSource
      let root = SceneDelegate.window?.rootViewController as? UINavigationController
        root?.pushViewController(vc!, animated: true)
    }
}
