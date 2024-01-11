//
//  TableMatrixView.swift
//  testapp
//
//  Created by Adelina Butucea on 08.01.2024.
//

import Foundation
import SwiftUI

struct TableMatrixView: View {
    let arraySize = 100
    @State var twoDArray: [[Double]] = Array(repeating: Array(repeating: 0.0, count: 100), count: 100)
    
    @State var height: Int = 1
    @State var width: Int = 1
    
    @State var h1: Int = 1
    @State var w1: Int = 1
    @State var h2: Int = 1
    @State var w2: Int = 1
    
    @State var pheight: Int = 1
    @State var pwidth: Int = 1
    
    @State var det: Double? = 0
    @State var Inv: [[Double]]? = Array(repeating: Array(repeating: 0.0, count: 100), count: 100)
    @State var fgauss: [[Double]]? = Array(repeating: Array(repeating: 0.0, count: 100), count: 100)
    @State var fjordan: [[Double]]? = Array(repeating: Array(repeating: 0.0, count: 100), count: 100)
    
    @State var prod: [[Double]]? = Array(repeating: Array(repeating: 0.0, count: 100), count: 100)
    
    @State var matrix1: [[Double]] = Array(repeating: Array(repeating: 0.0, count: 100), count: 100)
    @State var matrix2: [[Double]] = Array(repeating: Array(repeating: 0.0, count: 100), count: 100)
    
    @State var double: Bool = false
    
    
    
    var body: some View {
        ScrollView([.vertical]) {
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
                    TwoTableMatrixView(matrix1:$matrix1, matrix2:$matrix2, h1: $h1, h2:$h2, w1:$w1, w2:$w2)
                    
                    Divider()
                    
                    Button() {
                        (prod, _, _) = InmultireMatrice(matrixA: matrix1, matrixB: matrix2)
                    } label:{
                        Label("Inmultirea matricelor", systemImage: "multiply.circle.fill")
                    }
                    .padding()
                    .foregroundColor(.accentColor)
                    .font(.system(size: 15))
                    
                    Divider()
                    
                    VStack {
                        StaticDisplayMatrixView(height: $h1, width: $w2, twoDArray: $prod)
                        Divider()

                    }
                }
                else {
                    

            Divider()
                    VStack{
                        OneTableMatrixView(height: $height, width: $width, twoDArray: $twoDArray)
                            .frame(maxHeight: .infinity, alignment: .leading)
                        Button ("Calculeaza"){
                            Inv = MatriceaInversa(matrix: twoDArray, n: height)
                            det = Determinant(matrix: twoDArray, n: height)
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
                            Divider()
                        }
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
                                .foregroundColor(.primary)
                                .font(.system(size: 16))
                            StaticDisplayMatrixView(height: $height, width: $width, twoDArray: $Inv)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        }

                    }
                }
                }
                
            }
        }
            
        }
}

#Preview {
    TableMatrixView()
}
