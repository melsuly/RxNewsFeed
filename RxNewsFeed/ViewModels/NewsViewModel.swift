//
//  NewsViewModel.swift
//  RxNewsFeed
//
//  Created by Nurasyl Melsuly on 04.02.2024.
//

import Foundation
import RxSwift
import RxCocoa

final class NewsViewModel {
	
	// MARK: - Private properties
	
	private let newsService: NewsService
	private let disposeBag = DisposeBag()
	
	// MARK: - Public properties
	
	let news: PublishSubject<[News]> = PublishSubject()
	
	// MARK: - Lifecycle
	
	init(newsService: NewsService) {
		self.newsService = newsService
		bindService()
	}
	
	// MARK: - Private methods
	
	private func bindService() {
		newsService.fetchNews()
			.bind(to: news)
			.disposed(by: disposeBag)
	}
}
