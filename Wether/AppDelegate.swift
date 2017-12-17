//
//  AppDelegate.swift
//  Wether
//
//  Created by Romantic on 17/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  // Variabels
  let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
    statusItem.button?.title = "--°"
    statusItem.action = #selector(AppDelegate.displayPopUp(_:))
    WeatherService.instance.downloadWeatherDetaials {
      self.statusItem.button?.title = "\(WeatherService.instance.currentWeather.currentTemp)°"
    }

  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }
  
  @objc func displayPopUp(_ sender: AnyObject) {
    let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
    guard let vc = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "WetherVC")) as? NSViewController
      else { return }
    let popOverView = NSPopover()
    popOverView.contentViewController = vc
    popOverView.behavior = .transient
    popOverView.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .maxY)
  }
  

}

