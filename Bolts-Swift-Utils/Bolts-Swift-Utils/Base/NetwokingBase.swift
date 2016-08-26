//
//  NetwokingBase.swift
//  Bolts-Swift-Utils
//
//  Created by thinhvoxuan on 8/26/16.
//  Copyright © 2016 Thinhvoxuan. All rights reserved.
//

import UIKit
import BoltsSwift
import Alamofire

class NetwokingBase: NSObject {
    func fetchRequest(url: String) -> Task<AnyObject> {
        let task = TaskCompletionSource<AnyObject>()
        Alamofire.request(.GET, url).responseJSON { response in
            switch response.result {
            case .Success(let value):
                task.set(result: value)
            case .Failure(let error):
                task.set(error: error)
            }
        }
        return task.task
    }
}
