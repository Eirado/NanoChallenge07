//
//  ViewModel.swift
//  Nano07Challenge
//
//  Created by Enrique Carvalho on 24/06/24.
//

import Foundation
class ViewModel: ObservableObject{
    let apiManager = APIManager()
    
    let codeAndName = "https://raw.githubusercontent.com/Banking-iOS/mock-interview/main/api/list.json"
    let codeAndQuotation = "https://raw.githubusercontent.com/Banking-iOS/mock-interview/main/api/live.json"
    
    var coins: Coins?
    var currenciesName: CurrenciesName?
    
    init(){
        fetch()
    }
    
    func fetch(){
        Task {
            let result = await apiManager.fetch(httpLink: codeAndName, object: currenciesName)
            switch result {
            case .success(let decodedObject):
                print("Successfully fetched and decoded: \(String(describing: decodedObject))")
            case .failure(let error):
                switch error {
                case .invalidURL:
                    print("Invalid URL.")
                case .networkError(let networkError):
                    print("Network error: \(networkError.localizedDescription)")
                case .decodingError(let decodingError):
                    print("Decoding error: \(decodingError.localizedDescription)")
                }
            }
        }
    }
}
