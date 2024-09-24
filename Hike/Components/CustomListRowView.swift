//
//  CustomListRowView.swift
//  Hike
//
//  Created by Rafael Franco on 24/09/24.
//

import SwiftUI

struct CustomListRowView: View {
    //MARK: PROPETIES
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowlinkLabel: String? = nil
    @State var rowlinkDestination: String? = nil

    var body: some View {
        LabeledContent {
            //: Content
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if (rowlinkLabel != nil && rowlinkDestination != nil ) {
                Link(rowlinkLabel!, destination: URL(string: rowlinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label: {
            //: Label
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)

                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowlinkLabel: "Franco Programador",
            rowlinkDestination: "https://francoprogramador.com.br"
        )
    }
}
