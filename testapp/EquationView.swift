//
//  EquationView.swift
//  testapp
//
//  Created by Adelina Butucea on 05.01.2024.
//

import SwiftUI

struct EquationView: View{
    
    @State private var expression: String = ""
    @State private var a: Double = 0
    @State private var b: Double = 1
    
    @State private var infDer: Double = 0
    @State private var supDer: Double = 1
    @State private var supDer2: Double = 1
    @State private var selectedMethod: String = MethodOptions.bisectiaApriori.displayName
    
    var body: some View{
        ScrollView {
            VStack
            {
                Text("Ecuatia: ")
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                    .font(.system(size: 17))
                HStack{
                    TextField("", text:$expression)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text(" = 0")
                    
                }
                .padding()
                
                    HStack{
                        Text("Interval: ")
                        TextField("", value:Binding(get: {a}, set: {
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
                            .frame(maxWidth: 60)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("", value:Binding(get: {b}, set: {
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
                            .frame(maxWidth: 60)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        
                        Picker(selection: $selectedMethod,
                               label: Text("Alege metoda"),
                               content: {
                            ForEach(MethodOptions.allCases) {
                                h in
                                Text(h.displayName)
                                    .tag(h.displayName)
                            }
                        })
                        
                    }
                    .padding()
                
                VStack {
                    Text(selectedMethod)
                        .bold()
                        .font(.system(size: 15))
                    Spacer()
                    switch selectedMethod {
                    case MethodOptions.bisectiaApriori.displayName:
                        let (c, fc, n) = BisectiaApriori(expression: expression, low: a, high: b, eps: 1e-10)
                        HStack {
                            Text("x =")
                            Text(String(format: "%.6f", c))
                        }
                        HStack {
                            Text("f(x) =")
                            Text(String(format: "%.6f", fc))
                        }
                        HStack {
                            Text("Numarul de iteratii = \(n)")
                        }
                    case MethodOptions.bisectiaAposteriori.displayName:
                        let (c, fc, n) = BisectiaAposteriori(expression: expression, low: a, high: b, eps: 1e-10)
                        HStack {
                            Text("x = ")
                            Text(String(format: "%.6f", c))
                        }
                        HStack {
                            Text("f(x) = ")
                            Text(String(format: "%.6f", fc))
                        }
                        HStack {
                            Text("Numarul de iteratii = \(n)")
                        }
                    case MethodOptions.secanta.displayName:
                        Text("Infimul derivatei functiei")
                        TextField("", value:$infDer, formatter:{
                            let formatter = NumberFormatter()
                            formatter.minimumFractionDigits = 1
                            formatter.maximumFractionDigits = 10
                            return formatter
                        }())
                        .padding(EdgeInsets(top:0, leading:20, bottom:0, trailing: 20))
                        Text("Supremul derivatei functiei")
                        TextField("", value:$supDer, formatter:{
                            let formatter = NumberFormatter()
                            formatter.minimumFractionDigits = 1
                            formatter.maximumFractionDigits = 10
                            return formatter
                        }())
                        .padding(EdgeInsets(top:0, leading:20, bottom:0, trailing: 20))
                        let (c, fc, n) = Secanta(expression: expression, low: a, high: b, eps: 1e-10, m: infDer, M: supDer)
                        HStack {
                            Text("x = ")
                            Text(String(format: "%.6f", c))
                        }
                        HStack {
                            Text("f(x) = ")
                            Text(String(format: "%.6f", fc))
                        }
                        HStack {
                            Text("Numarul de iteratii = \(n)")
                        }
                    case MethodOptions.coarda.displayName:
                        Text("Infimul derivatei functiei")
                        TextField("", value:$infDer, formatter:{
                            let formatter = NumberFormatter()
                            formatter.minimumFractionDigits = 1
                            formatter.maximumFractionDigits = 10
                            return formatter
                        }())
                        .padding(EdgeInsets(top:0, leading:20, bottom:0, trailing: 20))
                        Text("Supremul derivatei functiei")
                        TextField("", value:$supDer, formatter:{
                            let formatter = NumberFormatter()
                            formatter.minimumFractionDigits = 1
                            formatter.maximumFractionDigits = 10
                            return formatter
                        }())
                        .padding(EdgeInsets(top:0, leading:20, bottom:0, trailing: 20))
                        let (c, fc, n) = Coarda(expression: expression, low: a, high: b, eps: 1e-10, m: infDer, M: supDer)
                        HStack {
                            Text("x = ")
                            Text(String(format: "%.6f", c))
                        }
                        HStack {
                            Text("f(x) = ")
                            Text(String(format: "%.6f", fc))
                        }
                        HStack {
                            Text("Numarul de iteratii = \(n)")
                        }
                    case MethodOptions.newton.displayName:
                        Text("Infimul derivatei functiei")
                        TextField("", value:$infDer, formatter:{
                            let formatter = NumberFormatter()
                            formatter.minimumFractionDigits = 1
                            formatter.maximumFractionDigits = 10
                            return formatter
                        }())
                        .padding(EdgeInsets(top:0, leading:20, bottom:0, trailing: 20))
                        Text("Supremul dublei derivate a functiei")
                        TextField("", value:$supDer2, formatter:{
                            let formatter = NumberFormatter()
                            formatter.minimumFractionDigits = 1
                            formatter.maximumFractionDigits = 10
                            return formatter
                        }())
                        .padding(EdgeInsets(top:0, leading:20, bottom:0, trailing: 20))
                        let (c, fc, n) = Newton(expression: expression, low: a, high: b, eps: 1e-10, m: infDer, M: supDer2)
                        HStack {
                            Text("x = ")
                            Text(String(format: "%.6f", c))
                        }
                        HStack {
                            Text("f(x) = ")
                            Text(String(format: "%.6f", fc))
                        }
                        HStack {
                            Text("Numarul de iteratii = \(n)")
                        }
                    case MethodOptions.mixta.displayName:
                        let (c, fc, n) = Mixta(expression: expression, low: a, high: b, eps: 1e-10)
                        HStack {
                            Text("x = ")
                            Text(String(format: "%.6f", c))
                        }
                        HStack {
                            Text("f(x) = ")
                            Text(String(format: "%.6f", fc))
                        }
                        HStack {
                            Text("Numarul de iteratii = \(n)")
                        }
                    default:
                        Text("nimic")
                    }
                    Text("Functia")
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                        .font(.system(size: 15))
                        .bold()
                    FuncView(expression: expression, low:a, high:b)
                    Divider()
                    Text("Derivata")
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                        .font(.system(size: 15))
                        .bold()
                    DerView(expression: expression, low: a, high: b)
                    
                }
            }
        }
    }
}

#Preview {
    EquationView()
}
