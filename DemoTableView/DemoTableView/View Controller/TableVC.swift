//
//  TableVC.swift
//  DemoTableView
//
//  Created by Hoàng Hải on 9/20/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class TableVC: UIViewController {

    let viewModal = TableVCViewModal()
    let disposebag = DisposeBag()
    var zone = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(zone)")
        switch zone {
        case 2:
            viewModal.buttons.value = viewModal.buttons.value.filter{ $0.id != 1 && $0.id != 3 }
        case 3:
            viewModal.buttons.value.remove(at: 1)
        default:
            break
        }
        setupTableCell()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTableCell() {
        viewModal.buttons.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self))
            {
                row, button, cell in
                cell.textLabel?.text = "\(button.id) - \(button.name)"
            }.disposed(by: disposebag)
    }

}
