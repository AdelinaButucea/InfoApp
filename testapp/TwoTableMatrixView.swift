//
//  TwoTableMatrixView.swift
//  testapp
//
//  Created by Adelina Butucea on 08.01.2024.
//

import Foundation
import SwiftUI

struct TwoTableMatrixView: View {
    @Binding var matrix1: [[Double]]
    @Binding var matrix2: [[Double]]
    
    @Binding var h1: Int
    @Binding var h2: Int
    @Binding var w1: Int
    @Binding var w2: Int
    
    var body: some View {
        HStack {
            VStack {
                VStack{
                    Text("Introduceti dimensiunile matricei")
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .font(.system(size: 15))
                    HStack {
                        TextField("Height", value:Binding(get: {h1}, set: {
                            newV in
                            if newV > 0 && newV < 100 {
                                h1 = newV
                            }
                        }), formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("x")
                        TextField("width", value:Binding(get: {w1}, set: {
                            newV in
                            if newV > 0 && newV < 100 {
                                w1 = newV
                            }
                        }), formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding()
                }
                VStack {
                    ForEach(0..<h1, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<w1, id: \.self) { colIndex in
                                TextField("", value: $matrix1[rowIndex][colIndex], formatter:NumberFormatter())
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .multilineTextAlignment(.center)
                                    .frame(width: 60)
                            }
                        }
                    }
                }
            }
            VStack {
                VStack{
                    Text("Introduceti dimensiunile matricei")
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .font(.system(size: 15))
                    HStack {
                        TextField("Height", value:Binding(get: {h2}, set: {
                            newV in
                            if newV > 0 && newV < 100 {
                                h2 = newV
                            }
                        }), formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("x")
                        TextField("width", value:Binding(get: {w2}, set: {
                            newV in
                            if newV > 0 && newV < 100 {
                                w2 = newV
                            }
                        }), formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding()
                }
                VStack {
                    ForEach(0..<h2, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<w2, id: \.self) { colIndex in
                                TextField("", value: $matrix2[rowIndex][colIndex], formatter:NumberFormatter())
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .multilineTextAlignment(.center)
                                    .frame(width: 60)
                            }
                        }
                    }
                }
            }
        }
        
    }
}
