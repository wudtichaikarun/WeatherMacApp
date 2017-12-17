//
//  CurrentWeather.swift
//  Wether
//
//  Created by Romantic on 18/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import Foundation
import SwiftyJSON

class CurrentWeather {
  fileprivate var _cityName: String!
  fileprivate var _date: String!
  fileprivate var _weatherType: String!
  fileprivate var _currentTemp: Int!
  
  var cityName: String {
    get {
      return _cityName
    }
    set {
      _cityName = newValue
    }
  }
  
  var date: String {
    get {
      return _date
    }
    set {
      _date = newValue
    }
  }
  
  var weatherType: String {
    get {
      return _weatherType
    }
    set {
      _weatherType = newValue
    }
  }
  
  var currentTemp: Int {
    get {
      return _currentTemp
    }
    set {
      _currentTemp = newValue
    }
  }
  
  class func loadCurrentWeatherFromDate(_ APIData: Data) -> CurrentWeather {
    let currentWeather = CurrentWeather()
    
    // used swiftyJson
    let swiftyJson = JSON(data: APIData)
    currentWeather.cityName = swiftyJson["name"].stringValue.capitalized
    currentWeather.weatherType = swiftyJson["weather"][0]["main"].stringValue.capitalized
    currentWeather.currentTemp = swiftyJson["main"]["temp"].intValue
    
    // if not use swiftyJson
    /*
    do {
      let myJson = try JSONSerialization.jsonObject(with: APIData, options: .mutableLeaves)
      if let dict = myJson as? Dictionary<String, AnyObject> {
        
        // get name
        if let name = dict["name"] as? String {
          currentWeather.cityName = name
        }
        
        // get weatherType
        if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
          if let main = weather[0]["main"] as? String {
            currentWeather.weatherType = main
          }
        }
        
        // get currentWeather
        if let main = dict["main"] as? Dictionary<String, AnyObject> {
          if let currentTemp = main["temp"] as? Int {
            currentWeather.currentTemp = currentTemp
          }
        }
        
        currentWeather.date = "Today"
      }
      
    } catch let error as NSError {
      print(error)
    }
    */
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .none
    let currentDate = dateFormatter.string(from: Date())
    currentWeather.date = "Today, \(currentDate)"
    
    return currentWeather
  }
}
