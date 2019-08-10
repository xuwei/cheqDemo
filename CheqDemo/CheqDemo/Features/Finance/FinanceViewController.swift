//
//  FinanceViewController.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 7/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit
import NavigationDropdownMenu

class FinanceViewController: UIViewController {

    var carouselCollectionViewCell: CarouselCollectionViewCell!
    var gridCollectionViewCell: GridCollectionViewCell!
    @IBOutlet var carouselCollectionView: UICollectionView!
    @IBOutlet var gridCollectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    var viewModel = FinanceViewModel("Expenses")
    //placeholder to avoid optional, since we definitely know we will get them after viewModel loaded
    var carouselCoordintor = CarouselCollectionViewCoordinator(CarouselCoordinatorViewModel())
    var gridCoordinator = GridCollectionViewCoordinator(GridCoordinatorVewModel())
    let theme = sharedAppConfig.activeTheme

    var menuView: NavigationDropdownMenu?
    var menuTitles = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = theme.backgroundColor
        self.title = viewModel.title
        self.menuTitles = self.buildMenuTitles()
        self.carouselCoordintor = CarouselCollectionViewCoordinator(self.viewModel.carouselCoordViewModel)
        self.gridCoordinator = GridCollectionViewCoordinator(self.viewModel.gridCoordViewModel)
        self.pageControl.isUserInteractionEnabled = false
        self.setupCollectionView()
        self.setupDropdown()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sharedAppConfig.showSpinner()
        self.viewModel.load {
            sharedAppConfig.hideSpinner()
            self.pageControl.numberOfPages = self.viewModel.carouselCoordViewModel.barChartModels.count
            self.carouselCollectionView.reloadData()
            self.gridCollectionView.reloadData()
        }
    }

    func buildMenuTitles()->[String] {
        return FinancialPeriod.allStringValues.map{ String("\($0) Expenses") }
    }

    func setupCollectionView() {
        self.carouselCoordintor.carouselDelegate = self
        self.carouselCoordintor.controllerView = self.view
        self.carouselCoordintor.collectionView = self.carouselCollectionView
        self.carouselCollectionView.delegate = self.carouselCoordintor
        self.carouselCollectionView.dataSource = self.carouselCoordintor
        self.gridCoordinator.collectionView = self.gridCollectionView
        self.gridCollectionView.delegate = self.gridCoordinator
        self.gridCollectionView.dataSource = self.gridCoordinator
        setupCollectionViewPadding()
    }

    func setupCollectionViewPadding() {
        switch (self.traitCollection.horizontalSizeClass) {
        case .compact:
            theme.collectionViewPadding(self.carouselCollectionView, cellLength:  CarouselCollectionViewCell.compactSize.width, direction: .horizontal)
            theme.collectionViewPadding(self.gridCollectionView, cellLength: GridCollectionViewCell.compactSize.height, direction: .vertical)
        case .regular:
            theme.collectionViewPadding(self.carouselCollectionView, cellLength:  CarouselCollectionViewCell.regularSize.width, direction: .horizontal)
            theme.collectionViewPadding(self.gridCollectionView, cellLength: GridCollectionViewCell.regularSize.height, direction: .vertical)
        case .unspecified:
            theme.collectionViewPadding(self.carouselCollectionView, cellLength:  CarouselCollectionViewCell.anySize.width, direction: .horizontal)
            theme.collectionViewPadding(self.gridCollectionView, cellLength: GridCollectionViewCell.anySize.height, direction: .vertical)
        @unknown default:
            // detect unhandle trait class before getting out to production
            fatalError("support new enum type")
        }
    }

    func setupDropdown() {
        self.menuView = NavigationDropdownMenu(title: Title.index(0), items: self.menuTitles)
        guard let menuView = menuView else { return }
        menuView.arrowTintColor = theme.linksColor
        menuView.navigationBarTitleFont = theme.headerFont
        menuView.cellTextLabelFont = theme.defaultFont
        self.navigationItem.titleView = menuView
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            print(self.menuTitles[indexPath])
        }
    }
}

// MARK: CarouselCollectionViewCoordinatorDelegate
extension FinanceViewController: CarouselCollectionViewCoordinatorDelegate {
    func updatePaginControl(_ index: Int) {
        self.pageControl.currentPage = index
    }
}

// MARK: ChartCollectionViewCoordinatorDelegate
extension FinanceViewController: ChartCollectionViewCoordinatorDelegate {
    func selectedCell(_ indexPath: IndexPath, collectionView: UICollectionView) {
    }
}

