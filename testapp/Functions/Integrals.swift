//
//  Integrals.swift
//  testapp
//
//  Created by Adelina Butucea on 05.01.2024.
//

import Foundation



//M - maximul derivatei
func Dreapta(expression: String, low:Double, high: Double, eps: Double, M: Double) -> (Double, Int) {
    var S: Double = 0
    var h: Double, x: Double
    let n: Int = Int(pow(high - low, 2) * M / eps) + 1
    
    h = (high - low) / Double (n)
    x = low + h
    for _ in 1 ... n {
        S += evaluateExpression(expression: expression, x: x)
        x += h
    }
    
    S *= h
    
    return (S, n)
}


func Mijloc(expression: String, low:Double, high: Double, eps: Double, M: Double) -> (Double, Int){
    var S: Double = 0
    var h: Double, x: Double
    let n: Int = Int(pow(high - low, 2) * M / eps) + 1
    
    h = (high - low) / Double (n)
    x = low + h / 2
    for _ in 1 ... n {
        S += evaluateExpression(expression: expression, x: x)
        x += h
    }
    
    S *= h
    
    return (S, n)
}


func Stanga(expression: String, low:Double, high: Double, eps: Double, M: Double) -> (Double, Int){
    var S: Double = 0
    var h: Double, x: Double
    let n: Int = Int(pow(high - low, 2) * M / eps) + 1
    
    h = (high - low) / Double (n)
    x = low
    for _ in 1 ... n {
        S += evaluateExpression(expression: expression, x: x)
        x += h
    }
    
    S *= h
    
    return (S, n)
}


func Trapeze(expression: String, low:Double, high: Double, eps: Double, M: Double) -> (Double, Int){
    var S: Double = 0
    var h: Double, x: Double, y: Double
    let n: Int = Int(pow(high - low, 2) * M / eps) + 1
    
    h = (high - low) / Double (n)
    x = low
    y = low + h
    for _ in 1 ... n {
        S += (evaluateExpression(expression: expression, x: x) + evaluateExpression(expression: expression, x: y)) / 2
        x = y
        y += h
    }
    
    S *= h
    
    return (S, n)
}
