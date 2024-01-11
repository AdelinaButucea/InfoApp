//
//  SidebarView.swift
//  testapp
//
//  Created by Adelina Butucea on 05.01.2024.
//

import SwiftUI

struct SidebarView: View {
    @Binding var selection: MainOptions?
    
    var body: some View{
        List(selection: $selection) {
            ForEach(MainOptions.allCases) {
                selection in
                Label (selection.displayName, systemImage: selection.iconName)
                    .tag(selection)
            }
        }
    }
}
