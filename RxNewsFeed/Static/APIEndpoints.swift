//
//  APIEndpoints.swift
//  RxNewsFeed
//
//  Created by Nurasyl Melsuly on 04.02.2024.
//

import Foundation
import Alamofire

enum APIEndpoints {
	static let baseURL = "https://jsonplaceholder.typicode.com"
	
	case posts
	case post(id: Int)
	
	var path: String {
		switch self {
			case .posts:
				return "posts"
			case .post(let id):
				return "posts/\(id)"
		}
	}
	
	var method: HTTPMethod {
		switch self {
			case .posts, .post:
				return .get
		}
	}
	
	var stringValue: String {
		return "\(APIEndpoints.baseURL)/\(path)"
	}
}
