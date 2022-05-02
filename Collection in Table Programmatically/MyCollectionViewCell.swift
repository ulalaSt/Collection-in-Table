//
//  MyCollectionViewCell.swift
//  Collection in Table Programmatically
//
//  Created by user on 04.03.2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyCollectionViewCell"
    
    private var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "circle")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(imagename: String) {
        myImageView.image = UIImage(named: imagename)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = contentView.frame
    }
}
