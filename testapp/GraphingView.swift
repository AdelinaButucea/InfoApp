//
//  GraphingView.swift
//  testapp
//
//  Created by Adelina Butucea on 05.01.2024.
//

import SwiftUI
import Foundation
import Charts


struct GraphPoint:Identifiable {
    let id = UUID()
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}


struct FuncView: View {
    var expression: String = ""
    
    var low: Double = 0
    var high: Double = 1
    
    init(expression: String, low: Double, high: Double) {
        self.expression = expression
        self.low = low
        self.high = high
    }
    
    
    var body: some View {
        var data: [GraphPoint] = Array(stride(from: low, to: high, by: 0.1)).map { x in
            return GraphPoint(x: x, y: evaluateExpression(expression: expression, x: x))
        }
        
        Chart(data) {
                LineMark(
                    x: .value("x", $0.x),
                    y: .value("y", $0.y)
                )
            }
        .padding()
        .frame(minHeight: 300)
    }
    
}



struct DerView: View{
    var expression: String = ""
    var eps: Double = 1e-4
    
    var low: Double = 0
    var high: Double = 1
    
    init(expression: String, low: Double, high: Double) {
        self.expression = expression
        self.low = low
        self.high = high
    }
    
    
    var body: some View {
        var data: [GraphPoint] = Array(stride(from: low, to: high, by: 0.1)).map { x in
            return GraphPoint(x: x, y: (evaluateExpression(expression: expression, x: x + eps) - evaluateExpression(expression: expression, x: x))/eps)
        }
        
        Chart(data) {
                LineMark(
                    x: .value("x", $0.x),
                    y: .value("y", $0.y)
                )
            }
        .padding()
        .frame(minHeight: 300)
    }
}

struct GraphingView: View{
    @State private var expression: String = ""
    @State var left: Double = -50
    @State var right: Double = 50
    
    var body:some View{
        ScrollView {
            VStack {
                HStack {
                    Text("Introduceti functia")
                    TextField("", text: $expression)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
                HStack {
                    Text("Pe intervalul")
                    TextField("", value:Binding(get: {left}, set: {
                        newValue in
                        if newValue < right {
                            left = newValue
                        }
                    }), formatter: {
                        let formatter = NumberFormatter()
                        formatter.minimumFractionDigits = 1
                        formatter.maximumFractionDigits = 10
                        return formatter
                    }())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("", value:Binding(get: {right}, set: {
                        newValue in
                        if newValue > left {
                            right = newValue
                        }
                    }), formatter: {
                        let formatter = NumberFormatter()
                        formatter.minimumFractionDigits = 1
                        formatter.maximumFractionDigits = 10
                        return formatter
                    }())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
                Divider()
                Text("Functia")
                FuncView(expression: expression, low:left, high:right)
                Divider()
                Text("Derivata")
                DerView(expression: expression, low:left, high:right)
            }
        }
    }
    

}

#Preview {
    GraphingView()
}
