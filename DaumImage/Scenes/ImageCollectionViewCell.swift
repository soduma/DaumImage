//
//  ImageCollectionViewCell.swift
//  DaumImage
//
//  Created by 장기화 on 2022/04/04.
//

import UIKit
import Kingfisher
import SnapKit

class ImageCollectionViewCell: UICollectionViewCell {
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(photoImageView)
        photoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func fetch(imageURL: String, thumbnailURL: String) {
        guard let url = URL(string: imageURL) else { return }
        photoImageView.kf.setImage(with: url)
    }
}
