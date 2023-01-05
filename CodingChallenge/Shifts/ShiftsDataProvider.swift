import Combine
import Foundation

protocol ShiftsDataProviderType {
    func getAvailableShifts(address: String, type: String, start: String) -> AnyPublisher<Shifts, Error>
}

class ShiftsDataProvider: ShiftsDataProviderType {

    func getAvailableShifts(address: String, type: String, start: String) -> AnyPublisher<Shifts, Error> {
        let endpoint = "/api/v2/available_shifts"
        var components = WebAPI.createComponents(endpoint: endpoint)

        components.queryItems = [
            URLQueryItem(name: "address", value: address),
            URLQueryItem(name: "type", value: type),
            URLQueryItem(name: "start", value: start)
        ]

        var request = URLRequest(url: components.url!)

        request.httpMethod = "GET"

        return URLSession.shared
            .dataTaskPublisher(for: request)
            .retry(1)
            .tryMap() { element -> Data in
                guard
                    let httpResponse = element.response as? HTTPURLResponse,
                        httpResponse.statusCode == 200
                else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: Shifts.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
