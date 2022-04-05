//
//  SearchViewController.swift
//  DaumImage
//
//  Created by 장기화 on 2022/04/04.
//

import UIKit
import SnapKit
import SwiftUI

class SearchViewController: UIViewController {
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.text = "Brandi"
        label.font = .systemFont(ofSize: 180, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "검색어를 입력하세요"
        bar.searchBarStyle = .minimal
        bar.delegate = self
        return bar
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("검색", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.layer.cornerRadius = 12
        button.backgroundColor = .label
        button.addTarget(self, action: #selector(tapSearchButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    @objc func tapSearchButton() {
        navigationController?.pushViewController(ImageViewController(), animated: true)
    }
    
    private func layout() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(searchButton)
        
        [searchLabel, stackView]
            .forEach { view.addSubview($0) }
        
        searchLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(searchLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(60)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.trailing.equalTo(searchButton.snp.leading)
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        print(searchBar.text)
//    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(searchBar.text)
    }
}
