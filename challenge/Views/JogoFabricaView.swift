//
//  JogoFabricaView.swift
//  Challenge
//
//  Created by Felipe Colares Cardoso on 25/05/26.
//
//
//  JogoFabricaView.swift
//  Challenge
//
//  Created by Felipe Colares Cardoso on 25/05/26.
//

import SwiftUI
import Combine
import Foundation

struct JogoFabricaView: View {
   @State private var viewModel = JogoChuvaViewModel()
   
   
 
   
   var body: some View {
       GeometryReader { geometry in
           
           
           
           ZStack{
               
               
               Image("Prédio 2")
                   .interpolation(.none)
                   .resizable(resizingMode: .stretch)
                   .aspectRatio(contentMode: .fill)
                   .frame(width: 200, height: 200)
                   .offset(x: -100, y: 130)
               Image("Prédio 1")
                   .interpolation(.none)
                   .resizable(resizingMode: .stretch)
                   .aspectRatio(contentMode: .fill)
                   .frame(width: 200, height: 200)
                   .offset(x: 150, y: 130)
               
               
               Image("usina")
                   .interpolation(.none)
                   .resizable(resizingMode: .stretch)
                   .aspectRatio(contentMode: .fill)
                   .frame(width: 433, height: 282)
                   .offset(x: -230, y: 280)
               Image("usina")
                   .interpolation(.none)
                   .resizable()
                   .aspectRatio(contentMode: .fill)
                   .frame(width: 433, height: 282)
                   .offset(x: -1100, y: 290)
               
               
               
               
               Image("Fábrica Expandida")
                   .interpolation(.none)
                   .resizable()
                   .resizable(resizingMode: .stretch)
                   .scaledToFit()
                   .offset(x: -600, y: 130)
               // .frame(width: geometry.size.width , height: geometry.size.height)
               
               
               Image("Cercado Expandido")
                   .interpolation(.none)
                   .resizable(resizingMode: .stretch)
                   .scaledToFill()
                   .padding(.bottom, 80)
                   .ignoresSafeArea()
                   .offset(x: -400, y: 130)
               
               ZStack{
                   Image("Placa")
                       .interpolation(.none)
                       .resizable()
                   //Scale(0.6)
                       .scaledToFit()
                       .frame(width: 600, height: 600)
                       // .offset(x: -100, y: 280
                   
                       .position(x: geometry.size.width, y: geometry.size.width / 2 + 80 )
                       .containerRelativeFrame(.vertical){length, axis in length / 2}
                   
                   
                   
                   
                   
                   // INTERFACE INTERATIVA
                   
ZStack{
                   // Retângulo guia
                   RoundedRectangle(cornerRadius: 20)
                   .stroke(Color.white, lineWidth: 5)
                   .fill(Color.cinzaEscuro)
                   .foregroundColor(.white)
                   //.fill(Color.gray)
                   .frame(width: 1000, height: 100)
                   .position(x: geometry.size.width / 2, y: geometry.size.width / 2 + 150 )
                   .containerRelativeFrame(.vertical){length, axis in length / 2} // travar na parte inferior da tela no sentido vertical
                   
                   Text("Controle de Produção")
                       .font(
                       Font.custom("Inter", size: 20)
                           .weight(.bold)
                       )
                       .foregroundColor(.white)
                       .position(x: geometry.size.width / 2 - 340, y: geometry.size.width / 2 + 150 )
                       .containerRelativeFrame(.vertical){length, axis in length / 2} // travar na parte
                  
                   
                   
                   
                   ZStack{
                       // retângulo inferior
                       Image("Rectangle 201")
                           .resizable()
                       //Scale(0.6)
                           .scaledToFit()
                           .frame(width: 350, height: 350)
                           .position(x: geometry.size.width / 2, y: geometry.size.width / 2 + 150 )
                       // .offset(y:  y: geometry.frame(in: .global).maxY)
                           .containerRelativeFrame(.vertical){length, axis in length / 2}
                       
                       ZStack{
                           // Peça do medidor
                           Image("Union")
                               .resizable()
                           //Scale(0.6)
                               .scaledToFit()
                               .frame(width: 350, height: 350)
                               .position(x: geometry.size.width / 2, y: geometry.size.width / 2 + 40)
                               .containerRelativeFrame(.vertical){length, axis in length / 2}
                           // local do medidor
                           
                           
                           
                           
                         
                           ZStack{
                               // Botões de aumentar e subtrair
                             
                               /*
                               ButtonsComponent(
                                   botao: BotaoPrincipalObjeto.ArrayBotoes[11],
                                   tela: ContentView()
                               )
                                   .position(x: geometry.size.width / 2 - 100, y: geometry.size.width / 2 + 150 )
                                   .containerRelativeFrame(.vertical){length, axis in length / 2}
                               
                               ButtonsComponent(
                                   botao: BotaoPrincipalObjeto.ArrayBotoes[12],
                                   tela: ContentView()
                               )
                                   .position(x: geometry.size.width / 2 + 100, y: geometry.size.width / 2 + 150 )
                                   .containerRelativeFrame(.vertical){length, axis in length / 2}
                                   */
                               ButtonsComponent(
                                botao: BotaoPrincipalObjeto.ArrayBotoes[8]){}
                                  // tela: ContentView()
                               
                               .position(x: geometry.size.width / 2 + 340, y: geometry.size.width / 2 + 150 )
                               .containerRelativeFrame(.vertical){length, axis in length / 2}
                              
                               
                               ZStack{
                                   // Marcadores
                                   Image("Vector 21") // faixa verde
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 120, height: 120)
                                       .position(x: geometry.size.width / 2 - 100, y: geometry.size.width / 2 + 35)
                                       .containerRelativeFrame(.vertical){length, axis in length / 2}
                           
                                   Image("Vector 23") // faixa vermelha
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 125, height: 120)
                                       .position(x: geometry.size.width / 2 + 98, y: geometry.size.width / 2 + 35)
                                       .containerRelativeFrame(.vertical){length, axis in length / 2}
                                   
                                   Image("Vector 22") // faixa amarela
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 130, height: 125)
                                       .position(x: geometry.size.width / 2 - 3, y: geometry.size.width / 2 - 16)
                                       .containerRelativeFrame(.vertical){length, axis in length / 2}
                                
                                   Medidor()
                                           .position(x: geometry.size.width / 2, y: geometry.size.width / 2 + 10)
                                           .containerRelativeFrame(.vertical){length, axis in length / 2}
                                   // circulo central
                                   Circle()
                                       .fill(Color.botaoTexto)
                                       .stroke(Color.botaoCinza, lineWidth: 5)
                                       .frame(width: 40, height: 40)
                                       .position(x: geometry.size.width / 2, y: geometry.size.width / 2 + 100)
                                       .containerRelativeFrame(.vertical){length, axis in length / 2}
                                   
                                   CaixaDeTexto(index: 1)
                                       .position(x: geometry.size.width / 2)
                                       .containerRelativeFrame(.vertical){length, axis in length}
                                       .padding(.top, 270)
                                   
                                   Image("Emissão de Poluentes")
                                     .position(x: geometry.size.width / 2)
                                     .containerRelativeFrame(.vertical){length, axis in length}
                                     .padding(.top, 70)
                                    // .foregroundColor(Color(red: 0.1, green: 0.4, blue: 0.62))
                                   
                                   
                               }
                           }
                       }
                   }
                   }.scaleEffect(x: geometry.size.width / geometry.size.width, y: geometry.size.height / geometry.size.height)
                       .position(x: geometry.size.width, y: geometry.size.height / 2)
                       //.padding(.bottom, geometry.size.height)
                       .safeAreaPadding(.vertical, -20)// ajustar menu para a parte de baixo da tela , adequando-se a safearea e de forma responsiva
                  
                   
               }
            
           }
           .frame(
               maxWidth: .infinity, maxHeight: .infinity
           )
           .background(Image("Céu Expandido"))
       }.scaledToFit()
     //  .edgesIgnoringSafeArea(.all)
       
       
       
   }
}


   #Preview {
       JogoFabricaView()
           //.previewInterfaceOrientation(.landscapeRight)
   }



/*
 //
//  JogoFabricaView.swift
//  Challenge
//
//  Created by Felipe Colares Cardoso on 25/05/26.
//

import SwiftUI
import Combine
import Foundation

struct JogoFabricaView: View {
    @State private var viewModel = JogoChuvaViewModel()
    
    
  
    
    var body: some View {
        GeometryReader { geometry in
            
            
            
            ZStack{
                
                
                Image("Prédio 2")
                    .interpolation(.none)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .offset(x: -100, y: 130)
                Image("Prédio 1")
                    .interpolation(.none)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .offset(x: 150, y: 130)
                
                
                Image("usina")
                    .interpolation(.none)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 433, height: 282)
                    .offset(x: -230, y: 280)
                Image("usina")
                    .interpolation(.none)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 433, height: 282)
                    .offset(x: -1100, y: 290)
                
                
                
                
                Image("Fábrica Expandida")
                    .interpolation(.none)
                    .resizable()
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                    .offset(x: -600, y: 130)
                // .frame(width: geometry.size.width , height: geometry.size.height)
                
                
                Image("Cercado Expandido")
                    .interpolation(.none)
                    .resizable(resizingMode: .stretch)
                    .scaledToFill()
                    .padding(.bottom, 80)
                    .ignoresSafeArea()
                    .offset(x: -400, y: 130)
                
                ZStack{
                    Image("Placa")
                        .interpolation(.none)
                        .resizable()
                    //Scale(0.6)
                        .scaledToFit()
                        .frame(width: 600, height: 600)
                        // .offset(x: -100, y: 280
                    
                        .position(x: geometry.size.width, y: geometry.size.width / 2 + 80 )
                        .containerRelativeFrame(.vertical){length, axis in length / 2}
                    
                    
                    
                    
                    
                    // INTERFACE INTERATIVA
                    
ZStack{
                    // Retângulo guia
                    RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 5)
                    .fill(Color.cinzaEscuro)
                    .foregroundColor(.white)
                    //.fill(Color.gray)
                    .frame(width: 1000, height: 100)
                    .position(x: geometry.size.width / 2, y: geometry.size.width / 2 + 150 )
                    .containerRelativeFrame(.vertical){length, axis in length / 2} // travar na parte inferior da tela no sentido vertical
                    
                    Text("Controle de Produção")
                        .font(
                        Font.custom("Inter", size: 20)
                            .weight(.bold)
                        )
                        .foregroundColor(.white)
                        .position(x: geometry.size.width / 2 - 340, y: geometry.size.width / 2 + 150 )
                        .containerRelativeFrame(.vertical){length, axis in length / 2} // travar na parte
                   
                    
                    
                    
                    ZStack{
                        // retângulo inferior
                        Image("Rectangle 201")
                            .resizable()
                        //Scale(0.6)
                            .scaledToFit()
                            .frame(width: 350, height: 350)
                            .position(x: geometry.size.width / 2, y: geometry.size.width / 2 + 150 )
                        // .offset(y:  y: geometry.frame(in: .global).maxY)
                            .containerRelativeFrame(.vertical){length, axis in length / 2}
                        
                        ZStack{
                            // Peça do medidor
                            Image("Union")
                                .resizable()
                            //Scale(0.6)
                                .scaledToFit()
                                .frame(width: 350, height: 350)
                                .position(x: geometry.size.width / 2, y: geometry.size.width / 2 + 40)
                                .containerRelativeFrame(.vertical){length, axis in length / 2}
                            // local do medidor
                            
                            
                            
                            
                          
                            ZStack{
                                // Botões de aumentar e subtrair
                              
                                /*
                                ButtonsComponent(
                                    botao: BotaoPrincipalObjeto.ArrayBotoes[11],
                                    tela: ContentView()
                                )
                                    .position(x: geometry.size.width / 2 - 100, y: geometry.size.width / 2 + 150 )
                                    .containerRelativeFrame(.vertical){length, axis in length / 2}
                                
                                ButtonsComponent(
                                    botao: BotaoPrincipalObjeto.ArrayBotoes[12],
                                    tela: ContentView()
                                )
                                    .position(x: geometry.size.width / 2 + 100, y: geometry.size.width / 2 + 150 )
                                    .containerRelativeFrame(.vertical){length, axis in length / 2}
                                    */
                                ButtonsComponent(
                                    botao: BotaoPrincipalObjeto.ArrayBotoes[8],
                                    tela: ContentView()
                                )
                                .position(x: geometry.size.width / 2 + 340, y: geometry.size.width / 2 + 150 )
                                .containerRelativeFrame(.vertical){length, axis in length / 2}
                               
                                
                                ZStack{
                                    // Marcadores
                                    Image("Vector 21") // faixa verde
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 120, height: 120)
                                        .position(x: geometry.size.width / 2 - 100, y: geometry.size.width / 2 + 35)
                                        .containerRelativeFrame(.vertical){length, axis in length / 2}
                            
                                    Image("Vector 23") // faixa vermelha
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 125, height: 120)
                                        .position(x: geometry.size.width / 2 + 98, y: geometry.size.width / 2 + 35)
                                        .containerRelativeFrame(.vertical){length, axis in length / 2}
                                    
                                    Image("Vector 22") // faixa amarela
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 130, height: 125)
                                        .position(x: geometry.size.width / 2 - 3, y: geometry.size.width / 2 - 16)
                                        .containerRelativeFrame(.vertical){length, axis in length / 2}
                                 
                                    Medidor()
                                            .position(x: geometry.size.width / 2, y: geometry.size.width / 2 + 10)
                                            .containerRelativeFrame(.vertical){length, axis in length / 2}
                                    // circulo central
                                    Circle()
                                        .fill(Color.botaoTexto)
                                        .stroke(Color.botaoCinza, lineWidth: 5)
                                        .frame(width: 40, height: 40)
                                        .position(x: geometry.size.width / 2, y: geometry.size.width / 2 + 100)
                                        .containerRelativeFrame(.vertical){length, axis in length / 2}
                                    
                                    CaixaDeTexto(index: 1)
                                        .position(x: geometry.size.width / 2)
                                        .containerRelativeFrame(.vertical){length, axis in length}
                                        .padding(.top, 270)
                                    
                                    Image("Emissão de Poluentes")
                                      .position(x: geometry.size.width / 2)
                                      .containerRelativeFrame(.vertical){length, axis in length}
                                      .padding(.top, 70)
                                     // .foregroundColor(Color(red: 0.1, green: 0.4, blue: 0.62))
                                    
                                    
                                }
                            }
                        }
                    }
                    }.scaleEffect(x: geometry.size.width / geometry.size.width, y: geometry.size.height / geometry.size.height)
                        .position(x: geometry.size.width, y: geometry.size.height / 2)
                        //.padding(.bottom, geometry.size.height)
                        .safeAreaPadding(.vertical, -20)// ajustar menu para a parte de baixo da tela , adequando-se a safearea e de forma responsiva
                   
                    
                }
             
            }
            .frame(
                maxWidth: .infinity, maxHeight: .infinity
            )
            .background(Image("Céu Expandido"))
        }.scaledToFit()
      //  .edgesIgnoringSafeArea(.all)
        
        
        
    }
}


    #Preview {
        JogoFabricaView()
            //.previewInterfaceOrientation(.landscapeRight)
    }

 
 
 ButtonsComponent(
     botao: BotaoPrincipalObjeto.ArrayBotoes[8]){
         
     }
 .position(x: geometry.size.width / 2 + 340, y: geometry.size.width / 2 + 150 )
 .containerRelativeFrame(.vertical){length, axis in length / 2}

 
*/
