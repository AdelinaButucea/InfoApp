//
//  ContentView.swift
//  testapp
//
//  Created by Adelina Butucea on 05.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: MainOptions? = MainOptions.instructions
    @State private var detailSelection: MatrixOptions? = MatrixOptions.table
    
    var body: some View {
        NavigationSplitView{
            SidebarView(selection: $selection)
        } detail: {
            switch selection {
            case .instructions:
                InstructionsView()
            case .graphs:
                GraphingView()
            case .equations:
                EquationView()
            case .integrals:
                CoreView()
            case .matrices:
                NavigationSplitView{
                    MatrixSidebarView()
                } detail:{
                    switch detailSelection {
                    case .string:
                        StringMatrixView()
                    case .table:
                        TableMatrixView()
                    case nil:
                        TableMatrixView()
                    }
                }
            case .none:
                InstructionsView()
            }
        
        }
        

    }
}

#Preview {
    ContentView()
}
