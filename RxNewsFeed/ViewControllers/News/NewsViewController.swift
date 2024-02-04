//
//  NewsViewController.swift
//  RxNewsFeed
//
//  Created by Nurasyl Melsuly on 04.02.2024.
//

import UIKit
import SnapKit
import RxSwift

class NewsViewController: UIViewController {

	// MARK: - Properties
	private let disposeBag = DisposeBag()
	
	let viewModel: NewsViewModel
	let coordinator: AppCoordinator
	
	// MARK: - UI Elements
	private lazy var newsTableView: UITableView = {
		let tableView = UITableView()
		
		tableView.rowHeight = UITableView.automaticDimension
		tableView.register(cellType: NewsTableViewCell.self)
		
		return tableView
	}()
	
	// MARK: - Lifecycle
	
	init(viewModel: NewsViewModel, coordinator: AppCoordinator) {
		self.viewModel = viewModel
		self.coordinator = coordinator
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
	
	private func setupViews() {
		title = "News"
		navigationItem.backButtonTitle = ""
		view.backgroundColor = .systemBackground
		view.addSubview(newsTableView)
	}
	
	private func setupConstraints() {
		newsTableView.snp.makeConstraints { make in
			make.edges.equalTo(view.safeAreaLayoutGuide)
		}
	}
	
	private func bindViewModel() {
		viewModel.news
			.bind(to: newsTableView.rx.items(cellIdentifier: NewsTableViewCell.identifier, cellType: NewsTableViewCell.self)) { _, newsItem, cell in
				cell.configureCell(withNews: newsItem)
			}
			.disposed(by: disposeBag)
		
		newsTableView.rx.modelSelected(News.self)
			.bind { [weak self] newsItem in
				self?.coordinator.showNewsDetail(for: newsItem.id)
			}
			.disposed(by: disposeBag)
	}
}

