//
//  Methods.swift
//  testapp
//
//  Created by Adelina Butucea on 05.01.2024.
//

import Foundation

func BisectiaApriori(expression: String, low: Double, high: Double, eps:Double) -> (Double, Double, Int){
    var c: Double = low
    var a = low, b = high
    let n = Int(log2((b - a)/eps)) + 1
    
    if(n > 0) {
        for i in 1...n {
            let fc = evaluateExpression(expression: expression, x: c)
            if(fc == Double(0)) {
                return (c, fc, i)
            }
            c = (a + b) / 2
            if(fc * evaluateExpression(expression: expression, x: a) > 0)
            {
                a = c
            }
            else {
                b = c
            }
        }
    }
    return (c, evaluateExpression(expression: expression, x: c), n)
}

func BisectiaAposteriori(expression: String, low: Double, high: Double, eps:Double) -> (Double, Double, Int){
    var c: Double = low
    var a = low, b = high, prev = low
    var n = 0
    
    repeat {
        prev = c
        n += 1
        
        let fc = evaluateExpression(expression: expression, x: c)
        if(fc == Double(0)) {
            return (c, fc, n)
        }
        if(fc * evaluateExpression(expression: expression, x: a) > 0)
        {
            a = c
        }
        else {
            b = c
        }
        c = (a + b) / 2
    }
    while(2 * abs(prev - c) > eps)
    return (c, evaluateExpression(expression: expression, x: c), n)
}


func Secanta(expression: String, low: Double, high: Double, eps:Double, m: Double, M: Double) -> (Double, Double, Int) {
    var c = low
    var a = low, b = high
    var temp: Double
    var n = 0
    
    repeat {
        let fa = evaluateExpression(expression: expression, x: a)
        let fb = evaluateExpression(expression: expression, x: b)
        temp = c
        c = (a * fb - b * fa) / (fb - fa)
        
        if (evaluateExpression(expression: expression, x: c) * fa > 0) {
            a = c
        }
        else {
            b = c
        }
        n += 1
    }
    while(abs(temp - c) * M / m >= eps)
            
    return (c, evaluateExpression(expression: expression, x: c), n)
            
}

func Coarda(expression: String, low: Double, high: Double, eps:Double, m: Double, M: Double) -> (Double, Double, Int) {
    let a = low, b = high
    let h = 1e-4
    let f1a = (evaluateExpression(expression: expression, x: a + h) - evaluateExpression(expression: expression, x: a)) / h
    
    let f1b = (evaluateExpression(expression: expression, x: b + h) - evaluateExpression(expression: expression, x: b)) / h
    
    
    let fa = evaluateExpression(expression: expression, x: a)
    let fb = evaluateExpression(expression: expression, x: b)
    
    var c = (a * fb - b * fa) / (fb - fa)
    
    var n = 0
    var temp, x, e : Double
    if(fa * evaluateExpression(expression: expression, x: c) > 0){
        e = b
        x = a
    }
    else {
        e = a
        x = b
    }
    repeat {
        temp = x
        n += 1
        let fx = evaluateExpression(expression: expression, x: x)
        x = x - fx * (e - x) / (evaluateExpression(expression: expression, x: e) - fx)
    }
    while(abs(temp - x) * M/m > eps)
            
    return (x, evaluateExpression(expression: expression, x: x), n)
            
}


func Newton(expression: String, low: Double, high: Double, eps:Double, m: Double, M: Double) -> (Double, Double, Int){
    var c = low
    let a = low, b = high
    let h = 1e-4
    var x: Double
    let fa = evaluateExpression(expression: expression, x: a)
    let fb = evaluateExpression(expression: expression, x: b)
    var temp: Double
    var n = 0
    
    c = (a * fb - b * fa) / (fb - fa)
    
    if(fa * evaluateExpression(expression: expression, x: c) < 0) {
        x = a
    }
    else {
        x = b
    }
    repeat{
        temp = x
        let f1x = (evaluateExpression(expression: expression, x: x + h) - evaluateExpression(expression: expression, x: x)) / h
        
        x = x - evaluateExpression(expression: expression, x: x)/f1x
        n += 1
    }
    while ((pow(x - temp, 2)) * M / 2 / m >= eps)
    
    return (x, evaluateExpression(expression: expression, x: x), n)
            
}


func Mixta(expression: String, low: Double, high: Double, eps:Double) -> (Double, Double, Int){
    var c = low
    let a = low, b = high
    let h = 1e-4
    let fa = evaluateExpression(expression: expression, x: a)
    let fb = evaluateExpression(expression: expression, x: b)
    var x: Double, y: Double
    c = (a * fb - b * fa) / (fb - fa)
    var n = 0
    if(fa * evaluateExpression(expression: expression, x: c) < 0){
        x = a
        y = b
    }
    else {
        x = b
        y = a
    }
    
    repeat {
        let fx = evaluateExpression(expression: expression, x: x)
        let fy = evaluateExpression(expression: expression, x: y)
        let f1x = (evaluateExpression(expression: expression, x: x + h) - evaluateExpression(expression: expression, x: x)) / h
        y = y - fy * (x - y)/(fx - fy)
        x = x - fx / f1x
        n += 1
    }
    while (abs(x - y) >= eps)
    
    return ((x + y) / 2, evaluateExpression(expression: expression, x: (x + y) / 2), n)
}
