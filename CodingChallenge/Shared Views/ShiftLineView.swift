import SwiftUI

struct ShiftLineView: View {

    let text: String
    let image: String
    let color: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: image)
                .frame(width: 22, height: 22)
                .foregroundColor(Color(color))
            Text(text)
        }
    }
}
