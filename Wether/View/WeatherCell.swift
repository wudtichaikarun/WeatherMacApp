//
//  WeatherCell.swift
//  Wether
//
//  Created by Romantic on 18/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import Cocoa

class WeatherCell: NSCollectionViewItem {

  @IBOutlet weak var cellImage: NSImageView!
  @IBOutlet weak var cellDate: NSTextField!
  @IBOutlet weak var highTemp: NSTextField!
  @IBOutlet weak var lowTemp: NSTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setUpView()
  }
  
  func setUpView () {
    self.view.wantsLayer = true
    self.view.layer?.backgroundColor = CGColor(red: 0.69, green: 0.85, blue: 0.99, alpha: 0.5)
    self.view.layer?.cornerRadius = 5
  }
  
}
