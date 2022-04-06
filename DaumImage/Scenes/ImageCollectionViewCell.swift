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
    private let photoImageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(photoImageView)
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setImage(thumbnailURL: String) {
        guard let url = URL(string: thumbnailURL) else { return }
        photoImageView.kf.setImage(with: url)
    }
}
