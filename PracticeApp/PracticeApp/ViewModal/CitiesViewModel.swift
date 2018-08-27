//
//  CitiesViewModel.swift
//  PracticeApp
//
//  Created by Hoàng Hải on 8/19/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class CitiesViewModel {
    
    let cities = ["Ha Noi", "Da Nang", "Hung Yen", "Hoi An", "Ho Chi Minh", "Ca Mau", "Bac Ninh", "Lao Cai", "Lam Dong"]
    var showCities = Variable([String]())
    
    init() {
        self.showCities.value = cities
    }
    
}
