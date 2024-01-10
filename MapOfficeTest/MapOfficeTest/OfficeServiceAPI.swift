//
//  OfficeServiceAPI.swift
//  MapOfficeTest
//
//  Created by kwon ji won on 1/9/24.
//

import Foundation
import NMapsMap
import CoreLocation

struct OfficeInfoResult: Decodable {
    let currentCount: Int
    let data: [OfficeInfo]
    let matchCount: Int
    let page: Int
    let perPage: Int
    let totalCount: Int
}

struct OfficeInfo: Decodable, Hashable {
    
    let name: String
    let postalCode: String
    let phoneNumber: String
    let address: String
    var latitude: Double?
    var longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case name = "우체국명"
        case postalCode = "우편번호"
        case phoneNumber = "전화번호"
        case address = "주소(지번)"
        case latitude
        case longitude
    }
}

class NaverGeocodeAPI: ObservableObject {
    
    static let shared = NaverGeocodeAPI()
    private init() { }
    
    @Published var targetLocation:  (latitude: String, longitude: String)?
    
    private var clientID: String? {
        get { getValueOfPlistFile("ApiKeys", "NAVER_GEOCODE_ID") }
    }

    private var clinetSecret: String? {
        get { getValueOfPlistFile("ApiKeys", "NAVER_GEOCODE_SECRET") }
    }
    
    func fetchData(_ sourceString: String) {
        guard let clientID = clientID else { return }
        guard let clinetSecret = clinetSecret else { return }
        
        let urlString = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=\(sourceString)"
   
        guard let url = URL(string: urlString) else { return }
 
        let session = URLSession(configuration: .default)
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(clientID, forHTTPHeaderField: "X-NCP-APIGW-API-KEY-ID")
        request.setValue(clinetSecret, forHTTPHeaderField: "X-NCP-APIGW-API-KEY")
        
//        let bodyData = "query=\(sourceString)"
//        request.httpBody = bodyData.data(using: .utf8)
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // 정상적으로 값이 오지 않았을 때 처리
                //여기서 오류가 남
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("API응답: \(jsonString)")
            }
            
            //API응답시 파싱하기
            do {
                let decoder = JSONDecoder()
                //geocodeResult 코더블
                let geocodeResult = try decoder.decode(GeocodeResult.self, from: data)
                //바뀌어야 하는 부분, 여기서 x,y를 불러와도 된다
                if let firstResult = geocodeResult.results.first,
                   let location = firstResult.geometry?.location {
                    DispatchQueue.main.async {
                        self.targetLocation = (latitude: location.lat, longitude: location.lng)
                    }
                }
            }
                catch {
                          print("JSON 디코딩 에러: \(error.localizedDescription)")
                      }
        }
        
        task.resume()
    }
    
}

// MARK: - GeocodeResult

struct GeocodeResult: Decodable {
    let results: [GeocodeLocation]
}

// MARK: - GeocodeLocation

struct GeocodeLocation: Decodable {
    let formatted_address: String
    let geometry: Geometry?
}

// MARK: - Geometry

struct Geometry: Decodable {
    let location: Location?
}

// MARK: - Location

struct Location: Decodable {
    let lat: String
    let lng: String
}




class OfficeInfoServiceAPI: ObservableObject {
    static let shared = OfficeInfoServiceAPI()
    private init() { }
    @Published var posts = [OfficeInfo]()
    @Published var resultMessage: String?
    
    
    private var apiKey: String? {
        get { getValueOfPlistFile("ApiKeys", "OFFICE_SERVICE_KEY") }
    }
    
    
    func fetchData() {
        guard let apiKey = apiKey else { return }
        
        //perPage = 가져오는 갯수 설정
        let urlString = "https://api.odcloud.kr/api/15070368/v1/uddi:cea8854d-35c4-4a7f-a100-f241ea289d76?page=1&perPage=10&returnType=JSON&serviceKey=\(apiKey)"
        
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            let str = String(decoding: data, as: UTF8.self)
//            print(str)
            
            do {
                let results = try JSONDecoder().decode(OfficeInfoResult.self, from: data)
                DispatchQueue.main.async {
                    //                    self.updateLocations(for: results.data)
                    self.posts = results.data
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
