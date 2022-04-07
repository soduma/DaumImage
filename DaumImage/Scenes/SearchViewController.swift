//
//  SearchViewController.swift
//  DaumImage
//
//  Created by 장기화 on 2022/04/04.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    private var timer = Timer()
    
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.text = "Brandi"
        label.font = .systemFont(ofSize: 150, weight: .bold)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    @objc func searchLogic() {
        if timer.userInfo != nil {
            guard let searchText = timer.userInfo as? String,
                  searchText != "" else { return }
            navigationController?.pushViewController(ImageViewController(keyword: searchText), animated: true)
        }
        timer.invalidate()
    }
    
    @objc func tapBack() {
        searchBar.resignFirstResponder()
    }
    
    private func layout() {
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(tapBack))
        view.addGestureRecognizer(backGesture)

        [searchLabel, searchBar]
            .forEach { view.addSubview($0) }
        
        searchLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().dividedBy(1.5)
            $0.leading.trailing.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(searchLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(searchLogic), userInfo: searchText, repeats: false)
    }
}
