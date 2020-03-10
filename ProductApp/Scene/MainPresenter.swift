//
//  MainPresenter.swift
//  ProductApp
//
//  Created by Mohamed Mahmoud Zaki on 3/10/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import Foundation

protocol MainVCProtocol: class {
    func configureCell(imageName: String, title: String, cell: CategoryCollectionViewCell)
}

class MainPresenter {
    weak var viewController: MainVCProtocol?

    // data source
    var dataSource: [String]?
    var categoryTypes = ["BOSS","Dunhill","One man show", "Lacoste", "Black code"]
    var imageCategoryName = ["boss","dunhill","onemanshow","Lacoste","Blackcode"]
    var bossImageName = ["boss","boss1","boss2","boss3"]
    var dunhilImageName = ["dunhill","dunhill2","dunhill3","dunhill4"]
    var oneManeShowImangeName = ["onemanshow","onemanshow2","onemanshow3"]
    var lacosteImangeName = ["Lacoste","Lacoste2","Lacoste3"]
    var blackCodeImageName = ["Blackcode","Blackcode2","Blackcode3","Blackcode4"]
    //

    func viewDidLoad() {
        dataSource = imageCategoryName
    }

    func configureCell(index: Int, cell: CategoryCollectionViewCell) {
        viewController?.configureCell(imageName: imageCategoryName[index], title: imageCategoryName[index], cell: cell)
    }

    func didSelectRow(index: Int) {
        guard let viewcontroller = viewController as? MainViewController else {return}
        var data: [String]?
        switch categoryTypes[index] {
        case "BOSS":
            data = bossImageName
        case "Dunhill":
            data = dunhilImageName
        case "One man show":
            data = oneManeShowImangeName
        case "Lacoste":
            data = lacosteImangeName
        default:
            data = blackCodeImageName
        }
        MainRouter.navigateToDetailedScreen(from: viewcontroller, dataSource: data)
    }

}
