import Foundation

// MARK: - Shifts
struct Shifts: Codable {
    let data: [ShiftData]
    let meta: Meta
}

// MARK: - ShiftData
struct ShiftData: Codable {
    let date: String
    let shifts: [Shift]
}

// MARK: - Shift
struct Shift: Codable {
    let shiftID: Int
    let startTime, endTime: String
    let normalizedStartDateTime, normalizedEndDateTime: String
    let timezone: String
    let premiumRate, covid: Bool
    let shiftKind: String
    let withinDistance: Int?
    let facilityType, skill: FacilityType
    let localizedSpecialty: LocalizedSpecialty

    enum CodingKeys: String, CodingKey {
        case shiftID = "shift_id"
        case startTime = "start_time"
        case endTime = "end_time"
        case normalizedStartDateTime = "normalized_start_date_time"
        case normalizedEndDateTime = "normalized_end_date_time"
        case timezone
        case premiumRate = "premium_rate"
        case covid
        case shiftKind = "shift_kind"
        case withinDistance = "within_distance"
        case facilityType = "facility_type"
        case skill
        case localizedSpecialty = "localized_specialty"
    }
}

// MARK: - FacilityType
struct FacilityType: Codable {
    let id: Int
    let name: String
    let color: String
    let abbreviation: String?
}

// MARK: - LocalizedSpecialty
struct LocalizedSpecialty: Codable {
    let id, specialtyID, stateID: Int
    let name: String
    let abbreviation: String
    let specialty: FacilityType

    enum CodingKeys: String, CodingKey {
        case id
        case specialtyID = "specialty_id"
        case stateID = "state_id"
        case name, abbreviation, specialty
    }
}

// MARK: - Meta
struct Meta: Codable {
    let lat, lng: Double?
}
