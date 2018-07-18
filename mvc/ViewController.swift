//
//  ViewController.swift
//  mvc
//
//  Created by 辻林大揮 on 2018/07/12.
//  Copyright © 2018年 chocovayashi. All rights reserved.
//

import UIKit
import RxSwift
import APIKit
import RealmSwift

class ViewController: UIViewController {
    
    private let bag = DisposeBag()
    
    @IBOutlet weak private var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let requestAndSave = Session.sendRequest(request: GetRequest())
            .flatMap { models -> Observable<[Model]> in
                try! realm.write {
                    realm.delete(realm.objects(Model.self))
                    realm.add(models)
                }
                return Observable.just(models)
        }
        
        Observable.concat(Observable.just(Array(realm.objects(Model.self))), requestAndSave)
            .subscribe(
                onNext: { [unowned self] models in
                    self.setView(models)
                }, onError: { error in
                    // Error
            }).disposed(by: bag)
    }
    
    private func setView(_ models: [Model]) {
        label.text = models
            .map { "name: \($0.owner.name), name: \($0.repositoryName)\n" }
            .reduce("") { $0 + $1 }
    }
}
