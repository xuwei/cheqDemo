//
//  FinanceViewController.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 7/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

class FinanceViewController: UIViewController {
    @IBOutlet var carouselCollectionView: UICollectionView!
    @IBOutlet var gridCollectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue 
    }
}

extension FinanceViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let restoreIdentifier = collectionView.restorationIdentifier ?? ""
        if (restoreIdentifier == "CarouselCollectionView") {
            return 3
        } else {
            return 10
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let restoreIdentifier = collectionView.restorationIdentifier ?? ""
        if (restoreIdentifier == "CarouselCollectionView") {
            let identifier = String(describing: CarouselCollectionViewCell.self)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
            return cell
        } else {
            let identifier = String(describing: GridCollectionViewCell.self)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
            return cell
        }
    }
}
