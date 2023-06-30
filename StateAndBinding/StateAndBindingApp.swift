//
//  StateAndBindingApp.swift
//  StateAndBinding
//
//  Created by 胡文博 on 2023/06/28.
//

import SwiftUI

@main
struct StateAndBindingApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
//            ContentView()
            TextFieldView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UIScrollView.appearance().keyboardDismissMode = .onDrag
        return true
    }
}
