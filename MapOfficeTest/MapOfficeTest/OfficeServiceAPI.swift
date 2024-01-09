//
//  OfficeServiceAPI.swift
//  MapOfficeTest
//
//  Created by kwon ji won on 1/9/24.
//

import Foundation

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
    
    enum CodingKeys: String, CodingKey {
        case name = "우체국명"
        case postalCode = "우편번호"
        case phoneNumber = "전화번호"
    }
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
            print(str)
            
            do {
                let results = try JSONDecoder().decode(OfficeInfoResult.self, from: data)
                DispatchQueue.main.async {
                    self.posts = results.data
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
            
//            do {
//                let results1 = try JSONDecoder().decode(OfficeInfoResult.self, from: data)
//                if results1.response.header.resultCode != "00" {
//                    DispatchQueue.main.async {
//                        self.resultMessage = results1.response.header.resultMsg
//                    }
//                }
//                else {
//                    let results = try JSONDecoder().decode(OfficeInfoResult.self, from: data)
//                    DispatchQueue.main.async {
//                        self.posts = results.response.body.items.item
//                    }
//                }
//            } catch let error {
//                print(error.localizedDescription)
//            }

        }
        task.resume()
    }

}
