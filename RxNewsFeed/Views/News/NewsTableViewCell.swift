//
//  NewsTableViewCell.swift
//  RxNewsFeed
//
//  Created by Nurasyl Melsuly on 04.02.2024.
//

import UIKit
import SnapKit

final class NewsTableViewCell: UITableViewCell, ReusableCell {
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		
		label.font = .preferredFont(forTextStyle: .headline)
		label.textColor = .black
		label.numberOfLines = 0
		
		return label
	}()
	
	private lazy var descriptionLabel: UILabel = {
		let label = UILabel()
		
		label.font = .preferredFont(forTextStyle: .subheadline)
		label.textColor = .secondaryLabel
		
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureCell(withNews news: News) {
		titleLabel.text = news.title
		descriptionLabel.text = news.body
	}
	
	private func setupViews() {
		contentView.addSubview(titleLabel)
		contentView.addSubview(descriptionLabel)
	}
	
	private func setupConstraints() {
		titleLabel.snp.makeConstraints { make in
			make.top.equalToSuperview().inset(8)
			make.horizontalEdges.equalToSuperview().inset(16)
		}
		
		descriptionLabel.snp.makeConstraints { make in
			make.top.equalTo(titleLabel.snp.bottom).offset(4)
			make.horizontalEdges.equalToSuperview().inset(16)
			make.bottom.equalToSuperview().inset(8)
		}
	}
}
