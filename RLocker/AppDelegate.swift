//
//  AppDelegate.swift
//  RLocker
//
//  Created by Guangyu Yang on 2022/8/14.
//

import Foundation
import SwiftUI
import AppKit

final class AppDelegate: NSObject, NSApplicationDelegate {
    private var menuExtrasConfigurator: MacExtraConfigurator?
    
    final private class MacExtraConfigurator: NSObject {
        private var staturBar: NSStatusBar
        private var statusItem: NSStatusItem
        private var mainView: NSView
        
        private struct MainView: View {
            var body: some View {
                HStack {
                    Text("Hello")
                    Text("Mac")
                    Text("Lock")
                    Text("Quit")
                }
                .background(Color.blue)
                .padding()
            }
        }
        
        override init() {
            staturBar = NSStatusBar.system
            statusItem = staturBar.statusItem(withLength: NSStatusItem.squareLength)
            mainView = NSHostingView(rootView: MainView())
            mainView.frame = NSRect(x: 0, y: 0, width: 300, height: 250)
            super.init()
            createMenu()
        }
        
        private func createMenu() {
            if let statusBarButton = statusItem.button {
                statusBarButton.image = NSImage(systemSymbolName: "lock", accessibilityDescription: nil)
                
                let lockItem = NSMenuItem()
                lockItem.title = "Lock"
                lockItem.target = self
                lockItem.action = #selector(Self.onLockClicked(_:))
                lockItem.keyEquivalent = "L"
                let mainMenu = NSMenu()
                mainMenu.addItem(lockItem)
                
                mainMenu.addItem(.separator())
                
                mainMenu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

                statusItem.menu = mainMenu
            }
        }
        
        @objc private func onLockClicked(_ sender: Any) {
            logger.info("clicked")
            lock()
        }
        
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        menuExtrasConfigurator = .init()
    }
}
