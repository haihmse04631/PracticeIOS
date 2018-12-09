//
//  ViewController.swift
//  DemoAddView
//
//  Created by Hoàng Hải on 11/11/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

enum StoryboardName: String {
    case main = "Main"
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

class ViewController: UIViewController {
    
    @IBOutlet weak var headerView: DemoView!
    var observer: AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.configContent("FirstVC", "ahihi Ahoho", true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        observer = NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeTitleNextButton(_:)),
                                               name: .hihiTitleNoti,
                                               object: nil) as AnyObject    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //NotificationCenter.default.removeObserver(self, name: .hihiTitleNoti, object: nil)
    }
    
    @objc func changeTitleNextButton(_ notification: Notification) {
       print("We have a Notification")
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let secondVC = self.instantiateViewController(fromStoryboard: .main, ofType: Demo1VC.self)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}

