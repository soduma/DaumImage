//
//  NetworkManager.swift
//  DaumImage
//
//  Created by 장기화 on 2022/04/04.
//

import Foundation
import Alamofire

struct NetworkManager {
    func getImage(keyword: String, page: Int) async -> DaumAPIResponse {
        let url = "https://dapi.kakao.com/v2/search/image?size=30&page=\(page)&query=\(keyword)"
        let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        let header: HTTPHeaders = [
            "Authorization": "KakaoAK ef58731412161dc5c57435378c32bdc9"
        ]
        
        let data = try! await AF.request(urlString, method: .get, headers: header)
            .serializingDecodable(DaumAPIResponse.self).value
        return data
    }
}
