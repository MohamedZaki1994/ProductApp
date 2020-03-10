//
//  ViewController.swift
//  ProductApp
//
//  Created by Mohamed Mahmoud Zaki on 3/6/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var presenter: MainPresenter?

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.width/2) - 5, height: view.frame.height/3)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        collectionView.collectionViewLayout = layout
        presenter?.viewController = self
        presenter?.viewDidLoad()
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.dataSource?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath)
        guard let categoryCell = cell as? CategoryCollectionViewCell else {
            return cell
        }
        presenter?.configureCell(index: indexPath.row, cell: categoryCell)
        return categoryCell
    }
}
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectRow(index: indexPath.row)
    }
}

extension MainViewController: MainVCProtocol {

    func configureCell(imageName: String, title: String, cell: CategoryCollectionViewCell) {
        cell.titleLabel.text = title
        cell.imageView.image = UIImage(named: imageName)
    }
}
