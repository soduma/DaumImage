//
//  ImageViewController.swift
//  DaumImage
//
//  Created by 장기화 on 2022/04/04.
//

import UIKit
import SnapKit

class ImageViewController: UIViewController {
    let networkManager = NetworkManager()
    var imageList: [Documents] = []
    let keyword: String
    var currentPage = 1
    var valueOfIsEnd = false
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = view.bounds.width / 3 - 0.75
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.itemSize = CGSize(width: width, height: width)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    private lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "검색 결과가 없습니다. 🥺"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.backgroundColor = .systemBackground
        return label
    }()
    
    init(keyword: String) {
        self.keyword = keyword
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        Task {
            await fetch()
            layout()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emptyLabel.isHidden = true
    }
    
    private func layout() {
        [collectionView, emptyLabel]
            .forEach { view.addSubview($0) }
        
        emptyLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func fetch() async {
        let result = await networkManager.getImage(keyword: keyword, page: currentPage)
        print(result)
        
        if result.documents.count == 0 {
            emptyLabel.isHidden = false
        } else {
            imageList = result.documents
            valueOfIsEnd = result.meta.isEnd
        }
    }
}

extension ImageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("😄\( imageList.count)")
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        
        let image = imageList[indexPath.row].thumbnailURL
        cell.setImage(thumbnailURL: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let imageURL = imageList[indexPath.row].imageURL
        let datetime = imageList[indexPath.row].datetime
        let displaySiteName = imageList[indexPath.row].displaySiteName
        let vc = DetailImageViewController(imageString: imageURL, datetime: datetime, displaySiteName: displaySiteName)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset_y = scrollView.contentOffset.y
        let collectionViewContentSize = collectionView.contentSize.height
        let pagination_y = collectionViewContentSize * 0.5

        if contentOffset_y > collectionViewContentSize - pagination_y {
            currentPage += 1

            Task {
                if valueOfIsEnd == false {
                    let result = await networkManager.getImage(keyword: keyword, page: currentPage)
                    
                    imageList += result.documents
                    valueOfIsEnd = result.meta.isEnd
                    collectionView.reloadData()
                } else {
//                    print(valueOfIsEnd)
                    return
                }
            }
        }
    }
}
