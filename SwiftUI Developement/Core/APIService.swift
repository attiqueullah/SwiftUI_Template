import Foundation

class APIService {
	func getAccount(completion: @escaping (AccountInfo) -> Void) {
		guard let url = URL(string: "https://ios.rp.devfactory.com/accounts")
			else { fatalError("URL is not correct!") }

		URLSession.shared.dataTask(with: url) { data, _, _ in
            do {
                let account = try JSONDecoder().decode(AccountInfo.self, from: data!)
                DispatchQueue.main.async {
                    print(account)
                    completion(account)
                }
            } catch {
                print(error)
            }
		}.resume()
	}
}
