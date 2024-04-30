//
//  HeroModel.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 07.03.2024.
//

import Foundation
import UIKit

struct HeroData: Codable {
    let code: Int
    let status: String
    let data: HeroList
}

struct HeroList: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [HeroModel]
}

struct HeroModel: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: ThumbnailModel
    
    init(id: Int = 0, name: String = "", description: String = "", thumbnail: ThumbnailModel = ThumbnailModel()) {
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
    }
}

struct ThumbnailModel: Codable {
    let path: String
    let `extension`: String
    
    init(path: String = "", `extension`: String = "") {
        self.path = path
        self.`extension` = `extension`
    }
}

extension HeroModel {
    
    init(heroObject: HeroObject) {
        self.id = heroObject.id
        self.name = heroObject.name
        self.description = heroObject.description
        self.thumbnail = ThumbnailModel(thumbnailObject: heroObject.thumbnail!)
    }
}

extension ThumbnailModel {
    init(thumbnailObject: ThumbnailObject) {
        self.path = thumbnailObject.path
        self.extension = thumbnailObject.extension
    }
}


