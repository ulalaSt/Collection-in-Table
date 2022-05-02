//
//  MyTableViewCell.swift
//  Collection in Table Programmatically
//
//  Created by user on 04.03.2022.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    static var id = "MyTableViewCell"
    var data = [String]()
    var collection: UICollectionView!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure() {
        let h = contentView.frame.size.height
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: h, height: h)
        collection = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collection.frame = contentView.frame
        collection.backgroundColor = .gray
        collection.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collection.dataSource = self
        collection.delegate = self
        self.addSubview(collection)
    }
}

extension MyTableViewCell: UICollectionViewDelegate{
    
}
extension MyTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        cell.configure(imagename: data[indexPath.row])
        cell.backgroundColor = .orange
        return cell
    }
    
    
}
