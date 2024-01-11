//
//  TwoMatrixStringView.swift
//  testapp
//
//  Created by Adelina Butucea on 08.01.2024.
//

import Foundation
import SwiftUI

struct TwoMatrixStringView: View {
    @Binding var matrix1: String
    @Binding var matrix2: String
    
    var body: some View {
        HStack{
            TextEditor(text: $matrix1)
                .foregroundColor(.secondary)
                .font(.system(size: 14))
            TextEditor(text: $matrix2)
                .foregroundColor(.secondary)
                .font(.system(size: 14))
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        .frame(minHeight: 100, maxHeight: 200)
    }
        
}
