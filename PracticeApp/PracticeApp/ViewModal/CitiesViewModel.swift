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
    let projects = [
        SectionOfProject(header: "First Section", items: [Project(1,"Project 1","Ahihi"),
                                                          Project(1,"Project 2","Ahoho"),
                                                          Project(1,"Project 3","Ahihi"),
                                                          Project(1,"Project 4","Ahihiki")]),
        SectionOfProject(header: "Third Section", items: [Project(1,"Project 9","Ahihi"),
                                                          Project(1,"Project 10","Ahoho")]),
        SectionOfProject(header: "Second Section", items: [Project(1,"Project 5","Ahihi"),
                                                          Project(1,"Project 6","Ahoho"),
                                                          Project(1,"Project 8","Ahihiki")])
    ]
    var showProjects = Variable([SectionOfProject]())
    
    init() {
        self.showProjects.value = projects
    }
    
}
