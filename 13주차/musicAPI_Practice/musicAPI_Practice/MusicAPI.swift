//
//  MusicAPI.swift
//  musicAPI_Practice
//
//  Created by kwon ji won on 12/4/23.
//

import Foundation
import SwiftUI

//전체 json
struct MusicResults: Decodable {
    //json에서 results를 불러 온다. -> 키값만 가져온다.
    let results: [Music]
}

//어떤 값을 불러올껀지 설정
struct Music: Decodable, Hashable {
    let artistId: Int
    let artistName: String
    let trackName: String
    let artworkUrl60 : String
}

class MusicAPI: ObservableObject {
    
    @Published var posts = [Music]()
//    @Published var targetString: String?
    
    static let shared = MusicAPI()
    
    private init() { }
        //api_key가져 오는건 생략
    func feachData() {
        let urlString = "https://itunes.apple.com/search?term=coldplay&entity=song"
        
        //URL주소가 없으면 에러 리턴 guard let 이용!
        guard let url = URL(string: urlString) else { return }
        
        //기본 네트워크구성을 이용하여 새로운 URLSession 인스턴스를만들고 이 인스턴스를 사용하여 네트워크 작업을 처리하게 함
        //URLSession = 데이터를 다운로드하거나 업로드 하기 위한 클래스 / 네트워크 작업시 사용
        //https://developer.apple.com/documentation/foundation/urlsessionconfiguration
        
        let session = URLSession(configuration: .default)
        
        //URLSession을 사용하여 데이터를 다운받는 작업
        //dataTask 클로저에서 세개의 인자인 data, response, error를 상황에 따라 적절한 처리를 수행
        let task = session.dataTask(with: url) { data, response, error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
            //메서드에서 서버로 부터 응답을 받을 경우 HTTPURLResponse로 변환,아님 return
            //HTTPURLResponse : URLResponse의 하위 클래스, HTTP 프로토콜로 통신할 때의 서버응답에 관련된 정보를 제공하는 클래스 HTTP,HTTPS와 같은 프로토콜을 지원한다.
            //statusCode: HTTP상태 코드. 성공적인 응답이라면 200, 클라이언트 오류: 4xx, 서버오류 5xx
            //https://developer.apple.com/documentation/foundation/urlresponse
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            
            guard let data = data else {
                print("No data recieved")
                return
            }
//            artworkUrl60
            do {
                let results = try JSONDecoder().decode(MusicResults.self, from: data)
                DispatchQueue.main.async {
                    self.posts = results.results
//                        self.posts = results.music
                    }
            } catch let error {
                print(error.localizedDescription)
            }
            
//            let str = String(decoding: data, as: UTF8.self)
//            print(str)
            
        }
            task.resume()
    }
}
