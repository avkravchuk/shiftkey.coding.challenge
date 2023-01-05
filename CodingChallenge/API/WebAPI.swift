import Foundation

struct WebAPI {
    static let baseUrl = "staging-app.shiftkey.com"
    static let scheme = "https"

    static func createComponents(endpoint: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = WebAPI.scheme
        components.host = WebAPI.baseUrl
        components.path = endpoint
        return components
    }
}
