//
//  OneMatrixStringView.swift
//  testapp
//
//  Created by Adelina Butucea on 08.01.2024.
//

import Foundation
import SwiftUI

struct OneMatrixStringView: View {
    @Binding var matrixString: String
    
    var body: some View {
        HStack{
            TextEditor(text: $matrixString)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .frame(minHeight: 100, maxHeight: 200)
        .foregroundColor(.secondary)
        .font(.system(size: 14))
    }
        
}
