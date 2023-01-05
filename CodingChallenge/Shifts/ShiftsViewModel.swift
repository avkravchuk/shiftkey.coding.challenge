import Combine
import Foundation

class ShiftsViewModel: ObservableObject {

    // MARK: - Types

    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([ShiftsSection])
    }

    // MARK: - Internal properties

    @Published private(set) var state = State.idle

    @Published var isPresentingModal: Bool = false
    var selectedShift: ShiftInfo?

    // MARK: - Private properties

    private var loadShiftsCancellable: AnyCancellable?

    private let dataProvider: ShiftsDataProviderType

    let formatter = DateFormatter()

    // MARK: - Initialization

    init(dataProvider: ShiftsDataProviderType) {
        self.dataProvider = dataProvider
    }

    // MARK: - Internal methods

    func loadShifts() {
        state = .loading

        loadShiftsCancellable = dataProvider
            .getAvailableShifts(address: "Dallas, TX", type: "4day", start: date())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.state = .failed(error)
                }
            }, receiveValue: { [weak self] shifts in
                self?.state = .loaded(shifts.data.map { ShiftsSection(shiftData: $0) })
            })
    }

    // MARK: - Private methods

    private func date() -> String {
        formatter.dateFormat = "YYYY-MM-DD"
        return formatter.string(from: Date())
    }
}
