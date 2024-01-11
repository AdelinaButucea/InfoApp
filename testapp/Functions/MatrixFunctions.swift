//
//  MatrixFunctions.swift
//  testapp
//
//  Created by Adelina Butucea on 05.01.2024.
//

import Foundation


func FormaCanonicaGauss(matrix: [[Double]], n:Int, m:Int) -> [[Double]]? {
    var transMatrix = matrix
    
    guard n < 100 && m < 100 else {
        return nil
    }
    
    for i in 0..<n - 1 {
        for j in i + 1..<n {
            if(transMatrix[i][i] != 0) {
                let factor = transMatrix[j][i] / transMatrix[i][i]
                for k in i..<m {
                    transMatrix[j][k] -= factor * transMatrix[i][k]
                }
            }
            else {
                var l = i
                while (l < n && transMatrix[l][i] == 0){
                    l += 1
                }
                if(l == n) {
                    return transMatrix
                }
                else {
                    transMatrix.swapAt(i, l)
                }
            }
        }
    }
    return transMatrix
}


func FormaCanonicaJordanGauss(matrix: [[Double]], n:Int, m:Int) -> [[Double]]? {
    var transMatrix = matrix
    
    guard n < 100 && m < 100 else {
        return nil
    }
    
    for i in 0..<n {
        if(transMatrix[i][i] != 0) {
            for j in i + 1..<n {
                for k in i + 1..<m {
                    transMatrix[j][k] = transMatrix[i][i] * transMatrix[j][k] -
                                        transMatrix[j][i] * transMatrix[i][k]
                }
                transMatrix[j][i] = 0
            }
        }
        else {
            var l = i
            while (l < n && transMatrix[l][i] == 0){
                l += 1
            }
            if(l == n) {
                return transMatrix
            }
            else {
                transMatrix.swapAt(i, l)
            }
        }
        
    }
    return transMatrix
}

func Determinant(matrix: [[Double]], n:Int) -> Double? {
    if(matrix.count == matrix[0].count){
        let newmat = FormaCanonicaGauss(matrix: matrix, n: n, m: n)
        guard newmat != nil else {
            return nil
        }
        var det: Double = 1
        for i in 0..<n{
            det *= newmat![i][i]
        }
        return det
    }
    return nil
}


func MatriceaInversa(matrix: [[Double]], n:Int) -> [[Double]]?{
    if(matrix.count == matrix[0].count){
        if(Determinant(matrix: matrix, n: n) != 0){
            var augmentedMatrix: [[Double]] = Array(repeating: (Array(repeating: 0.0, count: n)), count: n)
            for i in 0..<n{
                for j in 0..<n{
                    augmentedMatrix[i][j] = matrix[i][j]
                }
            }
                for i in 0..<n {
                    augmentedMatrix[i].append(contentsOf: (0..<n).map { $0 == i ? 1.0 : 0.0 })
                }

                for i in 0..<n {
                    if augmentedMatrix[i][i] == 0 {
                        guard let nonZeroRow = (i..<n).first(where: { augmentedMatrix[$0][i] != 0 }) else {
                            return nil
                        }
                        augmentedMatrix.swapAt(i, nonZeroRow)
                    }

                    let pivot = augmentedMatrix[i][i]
                    for j in 0..<2 * n {
                        augmentedMatrix[i][j] /= pivot
                    }

                    for k in 0..<n {
                        if k != i {
                            let factor = augmentedMatrix[k][i]
                            for j in 0..<2 * n {
                                augmentedMatrix[k][j] -= factor * augmentedMatrix[i][j]
                            }
                        }
                    }
                }
            
                let inverseMatrix = augmentedMatrix.map { Array($0[n..<2 * n]) }

                return inverseMatrix
        }
        else{
            return nil
        }
    }
    return nil
}



func InmultireMatrice(matrixA: [[Double]], matrixB: [[Double]]) ->([[Double]]?, Int, Int) {
    let rowsA = matrixA.count
    let colsA = matrixA[0].count
    let rowsB = matrixB.count
    let colsB = matrixB[0].count
    
    guard colsA == rowsB else {
        return (nil, 1, 1)
    }

    var result = Array(repeating: Array(repeating: 0.0, count: colsB), count: rowsA)

    for i in 0..<rowsA {
        for j in 0..<colsB {
            var sum = 0.0
            for k in 0..<colsA {
                sum += matrixA[i][k] * matrixB[k][j]
            }
            result[i][j] = sum
        }
    }

    return (result, result.count, result[0].count)
}


