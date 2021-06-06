//
//  CircleView.swift
//  UI-227
//
//  Created by にゃんにゃん丸 on 2021/06/06.
//

import SwiftUI

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func getSafaArea()->UIEdgeInsets{
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

struct CircleView: View {
    
    
    @State var  maxCircleoffset : CGFloat = 0
    
    @State var signIn = false
    var body: some View {
        VStack{
            
            
            GeometryReader{proxy ->AnyView in
                
                let hight = proxy.frame(in: .global).height
                
                DispatchQueue.main.async {
                    if maxCircleoffset == 0{
                        
                        
                        maxCircleoffset = hight
                        
                    }
                }
                
                
                return AnyView(
                
                    ZStack{
                        
                        
                        Circle()
                            .fill(Color("dark"))
                            .offset(x: -getRect().width / 2, y: -hight / 1.3)
                        
                        Circle()
                            .fill(Color("dark"))
                            .offset(x: getRect().width / 1.6, y: -hight / 1.3)
                        
                        Circle()
                            .fill(Color("lb"))
                            .offset(y: -hight / 1.3)
                            .rotationEffect(.init(degrees: -5))
                        
                        
                        
                          
                        
                        
                    }
                
                )
                
                
                
                
                
            }
            .frame(height: getRect().width)
            
            ZStack{
                
                
                if signIn{
                    
                    SignUp()
                    
                   
                        .transition(.move(edge: .trailing))
                    
                }
                
                else{
                    
                    Login()
                    
                    
                        .transition(.move(edge: .trailing))
                    
                    
                    
                }
                
                
                
            }
            .padding(.top,-maxCircleoffset / (getRect().height < 750 ? 1.5 : 1.6))
            .frame(maxHeight: .infinity, alignment: .top)
           
        }
        .overlay(
        
        
            HStack{
                
                
                Text(signIn ? "New Member" : "Already Member?")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                
                Button(action: {
                    withAnimation{
                        
                        
                        signIn.toggle()
                    }
                    
                    
                }, label: {
                    Text(signIn ? "Sign Up" : "Sign IN")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                })
                
            }
            .padding(.bottom,getSafaArea().bottom == 0 ? 15 : 0)
            
            ,alignment: .bottom
        
        )
        .background(
        
        
            HStack{
                
                
                Circle()
                    .fill(Color("lb"))
                    .frame(width: 50, height: 50)
                    .offset(x: -30,y:getRect().height < 750 ? 10 : 0)
                
                
                Spacer(minLength: 0)
                
                Circle()
                    .fill(Color("dark"))
                    .frame(width: 120, height: 120)
                    .offset(x: 40, y: 20)
                
            }
            .offset(y: getSafaArea().bottom + 30)
            ,alignment: .bottom
            
               
                
        
        )
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
