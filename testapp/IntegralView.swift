//
//  IntegralView.swift
//  testapp
//
//  Created by Adelina Butucea on 06.01.2024.
//

import Foundation
import SwiftUI
import Charts

struct IntegralView: View {
    var expression: String = ""
    var a: Double
    var b: Double
    
    init(expression: String, a: Double, b: Double) {
        self.expression = expression
        self.a = a
        self.b = b
    }
    
    var body: some View {
        
        let data: [GraphPoint] = Array(stride(from: a, to: b, by: 0.1)).map { x in
            return GraphPoint(x: x, y: evaluateExpression(expression: expression, x: x))
        }
        
        Chart(data) {
            AreaMark(
                x: .value("x", $0.x),
                y: .value("y", $0.y)
            )
        }
    }
}

struct CoreView: View{
    @State var expression: String = ""
    @State var selectedMethod: String = "Metoda dreptunghiurilor de stanga"
    @State var a: Double = 0
    @State var b: Double = 1
    @State var supDev: Double = 0
    var body: some View{
        ScrollView{
            VStack{
                Text("Functia de integrat")
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0))
                HStack {
                    Text("f(x) = ")
                    TextField("", text:$expression)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
                HStack{
                    Text("Interval:")
                    TextField("", value: Binding(get: {a}, set: {
                        newValue in
                        if newValue < b {
                            a = newValue
                        }
                    }), formatter: {
                        let formatter = NumberFormatter()
                        formatter.minimumFractionDigits = 1
                        formatter.maximumFractionDigits = 10
                        return formatter
                    }())
                        .frame(width:60)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("", value: Binding(get: {b}, set: {
                        newValue in
                        if newValue > a {
                            b = newValue
                        }
                    }), formatter: {
                        let formatter = NumberFormatter()
                        formatter.minimumFractionDigits = 1
                        formatter.maximumFractionDigits = 10
                        return formatter
                    }())
                        .frame(width:60)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Picker(
                        selection: $selectedMethod,
                        label: Text("Alege Metoda"),
                        content: {
                            Text("Metoda dreptunghiurilor de stanga").tag("Metoda dreptunghiurilor de stanga")
                            Text("Metoda dreptunghiurilor de mijloc").tag("Metoda dreptunghiurilor de mijloc")
                            Text("Metoda dreptunghiurilor de dreapta").tag("Metoda dreptunghiurilor de dreapta")
                            Text("Metoda trapezelor").tag("Metoda trapezelor")
                        }
                        
                    )
                }
                .padding()
                VStack{
                    HStack{
                        Text("Supremul derivatei")
                        TextField("", value: $supDev, formatter: {
                            let formatter = NumberFormatter()
                            formatter.minimumFractionDigits = 1
                            formatter.maximumFractionDigits = 10
                            return formatter
                        }())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    switch selectedMethod{
                    case "Metoda dreptunghiurilor de stanga":
                        let (S, n) = Stanga(expression: expression, low: a, high: b, eps: 1e-2, M: supDev)
                        Text("Suprafata = \(S)")
                        Text("Numarul de iteratii = \(n)")
                    case "Metoda dreptunghiurilor de mijloc":
                        let (S, n) = Mijloc(expression: expression, low: a, high: b, eps: 1e-2, M: supDev)
                        Text("Suprafata = \(S)")
                        Text("Numarul de iteratii = \(n)")
                    case "Metoda dreptunghiurilor de dreapta":
                        let (S, n) = Dreapta(expression: expression, low: a, high: b, eps: 1e-2, M: supDev)
                        VStack{
                            Text("Suprafata = \(S)")
                            Text("Numarul de iteratii = \(n)")
                        }
                    case "Metoda trapezelor":
                        let (S, n) = Trapeze(expression: expression, low: a, high: b, eps: 1e-2, M: supDev)
                        Text("Suprafata = \(S)")
                        Text("Numarul de iteratii = \(n)")
                    default:
                        Text("nimic")
                    }
                }
                IntegralView(expression: expression, a: a, b: b)
                    .frame(height: 300)
            }
            
        }
            
    }
}

#Preview {
    CoreView()
}
