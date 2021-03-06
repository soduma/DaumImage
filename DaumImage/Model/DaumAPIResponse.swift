//
//  DaumAPIResponse.swift
//  DaumImage
//
//  Created by 장기화 on 2022/04/04.
//

import Foundation

struct DaumAPIResponse: Codable {
    let documents: [Documents]
    let meta: Meta
}

struct Documents: Codable {
    let datetime: String
    let displaySiteName: String
    let imageURL: String
    let thumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case datetime
        case displaySiteName = "display_sitename"
        case imageURL = "image_url"
        case thumbnailURL = "thumbnail_url"
    }
}

struct Meta: Codable {
    let isEnd: Bool
    
    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
    }
}
