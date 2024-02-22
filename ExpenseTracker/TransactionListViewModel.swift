//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Mehmet Said Dede on 22.02.2024.
//

import Foundation
import Combine

final class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching transactions:", error.localizedDescription)
                case .finished:
                    print("Finished fetching transactions")
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
            }
            .store(in: &cancellables)
    }
}
/*
 func fetchData(completion: @escaping (Result<Data, Error>) -> Void ) {
     guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&locale=en") else {
         completion(.failure(NetworkError.invalidURL))
         return
     }
     
     URLSession.shared.dataTask(with: url) { data, response, error in
         guard let data = data, error == nil else {
             completion(.failure(NetworkError.invalidData))
             return
         }
         completion(.success(data))
     }.resume()
 }
 
}

enum NetworkError: Error {
 case invalidURL
 case invalidData
}
 */

