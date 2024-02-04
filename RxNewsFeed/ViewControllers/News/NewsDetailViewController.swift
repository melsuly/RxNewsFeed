//
//  NewsDetailViewController.swift
//  RxNewsFeed
//
//  Created by Nurasyl Melsuly on 04.02.2024.
//

import UIKit
import SnapKit
import RxSwift

final class NewsDetailViewController: UIViewController {
	
	// MARK: - Properties
	
	private let disposeBag = DisposeBag()
	
	let viewModel: NewsDetailViewModel
	
	// MARK: - Lifecycle
	
	init(viewModel: NewsDetailViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setupConstraints()
		bindViewModel()
	}
	
	// MARK: - Private methods
	
	private func setupViews() {
		view.backgroundColor = .systemBackground
		navigationItem.largeTitleDisplayMode = .never
	}
	
	private func setupConstraints() {
		
	}
	
	private func bindViewModel() {
		viewModel.newsItem
			.bind(onNext: { [weak self] newsItem in
				self?.configure(for: newsItem)
			})
			.disposed(by: disposeBag)
	}
	
	private func configure(for newsItem: News) {
		title = newsItem.title
	}
}
