import SwiftUI

struct ShiftInfoView: View {

    let shift: ShiftInfo

    var body: some View {
        HStack(spacing: 5) {
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 5) {
                    Text(shift.shiftKind)
                        .font(.title2)
                    Spacer()
                    textBubble(text: shift.skillName, color: shift.skillColor)
                }

                timeView(start: shift.startTime, end: shift.endTime)

                VStack(alignment: .leading, spacing: 5) {
                    ShiftLineView(text: shift.facilityTypeName,
                                  image: "bed.double.fill",
                                  color: shift.facilityTypeColor)

                    ShiftLineView(text: shift.specialityName,
                                  image: "staroflife.fill",
                                  color: shift.specialityColor)
                }
            }
        }
    }

    @ViewBuilder
    func timeView(start: String, end: String) -> some View {
        HStack() {
            Text(start)
                .font(.caption)
            Spacer()
            Image(systemName: "arrow.right")
            Spacer()
            Text(end)
                .font(.caption)
        }
        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray, lineWidth: 1)
        )
        .foregroundColor(.gray)
    }

    @ViewBuilder
    func textBubble(text: String, color: String) -> some View {
        let color = Color(color) ?? .black
        Text(text)
            .font(.caption)
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(color, lineWidth: 2)
            )
    }
}
