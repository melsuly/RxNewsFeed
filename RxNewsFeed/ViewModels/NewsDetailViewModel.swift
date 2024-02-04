//
//  NewsDetailViewModel.swift
//  RxNewsFeed
//
//  Created by Nurasyl Melsuly on 04.02.2024.
//

import Foundation
import RxSwift

final class NewsDetailViewModel {
	
	// MARK: - Private properties
	
	private let disposeBag = DisposeBag()
	private let newsService: NewsService
	private let id: Int
	
	let newsItem: PublishSubject<News> = PublishSubject()
	
	init(withId id: Int, newsService: NewsService) {
		self.id = id
		self.newsService = newsService
		
		bindNewsService()
	}
	
	private func bindNewsService() {
		newsService.fetchNews(withId: id)
			.bind(to: newsItem)
			.disposed(by: disposeBag)
	}
}
