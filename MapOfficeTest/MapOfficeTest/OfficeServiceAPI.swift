//
//  OfficeServiceAPI.swift
//  MapOfficeTest
//
//  Created by kwon ji won on 1/9/24.
//

import Foundation
import NMapsMap
import CoreLocation
import SwiftUI

//공공데이터 API를 담은 구조체
struct OfficeMainInfo: Decodable, Hashable {
    
}



struct OfficeInfoResult: Decodable {
    let currentCount: Int
    let data: [OfficeInfo]
    let matchCount: Int
    let page: Int
    //perPage = 가져오는 갯수 설정
    let perPage: Int
    let totalCount: Int
}

struct OfficeInfo: Decodable, Hashable {
    
    let name: String
    let postalCode: String
    let phoneNumber: String
    let address: String

    
    //한글일 때 나타내는 표현
    enum CodingKeys: String, CodingKey {
        case name = "우체국명"
        case postalCode = "우편번호"
        case phoneNumber = "전화번호"
        case address = "주소(지번)"
    }
}



//NaverMap에서 만들어지는 구조체 / 주소를 위,경도로 바꾸는 값 포함
struct GeocodeResponse: Decodable {
    let status: String
    let addresses: [Address]
}

struct Address: Decodable {
    let roadAddress: String
    let jibunAddress: String
    let x: String
    let y: String
}

//내가 정말 필요한 값 주소, 위도, 경도
struct CombinedResult: Decodable, Hashable {
    let latitude: String
    let longitude: String
    let address: String
}


//우체국 메인 주서 API 불러오는 부분
class OfficMaineInfoServiceAPI: ObservedObject {
    static let shared = OfficMaineInfoServiceAPI()
    
    private init() { }
    
    @Published var infos = [OfficeMainInfo]()

    private var apiKey: String? {
        get { getValueOfPlistFile("ApiKeys", "OFFICE_MAIN_KEY")}
    }
    
    //fetchData는 뭔가 시작할 때 불러오는 값 -> 클릭 되면 실행된다.
    func fetchData() {
        guard let apiKey = apiKey else { return }
        
        let urlString = "https://www.koreapost.go.kr/koreapost/openapi/searchPostScopeList.do?serviceKey=\(apiKey)&postLatitude=37.56&postLongitude=126.98&postGap=0.5&postDivType=1"
//        "https://api.odcloud.kr/api/15070368/v1/uddi:cea8854d-35c4-4a7f-a100-f241ea289d76?page=1&perPage=10&returnType=JSON&serviceKey=\(apiKey)"
        
        //URL주소로 받아와 지면 값을 url로 저장해라
        //url설정 부터 str까진 공통 작업
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
            
            let str2 = String(decoding: data, as: UTF8.self)
            
            print(str2)
            
            //가장 상단에 있는 OfficeInfoResult을 decode한다.
            //내가 가지려고 하는건 data안에 있는 name, address -> OfficeInfo배열로 저장 되어있다.
//            do {
//                let results = try JSONDecoder().decode(OfficeMainInfo.self, from: data)
//                DispatchQueue.main.async {
//                    //상단에서 세부 사항인 result.data부분을 따로 post로 저장
//                    self.infos = results.data
//                }
////                print(results)
//            } catch let error {
//                print(error.localizedDescription)
//            }
        }
        //이건 뭘까?
        task.resume()
    }
    
}

//우체국 주소 API를 불러오는 부분
class OfficeInfoServiceAPI: ObservableObject {
    
    //클래스에서 State같은 느낌  ObservableObject -> StateObjecr
    //shared -> 싱글톤의 일반적 패턴 -> 애플리케이션 전반에 걸쳐 공유된다.
    //싱글톤 -> 클래스의 인스턴스를 단 하나만 생성하고 이에 대한 전역적인 액세스 지점을 제공하는 디자인 패턴
    static let shared = OfficeInfoServiceAPI()
    
    //class는 초기화가 필요하니까!
    private init() { }
    
    //Published -> 값의 변화를 알려준다. 
    //내가 불러올 값은 OfficeInfo에 있다.
    @Published var posts = [OfficeInfo]()
    //이건 어디 필요한거지?
    @Published var resultMessage: String?
    
    //API키 값 입력하기
    private var apiKey: String? {
        get { getValueOfPlistFile("ApiKeys", "OFFICE_SERVICE_KEY") }
    }
    
    //fetchData는 뭔가 시작할 때 불러오는 값 -> 클릭 되면 실행된다.
    func fetchData() {
        guard let apiKey = apiKey else { return }
        
        let urlString = "https://api.odcloud.kr/api/15070368/v1/uddi:cea8854d-35c4-4a7f-a100-f241ea289d76?page=1&perPage=10&returnType=JSON&serviceKey=\(apiKey)"
        
        //URL주소로 받아와 지면 값을 url로 저장해라
        //url설정 부터 str까진 공통 작업
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
            
            //가장 상단에 있는 OfficeInfoResult을 decode한다.
            //내가 가지려고 하는건 data안에 있는 name, address -> OfficeInfo배열로 저장 되어있다.
            do {
                let results = try JSONDecoder().decode(OfficeInfoResult.self, from: data)
                DispatchQueue.main.async {
                    //상단에서 세부 사항인 result.data부분을 따로 post로 저장
                    self.posts = results.data
                }
//                print(results)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        //이건 뭘까?
        task.resume()
    }
}

//NaverMap Geocode해주는 API
class NaverGeocodeAPI: ObservableObject {
    
    static let shared = NaverGeocodeAPI()
    private init() { }
    
    //이게 왜 필요한거지?
    @Published var targetLocation: (latitude: String, longitude: String)?
    
    private var clientID: String? {
        get { getValueOfPlistFile("ApiKeys", "NAVER_GEOCODE_ID") }
    }
    
    private var clinetSecret: String? {
        get { getValueOfPlistFile("ApiKeys", "NAVER_GEOCODE_SECRET") }
    }
    
    func fetchLocationForPostalCode(_ postalCode: String,  completion: @escaping (Double?, Double?) -> Void) {
        guard let clientID = clientID else { return }
        guard let clinetSecret = clinetSecret else { return }
        
        let urlString = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=\(postalCode)"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(clientID, forHTTPHeaderField: "X-NCP-APIGW-API-KEY-ID")
        request.setValue(clinetSecret, forHTTPHeaderField: "X-NCP-APIGW-API-KEY")
        
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
                //geocodeResult 코더블
                let geocodeResult = try JSONDecoder().decode(GeocodeResponse.self, from: data)
                //바뀌어야 하는 부분, 여기서 x,y를 불러와도 된다
                
                if let firstAddress = geocodeResult.addresses.first {
                    let latitude = Double(firstAddress.y)!
                    let longitude = Double(firstAddress.x)!
                    
                    print("Latitude: \(latitude), Longitude: \(longitude)")
                    
                    //메인 스레드에서 UI를 업데이트 한다.
                    DispatchQueue.main.async {
                        //                        self.targetLocation = (latitude: latitude, longitude: longitude)
                        completion(latitude,longitude)
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

class CombinedAPIService: ObservableObject {
    @Published var combinedResults = [CombinedResult]()
    static let shared = CombinedAPIService()
    
    func fetchData() {
        // 두 API에서 데이터를 가져와서 다음 변수에 저장한 것으로 가정합니다.
               let officeInfoResults = OfficeInfoServiceAPI.shared.posts
        let naverGeocodeResult = NaverGeocodeAPI.shared.targetLocation
        
        // 가져온 데이터를 순회하면서 CombinedResult 객체를 생성합니다.
        for (_,officeInfo) in officeInfoResults.enumerated() {
            if let latitude = naverGeocodeResult?.latitude,
               let longitude = naverGeocodeResult?.longitude {
                
                let combinedResult = CombinedResult(
                    latitude: String(latitude),
                    longitude: String(longitude),
                    address: officeInfo.address
                )
                combinedResults.append(combinedResult)
            }
            print(combinedResults)
            print("!!!!!!!!!!!!!!!!!!!")
        }

        print(combinedResults)
    }
}


