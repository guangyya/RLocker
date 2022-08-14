//
//  RLockerApp.swift
//  RLocker
//
//  Created by Guangyu Yang on 2022/8/14.
//

import SwiftUI
import XCGLogger

let logger = XCGLogger.default

@main
struct RLockerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            EmptyView()
                .frame(width: .zero)
        }
    }
}
