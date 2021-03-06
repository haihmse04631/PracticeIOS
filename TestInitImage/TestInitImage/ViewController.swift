//
//  ViewController.swift
//  TestInitImage
//
//  Created by Hoàng Hải on 10/28/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

import UIKit

enum StoryboardName: String {
    case main = "Main"
    case home = "Home"
}

extension UIViewController {
    
    func instantiateViewController<T>(fromStoryboard name: StoryboardName, ofType type: T.Type) -> T {
        return storyboard(name: name).instantiateViewController(ofType: type)
    }
    
    func storyboard(name: StoryboardName) -> UIStoryboard {
        return UIStoryboard(name: name.rawValue, bundle: nil)
    }
}

extension UIStoryboard {
    // swiftlint:disable force_cast
    func instantiateViewController<T>(ofType type: T.Type) -> T {
        return instantiateViewController(withIdentifier: String(describing: type)) as! T
    }
}


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("count: \(MainViewModel.categorys.count)")
        collectionView.delegate = self
    }

}

extension ViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let category = MainViewModel.categorys[indexPath.row]
        
        cell.configCell(image: category)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MainViewModel.categorys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height * CGFloat(512/479), height: collectionView.frame.height)
    }
    
}
