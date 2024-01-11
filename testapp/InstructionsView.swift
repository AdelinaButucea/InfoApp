//
//  InstructionsView.swift
//  testapp
//
//  Created by Adelina Butucea on 07.01.2024.
//

import Foundation
import SwiftUI

struct InstructionsView: View {
    var body: some View {
        VStack{
            List{
                VStack (alignment: .leading) {
                    Label("Matrice", systemImage: MainOptions.matrices.iconName)
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                        .font(.system(size: 15))
                    VStack (alignment: .leading) {
                        Text("Se vor calcula: determinantul, forma canonica dupa doua metode, Gauss si Jordan Gauss, matricea inversa si inmultirea a doua matrice.")
                        HStack{
                            Text("In aceasta categorie sunt doua optiuni: ")
                            Label("Tip fisier", systemImage: MatrixOptions.string.iconName)
                            Text("si")
                            Label("Tip tabel:", systemImage: MatrixOptions.table.iconName)
                        }
                        Divider()
                        Label("Tip fisier", systemImage: MatrixOptions.string.iconName)
                        Text("Aici aveti optiunea de a introduce o matrice cu numere separate prin virgula.")
                        TextEditor(text: .constant("1, 2, 3, 4 \n5, 6, 7, 8\n9, 10, 11, 12\n13, 14, 15, 16"))
                            .font(.system(size:14))
                            .padding()
                            .foregroundColor(.secondary)
                        Text("Daca omiteti un numar ca in exemplu, se va inlocui automat cu 0:")
                        HStack{
                            TextEditor(text: .constant("1, 2, 3, 4 \n5, 6, 7, 8\n9, 10, 11\n13, 14"))
                                .font(.system(size:14))
                                .foregroundColor(.secondary)
                                .padding()
                            Label("", systemImage: "arrowshape.right.fill")
                            TextEditor(text: .constant("1, 2, 3, 4 \n5, 6, 7, 8\n9, 10, 11, 0\n13, 14, 0, 0"))
                                .font(.system(size:14))
                                .foregroundColor(.secondary)
                                .padding()
                        }
                        Divider()
                        Label("Tip tabel", systemImage: MatrixOptions.table.iconName)
                        Text("Aici puteti introduce o matrice in celule in functie de dimensiunile specificate.")
                        VStack {
                            ForEach(0..<3, id: \.self) { rowIndex in
                                HStack {
                                    ForEach(0..<3, id: \.self) { colIndex in
                                        TextField("", text:.constant(String(rowIndex + colIndex)))
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .multilineTextAlignment(.center)
                                            .frame(width: 60)
                                    }
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 20))
                    
                    
                    
//
                    Divider()
                    Label("Grafice", systemImage:MainOptions.graphs.iconName)
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                        .font(.system(size: 15))
                    VStack{
                        
                        Text("Aici puteti construi graficul functiei specificate si al derivatei acesteia. Puteti alege intervalul pe care doriti sa vizualizati functia.")
                    }
                    Divider()
                    Label("Integrale", systemImage:MainOptions.integrals.iconName)
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                        .font(.system(size: 15))
                    VStack{
                        
                        Text("Aici puteti calcula valoarea unei integrale pe un interval si sa vizualizati graficul functiei specificate. Din cauza puterii computationale necesare, eps = 0.01, pentru a se calcula in timp util o integrala pe un interval relativ mare.")
                        Text("Puteti alege una din patru metode de calcul.")
                            .bold()
                    }
                    
                    Divider()
                    Label("Ecuatii", systemImage: MainOptions.equations.iconName)
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                        .font(.system(size: 15))
                    VStack(alignment: .leading){
                        
                        Text("Aici puteti afla solutia unei ecuatii specificand un interval. Puteti alege una din sase metode, la unele va trebui sa introduceti detalii suplimentare.")
                        Text("Sunt prezentate si graficele functiei si derivatei acesteia pentru intuitie.")
                    }
                    
                    Divider()
                    Label("Scrierea Functiilor", systemImage: "pencil.line")
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                        .font(.system(size: 15))
                    VStack(alignment: .leading){
                        Section{
                            Text("\u{221A}x = sqrt(x)")
                            Text("x\u{00B2} = pow(x, 2) [sau orice alt numar]")
                            Text("ln x = log(x)")
                            Text("arctg x = atan(x)")
                            Text("arcsin x = asin(x)")
                            Text("arccos x = acos(x)")
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    }
                    
                }
            }
            
        }
    }
}


#Preview {
    InstructionsView()
}
