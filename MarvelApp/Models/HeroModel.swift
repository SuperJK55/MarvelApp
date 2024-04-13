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
}

struct ThumbnailModel: Codable {
    let path: String
    let `extension`: String
}


