//
//  ImageProvider.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class FlickrImageProvider: ImageProviderProtocol {
    
    weak var delegate: ImageProviderDelegate?

    private var networking: NetworkingProtocol

    init(networking: NetworkingProtocol) {
        self.networking = networking
        self.networking.delegate = self
    }
    
    func getImage(with text: String, completion: @escaping (UIImage?) -> Void) {
        downloadImageList(by: text, perPage: 25, page: 1) { photoModels in
            guard !photoModels.isEmpty else {
                debugPrint("[FlickrImageProvider]: photoModels is empty")
                completion(nil)
                return
            }
            for photoModel in photoModels {
                if let url_m = photoModel.url_m, let url = URL(string: url_m) {
                    self.downloadImage(at: url, completion: completion)
                    return
                } else {
                    continue
                }
            }
            debugPrint("[FlickrImageProvider]: all url_m are nil for text \(text)")
            completion(nil)
        }
    }
    
    private func downloadImage(at path: URL, completion: @escaping (UIImage?) -> Void) {
        networking.getData(at: path) { data in
            guard let data = data else {
                debugPrint("[FlickrImageProvider]: не удалось загрузить картинку \(path)")
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }
    }
    
    private func downloadImageList(by searchString: String, perPage: Int, page: Int, completion: @escaping ([FlickrAPI.PhotoModel]) -> Void) {
        let url = FlickrAPI.searchPath(text: searchString, extras: "url_m,url_z", perPage: perPage, page: page)
        networking.getData(at: url) { data in
            guard let data = data else {
                print("[FlickrImageProvider]: не удалось загрузить список картинок по запросу – \(searchString)")
                completion([])
                return
            }
            do {
                let photos = try JSONDecoder().decode(FlickrAPI.PesponseModel.self, from: data).photos.photo
                completion(photos)
            } catch {
                print("[FlickrImageProvider]: " + error.localizedDescription)
                return completion([])
            }
        }
    }

}

extension FlickrImageProvider: NetworkingDelegate {
    
}
