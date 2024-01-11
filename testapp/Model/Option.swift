//
//  Objects.swift
//  testapp
//
//  Created by Adelina Butucea on 05.01.2024.
//

import Foundation
import SwiftUI

enum MainOptions: Identifiable, Hashable, CaseIterable {
    case instructions
    case matrices
    case graphs
    case integrals
    case equations
    
    
    var id: String {
        switch self {
        case .instructions:
            "instructions"
        case .matrices:
            "matrices"
        case .graphs:
            "graphs"
        case .integrals:
            "integrals"
        case .equations:
            "equations"
        }
    }
    
    var displayName: String {
        switch self {
        case .instructions:
            "Instructiuni"
        case .matrices:
            "Matrice"
        case .graphs:
            "Grafice"
        case .integrals:
            "Integrale"
        case .equations:
            "Ecuatii"
        }
    }
    
    var iconName: String{
        switch self {
        case .instructions:
            "questionmark.circle.fill"
        case .matrices:
            "square.grid.2x2.fill"
        case .graphs:
            "chart.bar.fill"
        case .integrals:
            "chart.line.downtrend.xyaxis.circle.fill"
        case .equations:
            "equal.circle.fill"
        }
    }
    
}

enum MatrixOptions: Identifiable, Hashable, CaseIterable {
    case string
    case table
    
    var id: String {
        switch self {
        case .string:
            "string"
        case .table:
            "table"
        }
        
    }
    
    var displayName: String {
        switch self {
        case .string:
            "Tip fisier"
        case .table:
            "Tip tabel"
        }
    }
    
    var iconName: String {
        switch self {
        case .string:
            "filemenu.and.cursorarrow"
        case .table:
            "tablecells.fill"
        }
    }
}



enum MethodOptions: CaseIterable, Identifiable {
    case bisectiaApriori
    case bisectiaAposteriori
    case secanta
    case coarda
    case newton
    case mixta
    
    var id: String {
        switch self {
        case .bisectiaApriori:
            "bisectiaA"
        case .bisectiaAposteriori:
            "bisectiaP"
        case .secanta:
            "secanta"
        case .coarda:
            "coarda"
        case .newton:
            "newton"
        case .mixta:
            "mixta"
        }
    }
    
    var displayName: String{
        switch self {
        case .bisectiaApriori:
            "Bisectia Apriori"
        case .bisectiaAposteriori:
            "Bisectia Aposteriori"
        case .secanta:
            "Secanta"
        case .coarda:
            "Coarda"
        case .newton:
            "Newton"
        case .mixta:
            "Mixta"
        }
    }
}
