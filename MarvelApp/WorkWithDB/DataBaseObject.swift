//
//  DataBaseObject.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 30.04.2024.
//

import Foundation
import RealmSwift

class HeroObject: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var heroDescription: String
    @Persisted var thumbnail: ThumbnailObject?
    
    convenience init(heroData: HeroModel) {
        self.init()
        self.id = heroData.id
        self.name = heroData.name
        self.heroDescription = heroData.description
        self.thumbnail = ThumbnailObject(thumbnailData: heroData.thumbnail)
    }
}

class ThumbnailObject: EmbeddedObject {
    @Persisted var path: String
    @Persisted var `extension`: String
    
    convenience init(thumbnailData: ThumbnailModel) {
        self.init()
        self.path = thumbnailData.path
        self.extension = thumbnailData.extension
    }
}
