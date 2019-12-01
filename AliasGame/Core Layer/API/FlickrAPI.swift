//
//  FlickrAPI.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 01/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

class FlickrAPI {
    
    struct PesponseModel: Codable {
        let photos: PhotosModel
    }
    
    struct PhotosModel: Codable {
        let photo: [PhotoModel]
    }
    
    struct PhotoModel: Codable {
        // Опциональное, потому что иногда в запросах этот параметр отсуствует,
        // что приводит к ошибке при использовании JSONDecoder
        let url_m: String?
        let url_z: String?
        let title: String
    }
    
    private static let apiKey = "dab4052df3cc23ed39745a8cca163e0a"
    
    private static let baseUrl = "https://www.flickr.com/services/rest/"
    
    static func searchPath(text: String, extras: String, perPage: Int, page: Int) -> URL {
        
        guard var components = URLComponents(string: baseUrl) else {
            return URL(string: baseUrl)!
        }
        
        let methodItem = URLQueryItem(name: "method", value: "flickr.photos.search")
        let apiKeyItem = URLQueryItem(name: "api_key", value: apiKey)
        let textItem = URLQueryItem(name: "text", value: text)
        let extrasItem = URLQueryItem(name: "extras", value: extras)
        let formatItem = URLQueryItem(name: "format", value: "json")
        let sortItem = URLQueryItem(name: "sort", value: "relevance")
        let safeSearchItem = URLQueryItem(name: "safe_search", value: "1")
        let contentTypeItem = URLQueryItem(name: "content_type", value: "1")
        let nojsoncallbackItem = URLQueryItem(name: "nojsoncallback", value: "1")
        let perPageItem = URLQueryItem(name: "per_page", value: String(perPage))
        let pageItem = URLQueryItem(name: "page", value: String(page))
        
        components.queryItems = [methodItem, apiKeyItem, textItem, extrasItem,
                                 formatItem, sortItem, safeSearchItem, contentTypeItem,
                                 nojsoncallbackItem, perPageItem, pageItem]
        return components.url!
    }
    
}
