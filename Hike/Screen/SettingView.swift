//
//  SettingView.swift
//  Hike
//
//  Created by Rafael Franco on 24/09/24.
//

import SwiftUI

struct SettingView: View {
    //MARK: - PROPETIES
    private let alternativeAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Camera",
        "AppIcon-Map",
        "AppIcon-Campfire",
        "AppIcon-Backpack",
        "AppIcon-Mushroom",
    ]

    var body: some View {

        List {
            // MARK: - SECTION: HEADER

            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 72, weight: .black))

                    VStack(spacing: -10) {
                        Text("Trilha")
                            .font(.system(size: 64, weight: .black))
                        Text("Editor Choice")
                            .fontWeight(.medium)
                    }

                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 72, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark,
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .padding(.top, 8)

                VStack(spacing: 8) {
                    Text("Onde encontrar a melhor \ntrilha para você?")
                        .font(.title2)
                        .fontWeight(.heavy)

                    Text(
                        "A trilha que parece linda nas fotos é ainda melhor quando você esta lá. A caminhada que você espera fazer algum dia. \nEncontre as melhores trilhas no app."
                    )
                    .font(.footnote)
                    .italic()

                    Text("Tire as botas do armario e comece a se aventurar!")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)

            }  //: HEADER
            .listRowSeparator(.hidden)

            // MARK: SECTION - ICONS

            Section(header: Text("Ícone alternativo")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternativeAppIcons.indices, id: \.self) {
                            item in
                            Button {
                                print("O botao \(alternativeAppIcons[item]) foi pressionado")
                                
                                UIApplication.shared.setAlternateIconName(alternativeAppIcons[item]) { error in
                                    if error != nil {
                                        print("Falha na solicitação para atualizar o ícone do aplicativo \(String(describing: error? .localizedDescription))")
                                    } else {
                                        print("Sucesso, o ícone do aplicativo foi atualizado para o ícone \(alternativeAppIcons[item])")
                                    }
                                }
                                
                            } label: {
                                Image("\(alternativeAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }  //: SCROLL VIEW
                .padding(.top, 12)
                .padding(.bottom, 12)

                Text(
                    "Escolha seu ícone de aplicativo preferido na coleção acima."
                )
                .frame(minWidth: 0, maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .font(.footnote)

            }  //: SECTION
            .listRowSeparator(.hidden)

            // MARK: SECTION - ABOUT
            Section(
                header: Text("Sobre o app"),
                footer: HStack {
                    Spacer()
                    Text("Todos os direitos reservados")
                    Spacer()
                }
                .padding(.vertical, 8)
            ) {
                //MARK: BASIC LABELED CONTENT
                //            LabeledContent("Aplicativo", value: "Trilha")

                //MARK: ADVANCED LABELED CONTENT
                CustomListRowView(
                    rowLabel: "Aplicativo", rowIcon: "apps.iphone",
                    rowContent: "Trilha", rowTintColor: .blue)

                CustomListRowView(
                    rowLabel: "Compatibilidade", rowIcon: "info.circle",
                    rowContent: "iOS, iPad", rowTintColor: .red)

                CustomListRowView(
                    rowLabel: "Tecnologia", rowIcon: "swift",
                    rowContent: "SwiftUI", rowTintColor: .orange)

                CustomListRowView(
                    rowLabel: "Versão", rowIcon: "gear", rowContent: "1.0.0",
                    rowTintColor: .purple)

                CustomListRowView(
                    rowLabel: "Desenvolvedor", rowIcon: "ellipsis.curlybraces",
                    rowContent: "Rafael Franco", rowTintColor: .mint)

                CustomListRowView(
                    rowLabel: "Designer", rowIcon: "paintpalette",
                    rowContent: "Flávia Franco", rowTintColor: .pink)

                CustomListRowView(
                    rowLabel: "Web", rowIcon: "globe", rowTintColor: .indigo,
                    rowlinkLabel: "Franco Programador",
                    rowlinkDestination: "https://francoprogramador.com.br")

            }  //: SECTION
        }  //: LIST
    }
}

#Preview {
    SettingView()
}
