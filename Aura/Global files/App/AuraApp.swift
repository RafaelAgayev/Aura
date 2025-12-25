//
//  AuraApp.swift
//  Aura
//
//  Created by Rafael Agayev on 22.12.25.
//

import SwiftUI
import CoreData
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct AuraApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    let persistenceController = PersistenceController.shared
    
    private var colorScheme: ColorScheme? {
           switch AppTheme(rawValue: theme) {
           case .light:
               return .light
           case .dark:
               return .dark
           default:
               return nil
           }
       }
    
    @AppStorage("app_theme") private var theme: Int = AppTheme.system.rawValue
    
    @StateObject private var loginVM = LoginScreenViewModel()

    var body: some Scene {
       
            WindowGroup {
                NavigationStack{
                
                if loginVM.isAuthorized{
                    MainScreen(loginVM: loginVM)
                        .preferredColorScheme(colorScheme)
                    
                }else {
                    LoginScreen()
                        .preferredColorScheme(colorScheme)
                }
            }
        }
    }
}
