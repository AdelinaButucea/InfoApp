//
//  DisplayMatrixView.swift
//  testapp
//
//  Created by Adelina Butucea on 07.01.2024.
//

import Foundation
import SwiftUI


struct OneTableMatrixView: View{
    @Binding var height:Int
    @Binding var width:Int
    @Binding var twoDArray: [[Double]]
    
    var body:some View{
        VStack {
            VStack{
                Text("Introduceti dimensiunile matricei")
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 20))
                    .font(.system(size: 15))
                HStack {
                    TextField("Height", value: Binding(get: {height}, set: {
                        newValue in
                        if newValue > 0 && newValue < 100 {
                            height = newValue
                        }
                    }), formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("x")
                    TextField("width", value:Binding(get: {width}, set: {
                        newValue in
                        if newValue > 0 && newValue < 100 {
                            width = newValue
                        }
                    }), formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
            }
            VStack {
                ForEach(0..<height, id: \.self) { rowIndex in
                    HStack {
                        ForEach(0..<width, id: \.self) { colIndex in
                            TextField("", value: $twoDArray[rowIndex][colIndex], formatter:NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.center)
                                .frame(width: 60)
                        }
                    }
                }
            }
            .padding()
        }
    }
}
