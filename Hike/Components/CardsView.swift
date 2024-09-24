//
//  CardsView.swift
//  Hike
//
//  Created by Rafael Franco on 23/09/24.
//

import SwiftUI

struct CardsView: View {
    
    //MARK: - PROPETIES
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    //MARK: - FUNCTION
    //MARK: DEBUG - Testing functionaries of buttom
    func randomImage() {
        print("--- BUTTON WAS PRESSED ---")
        print("Status: Old image number = \(imageNumber)")
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action: Random number generated is = \(randomNumber)")
        } while randomNumber == imageNumber
            imageNumber = randomNumber
        print("Result: New image number = \(imageNumber)")
        print("-- END OF FUNCTION --")
        print("\n")
        }
    
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
//                            print("Botao foi pressionado")
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
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 0.4), value: imageNumber)
                }
//                MARK: - FOOTER
                Button{
                // ACTION: - Pressionar o botao
                    print("O botao Explorar foi pressionado")
                    randomImage()
                } label: {
                    Text("Explorar Mais")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [
                                .customGreenLight,
                                .customGreenMedium],
                                   startPoint: .top,
                                   endPoint: .bottom
                                )
                            )
                            .shadow(color: .black.opacity(0.25), radius: 0.25, x:1 , y:2)
                }
                .buttonStyle(GradientButtonStyle())
            }//:ZSTACK
        }//: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardsView()
}
