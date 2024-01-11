//
//  StringMatrixView.swift
//  testapp
//
//  Created by Adelina Butucea on 07.01.2024.
//

import Foundation
import SwiftUI

struct StringMatrixView: View {
    @State var matrixString: String = ""
    @State var twoDArray: [[Double]] = Array(repeating: Array(repeating: 0.0, count: 100), count: 100)
    
    @State var height: Int = 1
    @State var width: Int = 1
    
    @State var pheight: Int = 1
    @State var pwidth: Int = 1
    
    @State var det: Double? = 0
    @State var Inv: [[Double]]? = Array(repeating: Array(repeating: 0.0, count: 100), count: 100)
    @State var fgauss: [[Double]]? = Array(repeating: Array(repeating: 0.0, count: 100), count: 100)
    @State var fjordan: [[Double]]? = Array(repeating: Array(repeating: 0.0, count: 100), count: 100)
    
    @State var prod: [[Double]]? = Array(repeating: Array(repeating: 0.0, count: 100), count: 100)
    
    @State var matrix1: String = ""
    @State var matrix2: String = ""
    
    @State var double: Bool = false
    
    
    
    var body: some View {
        ScrollView {
            HStack{
                Text("O singura matrice")
                    .foregroundColor(.cyan)
                Toggle(isOn: $double,
                       label: {
                    Text("")
                })
                .toggleStyle(SwitchToggleStyle(tint: Color(.blue)))
                .padding()
                Text("Inmultirea matricelor")
                    .foregroundColor(.pink)
            }
            VStack{
                
                if(double) {
                    TwoMatrixStringView(matrix1:$matrix1, matrix2:$matrix2)
                    Button("Inmultirea matricelor") {
                        double = true
                        let (m1, _, _) = processString(str: matrix1)
                        let (m2, _, _) = processString(str: matrix2)
                        (prod, pheight, pwidth) = InmultireMatrice(matrixA: m1, matrixB: m2)
                    }
                    VStack {
                            StaticDisplayMatrixView(height: $pheight, width: $pwidth, twoDArray: $prod)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))

                        
                    }
                    
                }
                else {
                    OneMatrixStringView(matrixString: $matrixString)
                    Divider()
                    VStack{
                        Button ("Calculeaza"){
                            (twoDArray, height, width) = processString(str: matrixString)
                            det = Determinant(matrix: twoDArray, n: height)
                            Inv = MatriceaInversa(matrix: twoDArray, n: height)
                            fgauss = FormaCanonicaGauss(matrix: twoDArray, n: height, m: width)
                            fjordan = FormaCanonicaJordanGauss(matrix: twoDArray, n: height, m: width)
                        }
                        
                        Divider()
                        VStack {
                            Section{
                                HStack {
                                    Text("Determinantul este")
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .font(.system(size:14))
                                    Text(det != nil ? String(format: "%.2f", det!) : "Nu e matrice patratica")
                                    Spacer()
                                }
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                            }
                            Divider()
                            Section {
                                VStack {
                                    Text("Forma canonica")
                                        .bold()
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    HStack{
                                        VStack{
                                            Text("Metoda Gauss")
                                                .foregroundColor(.secondary)
                                            StaticDisplayMatrixView(height: $height, width: $width, twoDArray: $fgauss)
                                        }
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 20, trailing: 30))
                                        VStack{
                                            Text("Metoda Jordan-Gauss")
                                                .foregroundColor(.secondary)
                                            StaticDisplayMatrixView(height: $height, width: $width, twoDArray: $fjordan)
                                        }
                                        .padding(EdgeInsets(top: 5, leading: 30, bottom: 20, trailing: 0))
                                    }
                                    
                                }
                            }
                            Divider()
                            VStack {
                                Text("Matricea Inversa")
                                    .font(.system(size: 15))
                                StaticDisplayMatrixView(height: $height, width: $width, twoDArray: $Inv)
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))

                        }
                    }
                }
                
            }
        }
        
    }
        
}

#Preview {
    StringMatrixView()
}
