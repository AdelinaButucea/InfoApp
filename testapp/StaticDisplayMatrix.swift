//
//  StaticDisplayMatrix.swift
//  testapp
//
//  Created by Adelina Butucea on 07.01.2024.
//

import Foundation
import SwiftUI

struct StaticDisplayMatrixView: View{
    @Binding var height:Int
    @Binding var width:Int
    @Binding var twoDArray: [[Double]]?
    
    var body:some View{
        if(twoDArray != nil) {
            VStack {
                ForEach(0..<height, id: \.self) { rowIndex in
                    HStack {
                        ForEach(0..<width, id: \.self) { colIndex in
                            Text(String(format: "%.2f", twoDArray![rowIndex][colIndex]))
                                .frame(width: 50, height: 25)
                                .border(Color.gray, width:1)
                        }
                    }
                }
            }
        }
        else {
            Text("Nu exista")
        }
    }
}

