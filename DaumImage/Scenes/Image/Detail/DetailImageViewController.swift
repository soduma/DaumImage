//
//  DetailImageViewController.swift
//  DaumImage
//
//  Created by 장기화 on 2022/04/05.
//

import UIKit
import Kingfisher
import SnapKit

class DetailImageViewController: UIViewController {
    private var imageString: String
    private var datetime: String
    private let displaySiteName: String
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = datetime
        label.font = .systemFont(ofSize: 10, weight: .light)
        return label
    }()
    
    private lazy var siteLabel: UILabel = {
        let label = UILabel()
        label.text = displaySiteName
        label.font = .systemFont(ofSize: 10, weight: .light)
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold)
        button.setImage(UIImage(systemName: "xmark", withConfiguration: config), for: .normal)
        button.tintColor = .label
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
        return button
    }()
    
    init(imageString: String, datetime: String, displaySiteName: String) {
        self.imageString = imageString
        self.datetime = datetime
        self.displaySiteName = displaySiteName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage()
        layout()
        print(imageString)
    }
    
    @objc func tapCloseButton() {
        dismiss(animated: true)
    }
}

extension DetailImageViewController {
    private func layout() {
        view.backgroundColor = .black
        scrollView.backgroundColor = .black
        contentView.backgroundColor = .black
        scrollView.showsVerticalScrollIndicator = false
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.leading.bottom.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        contentView.addSubview(detailImageView)
        detailImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.trailing.equalTo(scrollView).inset(20)
            $0.width.height.equalTo(30)
        }
        
        let stackView = UIStackView(arrangedSubviews: [siteLabel, timeLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .systemGray6
        
        detailImageView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.bottom.leading.equalTo(detailImageView)
        }
    }
    
    private func setImage() {
        guard let url = URL(string: imageString) else { return }
        detailImageView.kf.setImage(with: url)
    }
}
