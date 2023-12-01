//
//  WeatherAPI.swift
//  SwiftAPI_Example1
//
//  Created by kwon ji won on 11/30/23.
//

import SwiftUI

//불러온 값을 list에 담는다.
struct WeatherResults: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

//어떤 값을 불러올껀지 설정
//list에서 사용할려면 Hashable이 있어야 한다.
struct Weather: Decodable, Hashable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


class WeatherAPI: ObservableObject {
//https://varyeun.tistory.com/entry/스위프트에서-static-키워드란-static-in-swift -> static을 쓰는 이유
    static let shared = WeatherAPI()
    //클래스가 있어서 초기값은 있어야한다.
    private init() { }
    @Published var posts = [Weather]()
    @Published var weatherResults: WeatherResults?
    
    private var apiKey: String? {
        get { getValueOfPlistFile("ApiKeys", "API_KEY")}
    }
    
    func feachData() {
        guard let apiKey = apiKey else { return }
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            
            guard let data = data else {
                print("No data recived")
                return
            }
            
//            let str = String(decoding: data, as: UTF8.self)
            
//            print(str)
            do {
                let json = try JSONDecoder().decode(WeatherResults.self, from: data)
                print(json.name)
                DispatchQueue.main.async {
                    self.weatherResults = json
                    self.posts = json.weather
                }
            } catch let error {
                    print(error.localizedDescription)
                }
        }
        task.resume()
    }
}


