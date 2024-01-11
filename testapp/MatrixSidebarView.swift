//
//  MatrixSidebarView.swift
//  testapp
//
//  Created by Adelina Butucea on 07.01.2024.
//

import Foundation
import SwiftUI

struct MatrixSidebarView: View {
    @State private var detailSelection: MatrixOptions? = MatrixOptions.table
    
    var body: some View {
//        List(selection: $detailSelection) {
//            ForEach(MatrixOptions.allCases) {
//                detailSelection in
//                Label (detailSelection.displayName, systemImage: detailSelection.iconName)
//                    .tag(detailSelection)
//            }
//        }
        List{
            HStack {
                Label("", systemImage: MatrixOptions.string.iconName)
                NavigationLink(MatrixOptions.string.displayName, destination:StringMatrixView())
            }
            HStack {
                Label("", systemImage: MatrixOptions.table.iconName)
                NavigationLink(MatrixOptions.table.displayName, destination:TableMatrixView())
            }
        }
        .navigationTitle("Optiuni")
    }
}
