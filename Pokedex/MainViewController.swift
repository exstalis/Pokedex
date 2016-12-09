//
//  MainViewController.swift
//  Pokedex
//
//  Created by elif ece arslan on 12/9/16.
//  Copyright © 2016 KolektifLabs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


private typealias CollectionDelegate = MainViewController
extension CollectionDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


private typealias CollectionDelegateFlowLayout = MainViewController
extension CollectionDelegateFlowLayout: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}

private typealias CollectionDataSource = MainViewController
extension CollectionDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"PokeCell", for: indexPath) as? PokeCell {
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
}
