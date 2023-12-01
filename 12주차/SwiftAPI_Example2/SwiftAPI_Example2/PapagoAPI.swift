//
//  PapagoAPI.swift
//  SwiftAPI_Example2
//
//  Created by kwon ji won on 12/1/23.
//

import SwiftUI

//가장 상위인 message에 관한 값을 만들어야해
struct TranslateResults: Decodable {
    let message: Message
}

struct Message: Decodable {
    //@골뱅이 빼고 ->  위에 3개는 @에 해당하는걸 맞춰야한다.
    let type: String
       let service: String
       let version: String
       let result: Result
    
    //위에 3개는 @에 해당하는걸 맞춰야한다.
    enum CodingKeys: String, CodingKey {
           case result
           case type = "@type"
           case service = "@service"
           case version = "@version"
       }
}

//이친구가 필요한거다.
struct Result: Decodable {
    let translatedText: String
}


class PapagoAPI:  ObservableObject {
    static let shared = PapagoAPI()
    private init() { }
    @Published var targetString: String?


    private var clientID: String? {
        get { getValueOfPlistFile("ApiKeys", "PAPAGO_CLIENT_ID") }
    }

    private var clinetSecret: String? {
        get { getValueOfPlistFile("ApiKeys", "PAPAGO_CLIENT_SECRET") }
    }


    func feachData(_ sourceString: String) {
        guard let clientID = clientID else { return }
        guard let clinetSecret = clinetSecret else { return }

        let urlString = "https://openapi.naver.com/v1/papago/n2mt"

        guard let url = URL(string: urlString) else { return }

        let session = URLSession(configuration: .default)

        let strWithParameters = "source=ko&target=en&text=\(sourceString)"
        let data = strWithParameters.data(using: .utf8)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue(clinetSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        request.httpBody = data

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // 정상적으로 값이 오지 않았을 때 처리
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let results = try JSONDecoder().decode(TranslateResults.self, from: data)
                DispatchQueue.main.async {
                    self.targetString = results.message.result.translatedText
                }
            } catch let error {
                print(error.localizedDescription)
            }

        }
        task.resume()
    }

}
