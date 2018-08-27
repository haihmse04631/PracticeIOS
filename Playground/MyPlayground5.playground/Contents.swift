//: Playground - noun: a place where people can play

import UIKit

class Project {
    var name = ""
    var desc = ""
    var startDate = Date()
    
    required init(_ name: String, _ desc: String, _ startDate: String) {
        self.name = name
        self.desc = desc
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormater.locale = Locale(identifier: "en_US_POSIX")
        if let date = dateFormater.date(from: startDate){
            self.startDate = date
        }
    }
}

var projects = [Project("a","aaa","2018-08-20T10:44:00+0000"),
                Project("b","bbb","2018-08-22T10:20:00+0000"),
                Project("c","ccc","2018-08-22T2:40:00+0000"),
                Project("d","ddd","2018-08-16T10:44:00+0000"),
                Project("e","eee","2018-10-20T10:44:00+0000")]

for item in projects {
    print("name: \(item.name) - date: \(item.startDate)")
}

print("+++++++ Sort +++++++++")

projects = projects.sorted(by: {
    $0.startDate.compare($1.startDate) == .orderedDescending
})

for item in projects {
    print("name: \(item.name) - date: \(item.startDate)")
}

print("+++++++ Sort increating +++++++++")

projects = projects.sorted(by: {
    $0.startDate.compare($1.startDate) == .orderedAscending
})

for item in projects {
    print("name: \(item.name) - date: \(item.startDate)")
}



