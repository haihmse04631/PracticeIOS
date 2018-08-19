//
//  ViewController.swift
//  PracticeApp
//
//  Created by Hoàng Hải on 8/19/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let viewModal = CitiesViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        configTable()
        configSearchBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func configSearchBar() {
        searchBar
            .rx.text
            .orEmpty
            .subscribe(onNext: { [unowned self] query in
                self.viewModal.showCities.value = self.viewModal.cities.filter { $0.hasPrefix(query) }
                self.tableView.reloadData() 
            })
            .disposed(by: disposeBag)}
    
    private func configTable() {
        viewModal.showCities.asObservable().bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self))
        {
            row, value, cell in
            cell.textLabel?.text = value
        }.disposed(by: disposeBag)
    }


}

