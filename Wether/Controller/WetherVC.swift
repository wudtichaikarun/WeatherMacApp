//
//  ViewController.swift
//  Wether
//
//  Created by Romantic on 17/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import Cocoa

class WetherVC: NSViewController {

  @IBOutlet weak var dateLbl: NSTextField!
  
  @IBOutlet weak var tempLbl: NSTextField!
  
  @IBOutlet weak var locationLbl: NSTextField!
  @IBOutlet weak var wetherImg: NSImageView!
  @IBOutlet weak var wetherConditionLbl: NSTextField!
  
  @IBOutlet weak var collectionView: NSCollectionView!
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }
  
  override func viewDidAppear() {
    self.view.layer?.backgroundColor = CGColor(red: 0.29, green: 0.72, blue: 0.98, alpha: 1.00)
    collectionView.dataSource = self
    collectionView.delegate = self
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }


}

extension WetherVC: NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
    let forcastItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "WeatherCell"), for: indexPath)
    return forcastItem
  }
  
  func numberOfSections(in collectionView: NSCollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
    return 7
  }
  
  func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
    return NSSize(width: 125, height: 125)
  }
}

