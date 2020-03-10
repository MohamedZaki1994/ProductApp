//
//  ItemViewController.swift
//  ProductApp
//
//  Created by Mohamed Mahmoud Zaki on 3/6/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var imageNames: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ItemCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.width/2) - 5, height: view.frame.height/3)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        collectionView.collectionViewLayout = layout
    }
}

extension ItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageNames?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath)
        guard let itemCell = cell as? ItemCollectionViewCell else {
            return cell
        }
        itemCell.imageView.image = UIImage(named: imageNames?[indexPath.row] ?? "")
        itemCell.titleLabel.text = imageNames?[indexPath.row] ?? ""
        itemCell.priceLabel.text = "50 $"
        return itemCell
    }
}
