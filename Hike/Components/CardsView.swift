//
//  CardsView.swift
//  Hike
//
//  Created by Rafael Franco on 23/09/24.
//

import SwiftUI

struct CardsView: View {
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
//              MARK: - HEADER
                
                VStack (alignment: .leading){
                    HStack {
                        Text("Trilha")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        Spacer()
                        
                        Button{
                            // ACTION: Mostrar uma planilha
                            print("Botao foi pressionado")
                        } label: {
                            CustomButtonView()
                        }
                    }
                    
                    Text("As trilhas são uma ótima maneira de conhecer novos lugares e estar junto a natureza")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }//:HEADER
                .padding(.horizontal, 30)
//                MARK: - CONTENT
                
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color("ColorIndigoMedium"),
                                    Color("ColorSalmonLight")
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomLeading
                            )
                        )
                        .frame(width: 256, height: 256)
                    
                    Image("image-1")
                        .resizable()
                        .scaledToFit()
                }
//                MARK: - FOOTER
            }//:VSTACK
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardsView()
}
