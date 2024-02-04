//
//  News.swift
//  RxNewsFeed
//
//  Created by Nurasyl Melsuly on 04.02.2024.
//

import Foundation

struct News: Decodable {
	let id: Int
	let title: String
	let body: String
}
