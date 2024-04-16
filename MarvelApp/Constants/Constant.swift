//
//  Constant.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 07.03.2024.
//

import UIKit

let cellWidth = (3 / 4) * UIScreen.main.bounds.width
let cellHeight = (3 / 4.5) * UIScreen.main.bounds.height
let spacing = (1 / 8) * UIScreen.main.bounds.width
let cellSpacing = (1 / 16) * UIScreen.main.bounds.width

let cardFrame = CGRect(x: 50, y: 25, width: cellWidth, height: cellHeight)

let SizeTriangle = CGRect(x: 0, y: UIScreen.main.bounds.height * 0.3, width: UIScreen.main.bounds.width, height: cellHeight + 50)

let api_key = "0cabb67411dadf3f11a4d1fdccad0dfd"
let secret_api_key = "8418f99792f34ec58a080e004bed9920264e72f9"

let standart_url = "https://gateway.marvel.com/v1/public/"
