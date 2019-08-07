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

    let carouselCoordintor = CarouselCollectionViewCoordinator()
    let gridCoordinator = GridCollectionViewCoordinator()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        carouselCollectionView.delegate = carouselCoordintor
        carouselCollectionView.dataSource = carouselCoordintor
        gridCollectionView.delegate = gridCoordinator
        gridCollectionView.dataSource = gridCoordinator
    }
}
