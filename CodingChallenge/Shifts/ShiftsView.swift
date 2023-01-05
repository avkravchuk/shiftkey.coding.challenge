//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {

    @ObservedObject var viewModel: ShiftsViewModel

    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .idle:
                    idleView()
                case .loading:
                    loadingShiftsView()
                case .loaded(let shifts):
                    shiftsList(shiftData: shifts)
                case .failed(let error):
                    errorView(error: error)
                }

            }
            .navigationTitle("Shifts")
            .toolbar {
                toolbarButton()
            }
            .sheet(isPresented: $viewModel.isPresentingModal) {
                shiftDetailsModal()
            }
        }
    }

    @ViewBuilder
    func shiftsList(shiftData: [ShiftsSection]) -> some View {
        List {
            ForEach(shiftData, id: \.date) { shiftSection in
                Section(header: Text(shiftSection.date)) {
                    if shiftData.isEmpty {
                        Text("No shifts available")
                    } else {
                        shiftsSection(shifts: shiftSection.rows)
                    }
                }
            }
        }
        .listStyle(.sidebar)
    }

    @ViewBuilder
    func shiftsSection(shifts: [ShiftInfo]) -> some View {
        ForEach(shifts, id: \.id) { shift in
            ShiftInfoView(shift: shift)
                .onTapGesture {
                    viewModel.selectedShift = shift
                    viewModel.isPresentingModal.toggle()
                }
        }
    }

    @ViewBuilder
    func loadingShiftsView() -> some View {
        VStack(spacing: 5) {
            ProgressView()
            Text("Loading available shifts")
        }
    }

    @ViewBuilder
    func errorView(error: Error) -> some View {
        Text(error.localizedDescription)
            .padding()
    }

    @ViewBuilder
    func idleView() -> some View {
        Color.clear
            .onAppear {
                viewModel.loadShifts()
            }
    }

    @ViewBuilder
    func toolbarButton() -> some View {
        Button {
            viewModel.loadShifts()
        } label: {
            Label("Update", systemImage: "arrow.clockwise")
        }
    }

    @ViewBuilder func shiftDetailsModal() -> some View {
        NavigationView {
            if let selectedShift = viewModel.selectedShift {
                ShiftDetails(shift: selectedShift)
            }
        }
    }
}

struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView(viewModel: ShiftsViewModel(dataProvider: ShiftsDataProvider()))
    }
}
