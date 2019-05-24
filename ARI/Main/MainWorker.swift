//
//  MainWorker.swift
//  ARI
//
//  Created by Maxim Spiridonov on 17/05/2019.
//  Copyright (c) 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

class MainService {

    func getSegueName(buttonName: String) -> String? {
        switch buttonName {
        case "plus": return "selfToARSceneSegueName"
        default:
            return nil
        }
    }
}
