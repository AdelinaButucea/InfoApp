//
//  ParseInput.swift
//  testapp
//
//  Created by Adelina Butucea on 05.01.2024.
//
import Expression

func evaluateExpression(expression: String, x: Double) -> Double{
        do {
            let newexp = expression.replacingOccurrences(of: "x", with: String(x))
            let expressionToEvaluate = Expression(newexp)
            let resultValue = try expressionToEvaluate.evaluate()
            
            if let doubleResult = resultValue as? Double {
                return doubleResult
            } else {
                print("Result is not a double.")
            }
        } catch {
            print("Error evaluating expression: \(error)")
        }
    return 0
    }


func processString(str:String) -> ([[Double]], Int, Int){
    var arr: [[Double]] = []
    let lines = str.components(separatedBy: "\n")
    let n = lines.count
    arr = lines.map { line in
        line.components(separatedBy: ",").compactMap { Double($0.trimmingCharacters(in: .whitespaces)) }
    }
    let m = arr[0].count
    
    for i in 0..<n {
        let cWidth = arr[i].count
        if(cWidth < m){
            arr[i] += Array(repeating: 0.0, count: m - cWidth)
        }
    }
    
    return (arr, n, m)
}
