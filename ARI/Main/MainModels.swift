//
//  MainModels.swift
//  ARI
//
//  Created by Maxim Spiridonov on 17/05/2019.
//  Copyright (c) 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

enum Main {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getCurrentPage(page: Int)
        case tappedBottomControls(buttonName: String)
      }
    }
    struct Response {
      enum ResponseType {
        case setColorCategoryName(index: Int)
        case setSelfToSegue(segueName: String)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayARScene(segueName: String)
      }
    }
  }
  
}


