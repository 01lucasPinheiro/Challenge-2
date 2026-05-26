//
//  IconeNuvem.swift
//  teste
//
//  Created by Felipe Colares Cardoso on 26/05/26.
//

import SwiftUI

struct IconeNuvem: View {
    var body: some View {
        
        ZStack{
            Image("elipseIcone")
                .resizable()
                .frame(width: 100, height: 100)
            Image("nuvemIcone")
                .resizable()
                .frame(width: 80, height: 80)
        }}
}
#Preview {
    IconeNuvem()
}


