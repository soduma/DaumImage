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
    var imageString: String
    let datetime: String
    let displaySiteName: String
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    private lazy var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var timeLable: UILabel = {
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
    
//    private lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.contentMode = .scaleAspectFit
//        return tableView
//    }()
    
    init(imageString: String, datetime: String, displaySiteName: String) {
        self.imageString = imageString
        self.datetime = datetime
        self.displaySiteName = displaySiteName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(imageString)
//        contentView.clipsToBounds = true
        contentView.backgroundColor = .systemYellow
//        contentView.contentMode = .scaleAspectFit
//        detailImageView.backgroundColor = .systemMint
        
        view.backgroundColor = .black
        layout()
        setImage()
    }
    
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        print("gdgd")
//        layout()
//    }
    
//    func layout() {
//        [tableView, detailImageView]
//            .forEach { view.addSubview($0) }
//
//        tableView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//    }
    
//    private func layout() {
//        view.addSubview(scrollView)
//        scrollView.snp.makeConstraints {
//            $0.top.trailing.leading.bottom.equalToSuperview()
//        }
//
//        scrollView.addSubview(contentView)
//        contentView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//            $0.width.equalToSuperview()
//        }
//
//        contentView.addSubview(detailImageView)
//        detailImageView.snp.makeConstraints {
////            $0.top.leading.trailing.bottom.equalToSuperview()
//            $0.edges.equalToSuperview()
//            $0.height.equalTo(300)
////            $0.center.equalToSuperview()
//        }
//
////        contentView.clipsToBounds = true
////        detailImageView.clipsToBounds = true
////        view.layoutIfNeeded()
//    }
    
    
    
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.trailing.leading.bottom.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
//            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
//            $0.top.equalToSuperview()
//            $0.width.equalToSuperview()
        }

        contentView.addSubview(detailImageView)
        detailImageView.snp.makeConstraints {
//            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.edges.equalToSuperview()
//            $0.top.leading.trailing.equalToSuperview()

//            $0.height.equalTo(detail)
//            $0.center.equalToSuperview()
        }

//        contentView.clipsToBounds = true
//        detailImageView.clipsToBounds = true
        contentView.layoutIfNeeded()
    }
    
    
    
    
    
//    private func layout() {
//        view.addSubview(scrollView)
//        scrollView.addSubview(contentView)
//        contentView.addSubview(detailImageView)
//
//        scrollView.snp.makeConstraints {
////            $0.edges.equalTo(0)
//            $0.edges.equalToSuperview()
//        }
//
//        detailImageView.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.top.equalToSuperview()
////            $0.width.equalToSuperview()
//            $0.width.equalTo(scrollView).offset(50)
//            $0.height.equalTo(detailImageView.snp.height)
//        }
//
//        contentView.snp.makeConstraints {
//            $0.edges.equalTo(detailImageView)
////            $0.width.equalTo(view.frame.width)
//            $0.width.equalTo(scrollView)
////            $0.height.equalTo(view.frame.height)
//        }
//
//
//        contentView.clipsToBounds = true
//        detailImageView.clipsToBounds = true
//    }
    
//    private func layout() {
//        contentView.addSubview(detailImageView)
//
//        detailImageView.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.top.equalToSuperview()
//            //            $0.width.equalToSuperview()
////            $0.width.equalTo(scrollView).offset(50)
//            $0.height.equalTo(detailImageView.snp.height)
//        }
//
//        view.addSubview(scrollView)
//        scrollView.snp.makeConstraints {
////            $0.edges.equalTo(0)
//            $0.edges.equalToSuperview()
//        }
//
//        scrollView.addSubview(contentView)
//        contentView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
////            $0.width.equalTo(view.frame.width)
//            $0.width.equalToSuperview()
//            $0.height.equalTo(view.frame.height)
//        }
//
//
//        contentView.clipsToBounds = true
//        detailImageView.clipsToBounds = true
//    }
    
//    private func layout() {
//        let stackView = UIStackView(arrangedSubviews: [siteLabel, timeLable])
//        stackView.axis = .vertical
//        stackView.spacing = 4
//        stackView.distribution = .fillEqually
//
//        [detailImageView, stackView]
//            .forEach { contentView.addSubview($0) }
//
////        contentView.addSubview(detailImageView)
//
//        detailImageView.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.top.equalToSuperview()
////            $0.width.equalToSuperview()
////            $0.width.equalTo(scrollView).offset(50)
//            $0.height.equalTo(detailImageView)
//        }
//
//        view.addSubview(scrollView)
//        scrollView.snp.makeConstraints {
////            $0.edges.equalTo(0)
//            $0.edges.equalToSuperview()
//        }
//
//        scrollView.addSubview(contentView)
//        contentView.snp.makeConstraints {
////            $0.edges.equalToSuperview()
//            $0.top.leading.trailing.equalToSuperview()
////            $0.width.equalTo(view.frame.width)
////            $0.width.equalTo(view.safeAreaLayoutGuide)
//            $0.width.equalTo(scrollView)
////            $0.height.equalTo(view.frame.height)
//            $0.height.equalTo(detailImageView)
//        }
//
//        stackView.snp.makeConstraints {
//            $0.top.leading.equalTo(detailImageView)
//        }
//
//        contentView.clipsToBounds = true
//        detailImageView.clipsToBounds = true
//    }
    
    
    private func setImage() {
//        imageString = "https://i.pinimg.com/564x/85/0e/d9/850ed9aa272e199ecbec87774a18dee1.jpg"
//        imageString = "https://i.kym-cdn.com/photos/images/original/001/295/524/cda.jpg"
        guard let url = URL(string: imageString) else { return }
        detailImageView.kf.setImage(with: url)
    }
}
