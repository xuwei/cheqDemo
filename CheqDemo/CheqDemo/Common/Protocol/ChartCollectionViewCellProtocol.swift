//
//  CardViewProtocol.swift
//  CheqDemo
//
//  Created by XUWEI LIANG on 7/8/19.
//  Copyright © 2019 WiseTree Solutions Pty Ltd. All rights reserved.
//

import UIKit

protocol ChartCollectionViewCellProtocol {

    static var compactSize: CGSize { get }
    static var regularSize: CGSize { get }
    static var anySize: CGSize { get }

    func setup(completion: (UIView)->Void)
    func animate()
}
