//
//  WeatherService.swift
//  Wether
//
//  Created by Romantic on 18/12/2560 BE.
//  Copyright © 2560 Romantic. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherService {
  static let instance = WeatherService()
  fileprivate var _currentWeather = CurrentWeather()
  
  var currentWeather: CurrentWeather {
    get {
      return _currentWeather
    }
    set {
      _currentWeather = newValue
    }
  }
  
  func downloadWeatherDetaials () {
    Alamofire.request(
      API_URL_CURRENT_WEATHER,
      method: .get,
      parameters: nil,
      encoding: JSONEncoding.default,
      headers: HTTP_HEADER
    ).responseData { (response) in
        self.currentWeather = CurrentWeather.loadCurrentWeatherFromDate(response.data!)
        print(self.currentWeather.currentTemp)
        print(self.currentWeather.date)
       print(self.currentWeather.weatherType)
    }
  }
  
  
}
