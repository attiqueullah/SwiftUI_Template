//
//  BaseViewModel.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 08/05/2023.
//

import Foundation
class BaseViewModel: ObservableObject {

    lazy var repository: Repository = OfflineRepository(networkService: NetworkService())

}
