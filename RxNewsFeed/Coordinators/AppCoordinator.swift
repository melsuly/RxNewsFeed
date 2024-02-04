//
//  AppCoordinator.swift
//  RxNewsFeed
//
//  Created by Nurasyl Melsuly on 04.02.2024.
//

import UIKit

final class AppCoordinator: Coordinator {
	
	// MARK: - Properties
	
	let window: UIWindow
	let navigationController: UINavigationController
	
	// MARK: - Lifecycle
	
	init(window: UIWindow) {
		self.window = window
		self.navigationController = UINavigationController()
	}
	
	// MARK: - Public methods
	
	func start() {
		let newsVC = NewsViewController(viewModel: NewsViewModel(newsService: NewsService()), coordinator: self)
		
		navigationController.navigationBar.prefersLargeTitles = true
		navigationController.pushViewController(newsVC, animated: false)
		
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
	
	func showNewsDetail(for id: Int) {
		let newsDetailVC = NewsDetailViewController(viewModel: NewsDetailViewModel(withId: id, newsService: NewsService()))
		
		navigationController.pushViewController(newsDetailVC, animated: true)
	}
}
