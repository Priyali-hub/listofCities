//
//  ContentView.swift
//  listCities
//
//  Created by priyali.srivastava on 26/02/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CitiesViewModel()
    @State private var expandStates: Set<String> = []
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.citiesByState.keys.sorted(), id: \ .self) { state in
                        
                        Section(header: Text(state).onTapGesture {
                            if expandStates.contains(state){
                                expandStates.remove(state)
                            } else {
                                expandStates.insert(state)
                            }
                        }) {
                            if expandStates.contains(state) {
                                ForEach(viewModel.citiesByState[state] ?? []) {
                                    city in
                                    
                                    Text(city.city)
                                }
                            }
                        }
                        
                    }
                   
                }
                .refreshable {
                    viewModel.refreshData()
                }
                Button("Reverse List Order"){
                    viewModel.toggleReverseOrder()
                }
                .padding()
            }
            .navigationTitle("Australian Cities")
        }
    }
}

#Preview {
    ContentView()
}
