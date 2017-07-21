//
// AppDelegate.swift
// iOS-on-boarding
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 18/07/17
//

import SAPFiori
import SAPFoundation
import SAPCommon
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    private let logger = Logger.shared(named: "AppDelegateLogger")
    var espmContainer: ESPMContainerDataAccess! {
        get {
            return ESPMService.shared.espmContainer
        }
    }

    func applicationDidFinishLaunching(_ application: UIApplication) {
        UINavigationBar.applyFioriStyle()
    }
    
    // MARK: - Split view
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsMasterController = secondaryAsNavController.topViewController as? MasterViewController else { return false }
        // Without this, on iPhone the main screen is the detailview and the masterview can not be reached.
        if (topAsMasterController.collectionType == .none) {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        
        return false
    }
    
}
