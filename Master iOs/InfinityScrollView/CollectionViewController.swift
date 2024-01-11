//
//  CollectionViewController.swift
//  Master iOs
//
//  Created by Trung DX on 30/12/2566 BE.
//

import Foundation
import UIKit
#if !os(tvOS)
import SafariServices
#endif

class CollectionViewController:UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.addInfiniteScroll(handler: <#T##(UICollectionView) -> Void#>)
    }
    
}
