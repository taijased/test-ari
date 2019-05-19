//
//  AuthorizationModels.swift
//  ARI
//
//  Created by Maxim Spiridonov on 19/05/2019.
//  Copyright (c) 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

enum Authorization {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getUser(socialName: String)
      }
    }
    struct Response {
      enum ResponseType {
        case presentUserInfo(user: UserResponse?)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
      }
    }
  }
  
}
