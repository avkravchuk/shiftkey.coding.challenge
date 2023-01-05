import SwiftUI

struct ShiftDetails: View {

    let shift: ShiftInfo

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 10) {
            ShiftInfoView(shift: shift)
            separator()
            additionalInfoView()
            separator()
            Spacer()
        }
        .navigationTitle("Shift details")
        .padding()
        .toolbar {
            toolbarButton()
        }
    }

    @ViewBuilder
    func additionalInfoView() -> some View {
        Text("Additional info")
            .font(.title2)
        VStack {
            additionalBoolInfoLine(text: "Premium rate", isAvailable: shift.premiumRate)
            additionalBoolInfoLine(text: "Covid", isAvailable: shift.covid)
            additionalInfoLine(title: "Distance", details: shift.distance == nil ? nil : String(shift.distance!))
        }
    }

    @ViewBuilder
    func additionalBoolInfoLine(text: String, isAvailable: Bool) -> some View {
        HStack(spacing: 5) {
            Text(text)
            Spacer()
            Image(systemName: "checkmark.circle")
                .frame(width: 22, height: 22)
                .foregroundColor(isAvailable ? .green : .red)
        }
    }

    @ViewBuilder
    func additionalInfoLine(title: String, details: String?) -> some View {
        HStack(spacing: 5) {
            Text(title)
            Spacer()
            Text(details ?? "Unknown")
        }
    }

    @ViewBuilder
    func toolbarButton() -> some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Label("Close", systemImage: "xmark")
        }
    }

    @ViewBuilder
    func separator() -> some View {
        Color.gray
            .frame(height: 1)
    }
}
