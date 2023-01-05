import Foundation

struct ShiftInfo: Hashable {
    let id: Int

    let shiftKind: String

    let skillName: String
    let skillColor: String

    let facilityTypeName: String
    let facilityTypeColor: String

    let specialityName: String
    let specialityColor: String

    let startTime: String
    let endTime: String

    let premiumRate: Bool
    let distance: Int?
    let covid: Bool

    init(shift: Shift) {
        id = shift.shiftID
        shiftKind = shift.shiftKind
        skillName = shift.skill.name
        skillColor = shift.skill.color
        facilityTypeName = shift.facilityType.name
        facilityTypeColor = shift.facilityType.color
        specialityName = shift.localizedSpecialty.name
        specialityColor = shift.localizedSpecialty.specialty.color
        startTime = shift.normalizedStartDateTime
        endTime = shift.normalizedEndDateTime
        premiumRate = shift.premiumRate
        distance = shift.withinDistance
        covid = shift.covid
    }
}
