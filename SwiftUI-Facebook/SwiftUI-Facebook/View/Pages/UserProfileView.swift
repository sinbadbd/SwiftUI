//
//  ProfileView.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 1/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    @State var show = false
    @State var showCertificates = false
    @State var viewState = CGSize.zero
    @State var showLogin = false
    var menu: [Menu] = menuData
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical){
                VStack{
                    CoverPicture()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped().cornerRadius(10)
                        .padding([.leading, .trailing], 15)
                    
                    UserProfilePic()
                        .offset(y: -130)
                        .padding(.bottom, -130)
                    
                    ZStack{
                        // MARK: TODO : NEED TO FIX
                        //                        Circle().frame(width: 40, height: 40).offset(x: 50, y: -50).foregroundColor(.init(red: 240/255, green: 240/255, blue: 240/255))
                        //                        Circle().stroke(Color.white, lineWidth: 2).frame(width: 40, height: 40).offset(x: 50, y: -50)
                        //                        ZStack{
                        //                           // MenuButton(show: $show).offset(x: 50, y: -50).foregroundColor(.black)
                        //                        }
                        
                        MenuButton(show: $show).offset(x: 50, y: -50).foregroundColor(.black)
                    }
                    
                    VStack{
                        HStack(alignment: .top){
                            Text("Spider man")
                                .font(.system(size: 34))
                                .foregroundColor(.black).padding(.top, -40)
                            Text("(Peter Parker)").font(.system(size: 24)).padding(.top, -32)
                        }
                        
                        Text("Spider-Man is a fictional superhero created by writer-editor Stan Lee and writer-artist Steve Ditko.").font(.system(size: 20))
                            .lineLimit(5)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing],  10)
                    }
                    
                    
                    
                    HStack( spacing: 30){
                        Button(action: {
                            
                        }) {
                            
                            Circle().frame(width: 60, height: 60).foregroundColor(Color.init(red: 233/255, green: 242/255, blue: 254/255))
                            ZStack{
                                Image(systemName: "plus").offset(y: -45)
                            }
                            Text("Add Story").padding(.top, -25).font(.system(size: 18))
                            
                        }
                        
                        Button(action: {
                            
                        }) {
                            Circle().frame(width: 60, height: 60).foregroundColor(.init(red: 235/255, green: 237/255, blue: 239/255))
                            ZStack{
                                Image(systemName: "eye").offset(y: -45)
                            }
                            Text("View as").padding(.top, -25).foregroundColor(.black).font(.system(size: 14))
                        }
                        Button(action: {
                            
                        }) {
                            Circle().frame(width: 60, height: 60).foregroundColor(.init(red: 235/255, green: 237/255, blue: 239/255))
                            ZStack{
                                Image(systemName: "eye").offset(y: -45)
                            }
                            Text("Edit Profile").padding(.top, -25).foregroundColor(.black).font(.system(size: 14))
                        }
                        Button(action: {
                            
                        }) {
                            Circle().frame(width: 60, height: 60).foregroundColor(.init(red: 235/255, green: 237/255, blue: 239/255))
                            ZStack{
                                //Text("•••").offset(y: -45)
                                Image(systemName: "eye").offset(y: -45)
                            }
                            Text("Add Story").padding(.top, -25).foregroundColor(.black).font(.system(size: 14))
                            
                        }
                        
                    }.padding(.top, 30)
                    
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "eye")
                            Text("Fllowed bt ")
                            Text("105 People").font(.headline)
                            Spacer()
                        }
                    }.padding([.leading, .trailing], 20)
                    
                    VStack(alignment: .leading) {
                        Text("Friends")
                            .font(.headline)
                        HStack {
                            Text("190 friends")
                                .font(.subheadline)
                            Spacer()
                            Text("Find Friends")
                                .font(.subheadline)
                        }
                    }.padding([.leading, .trailing], 20)
                    
                    
                    
                    
                    
                    VStack{
                        FlexGridView(columns: 3, numItems: 6, alignment: .leading) { index, colWidth in
                            VStack {
                                Image("spider").resizable().scaledToFit()
                                    .padding(6)
                                    .frame(width: colWidth, height: colWidth)
                                    .tapAction { print("Meow!") }
                                Text(" Spider man \(index)")
                            }
                            .padding()
                                .frame(width: colWidth)
                                //.border(Color.gray)
                                .background(Color.white)
                                .tapAction {
                                    print("Tap!")
                            }
                        }
                    }
                    
                    
                    ZStack{
                        
                        BottomMenu(menu: menu)
                            // .rotation3DEffect(Angle(degrees: show ? 0 : 0), axis: (x: 0, y: 0, z: 0))
                            
                            .animation(.easeInOut(duration: 0.3))
                            
                            .offset(y: show ? 0 : UIScreen.main.bounds.height)
                            .tapAction {
                                self.show.toggle()
                        }
                    }
                    
                    Spacer()
                }.padding()
            }
            .navigationBarTitle("Profile")
        }
    }
}

#if DEBUG
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            UserProfileView(menu: menuData)
                // Home(menu: menuData)
                .environment(\.colorScheme, .dark)
            //                .previewDevice("iPhone SE")
            //                .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
    }
}
#endif

struct MenuButton : View {
    @Binding var show: Bool
    var body: some View {
        return VStack {
            HStack {
                Button(action: { self.show.toggle() }) {
                    HStack {
                        Spacer()
                        Image("Menu")
                            .foregroundColor(.primary)
                    }.padding(17)
                }
                .frame(width: 90, height: 56)
                    //  .background(Color("button"))
                    .cornerRadius(30)
                    // .shadow(color: Color("buttonShadow"), radius: 10, y: 10)
                    .offset(x: -100, y: 82)
                Spacer()
            }
            Spacer()
        }
    }
}
