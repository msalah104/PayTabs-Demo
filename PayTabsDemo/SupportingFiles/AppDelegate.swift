//
//  AppDelegate.swift
//  PayTabsDemo
//
//  Created by Mohammed Salah on 02/06/2020.
//  Copyright © 2020 MSalah. All rights reserved.
//

import os.log
import Swinject
import SwinjectAutoregistration
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    internal static let container = Container()

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupDependencies()
        return true
    }

    static func getContainer() -> Container {
        return container
    }
}

extension AppDelegate {
    internal func setupDependencies() {
        // configuring which api key to use
        AppDelegate.container.autoregister(PayTabsInfo.self, initializer: PayTabsInfoDemoKey.init).inObjectScope(ObjectScope.container)

        // viewModel
        AppDelegate.container.autoregister(ChceckoutViewModel.self, initializer: ChceckoutViewModel.init)
    }
}
