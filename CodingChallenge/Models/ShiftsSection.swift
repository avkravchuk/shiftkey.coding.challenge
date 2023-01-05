import Foundation

struct ShiftsSection {
    let date: String
    let rows: [ShiftInfo]

    init(shiftData: ShiftData) {
        date = shiftData.date
        rows = shiftData.shifts.map { ShiftInfo.init(shift: $0)}
    }
}
