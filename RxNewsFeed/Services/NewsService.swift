//
//  NewsService.swift
//  RxNewsFeed
//
//  Created by Nurasyl Melsuly on 04.02.2024.
//

import Foundation
import Alamofire
import SVProgressHUD
import RxSwift

protocol NewsServiceProtocol {
	func fetchNews() -> Observable<[News]>
	func fetchNews(withId id: Int) -> Observable<News>
}

final class NewsService: NewsServiceProtocol {
	func fetchNews() -> Observable<[News]> {
		return Observable.create { observer in
			let endpoint = APIEndpoints.posts
			
			SVProgressHUD.show()
			
			let request = AF.request(endpoint.stringValue, method: endpoint.method).responseDecodable(of: [News].self) { response in
				SVProgressHUD.dismiss()
				
				switch response.result {
					case .success(let news):
						observer.onNext(news)
					case .failure(let error):
						SVProgressHUD.showError(withStatus: error.localizedDescription)
						observer.onError(error)
				}
				
				observer.onCompleted()
			}
			
			return Disposables.create {
				request.cancel()
			}
		}
	}
	
	func fetchNews(withId id: Int) -> Observable<News> {
		return Observable.create { observer in
			let endpoint = APIEndpoints.post(id: id)
			
			SVProgressHUD.show()
			
			let request = AF.request(endpoint.stringValue, method: endpoint.method).responseDecodable(of: News.self) { response in
				SVProgressHUD.dismiss()
				
				switch response.result {
					case .success(let news):
						observer.onNext(news)
					case .failure(let error):
						SVProgressHUD.showError(withStatus: error.localizedDescription)
						observer.onError(error)
				}
				
				observer.onCompleted()
			}
			
			return Disposables.create {
				request.cancel()
			}
		}
	}
}
