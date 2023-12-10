//
//  ContentView.swift
//  English101Final
//
//  Created by Denzel Nyatsanza on 12/8/23.
//

import SwiftUI


struct Post: Identifiable, Equatable {
    var id = UUID().uuidString
    var imageNames: [String]
    var title: String
    var body: String
    var name: String
}

struct ContentView: View {
    
    @Environment (\.safeAreaInsets) var safeAreaInsets
    
    var background: some View {
        ZStack {
//            Color.black
            VStack {
                HStack {
                    Circle()
                        .fill(Color.teal)
                        .frame(width: 100, height: 100)
                        .offset(x: !showGuide ? 300:0)
                        .animation(.linear(duration: 10).repeatForever(autoreverses: true), value: showGuide)
                        .blur(radius: 100)

                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 100, height: 100)
                        .offset(x: !showGuide ? -300:0)
                        .animation(.linear(duration: 10).repeatForever(autoreverses: true), value: showGuide)
                        .blur(radius: 100)

                }
            }
            if selected?.title == "The good" {
                Color.green.opacity(0.2)
            } else if selected?.title == "The bad" {
                Color.red.opacity(0.3)
            } else {
                Color.white.opacity(0.09)
            }
        }
    }
    
    @State var selection: Int = 0
    
    
    var posts: [Post] = [
        
        .init(imageNames: ["1", "2"], title: "What Is The Second Amendment", body: "According to the consitution of the United States, 'A well regulated Militia, being necessary to the security of a free State, the right of the people to keep and bear Arms, shall not be infringed.'\n\nThe Second Amendment is often interpreted as an individual's right to use and carry arms for self-defense. Some say that the Second Amendment protects Americans' lives, property, and liberty. Others say that the Second Amendment was designed to allow slave owners to quickly suppress rebellion.\n\nThe House debated and modified the Second Amendment in late August 1789. Since then, Congress has placed more restrictions on the transportation, possession, and receipt of firearms. Some have also proposed a national registration or prohibition of firearms", name: "John"),
        .init(imageNames: ["3", "4"], title: "Why the second amendment?", body: "The Second Amendment was written to protect the right of states to have militias. The amendment's goal was to preserve the idea of the citizen-soldier. The Second Amendment was also intended to:\n\nProvide a well-trained force: To check federal tyranny Distribute power equally: To bring constitutional balance \n\nProtect the nation: To provide for its defense\n\nJames Madison introduced the Second Amendment to address concerns about the military, the balance of power between the federal and state governments, and the use of standing armies.", name: "Jill"),
        .init(imageNames: ["5"], title: "The good", body: "The Second Amendment guarantees Americans the fundamental right “to keep and bear arms”. The Supreme Court correctly interpreted this guarantee as an individual right as opposed to a collective right enjoyed only by colonial militias. Many gun control efforts threaten the rights of law- abiding Americans while criminals intent on hurting themselves or others continue to ignore the law. These efforts also harm the ability of Americans to protect themselves and their families, disproportionately hurting minorities and those living in high-crime areas. Senator Lee has led the fight against efforts to further restrict the ability of law-abiding Americans to exercise this fundamental right and he supports efforts to roll back existing gun control laws\n\nBeing pro 2A is a very common thing in the southern states, this often just means that you think the gun laws are a little strict but you can live with them or you think that they are too strict and infringe on your rights. Most people that are pro 2A are towards the side of hunters, sports shooters, and firearms enthusiasts. They often argue to the point of firearms just being ostracized in the media and only shown in a negative light. This is often followed by the point that knives are involved in a significantly larger amount of crimes. They also argue that automatic firearms have strict laws and removing guns from the hands of proper owners would only cause more issues.", name: "Coby"),
        .init(imageNames: ["6", "7", "8"], title: "The bad", body: "There is a negative connotation that stigmatizes firearms, they are often attributed to gun violence and being in crime rings. This is often false, even though there are guns in the hands of criminals they are often stolen guns. The anti 2A community often argues that it is too easy to purchase a firearm if you're a bad person and that nobody should be allowed to own an automatic weapon or the accessories for one. This is more common towards the northern parts of the states. The anti 2A community often tries to get the government to hold raids and gun buybacks/confiscations to remove the firearms from the hands of people.\n\nThe amount of murders involving guns from 2005 to 2020 were at 68%, while the amount of assaults that were committed were only 21% gun related. The amount of gun related deaths has steadily fell from 1999 which peaked at 11,547. 60% to 74% of gun crimes were related to gangs and drug related altercations.", name: "Ken"),
        .init(imageNames: [], title: "Banning is the best option", body: "While advocating for the outright banning of the Second Amendment may seem like a radical proposal, it is essential to consider the potential benefits in the context of addressing public safety and reducing gun violence. Proponents argue that such a measure could lead to a significant decrease in firearm- related incidents, as stricter gun control measures would limit access to weapons for individuals with malicious intent.\n\nThe United States has witnessed numerous tragic events involving mass shootings, and advocates for the repeal of the Second Amendment contend that restricting access to firearms would mitigate the frequency and severity of such incidents. Furthermore, proponents of a ban argue that it would enable law enforcement to more effectively regulate and monitor the possession of firearms, potentially preventing individuals with a history of violence or mental health issues from obtaining weapons.\n\nHowever, it is crucial to acknowledge the counterargument that the Second Amendment is deeply ingrained in American culture, and any attempt to eliminate it would face strong opposition based on constitutional rights and individual freedoms. Additionally, opponents argue that a blanket ban could disproportionately affect law-abiding citizens who use firearms for self-defense or recreational purposes.\n\nStriking a balance between public safety and individual liberties remains a complex challenge, and alternative measures, such as comprehensive background checks, mental health assessments, and stricter regulation, may offer more pragmatic solutions while respecting the constitutional framework.", name: "Denzel")
    
    ]
    
    @State var selected: Post?
    
    @Namespace var namespace
    
    var body: some View {
        
        ZStack {
            ZStack {
                background
                    .ignoresSafeArea()
                if !shouldBegin {
                    onBoarding
                } else {
                    discussionView
                }
                /*
                 TabView(selection: $selection) {
                 
                 
                 
                 }
                 ignoresSafeArea()
                 */
                
            }
            .blur(radius: (showGuide ? 10:0))
            .onTapGesture {
                if showGuide {
                    withAnimation(.spring()) {
                        showGuide = false
                    }
                }
            }
            VStack(alignment: .leading) {
                
                    Text("Usage Guide")
                    .font(.title3.bold())
                    .padding(.bottom)
                    Text("This app is designed for the sole purpose of fufilling an English 101 Assignment and should not be used as official documentation. It is intended to meet the assignment requirements of forming a thesis on a argumentative topic, developing it and expressing it in multiple forms of media rather than the general text form.\n\n This app is designed in a social form, where fictional users create a balanced discussion over the subject 'My Second Amendment'\n\nMany UI Elements do not work, that's on a purpose, a greater part of this app is to mimic a discursive social platform.\n\n 1. Scroll through all posts by scrolling up and down.\n\n2. Click a post to view it more in detail")
                
                Button {
                    withAnimation(.spring()) {
                        showGuide = false
                    }
                } label: {
                    Text("Understood")
                        .font(.title3.bold())
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(.linearGradient(colors: [.orange, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .clipShape(.rect(cornerRadius: 12, style: .continuous))
                }
                .foregroundStyle(.white)
            }
            .padding()
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 22, style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 2, y: 7)
            .offset(y: showGuide ? 0:1000)
            .padding(40)
            }
        }
    @State var showGuide = false
    
    var discussionView: some View {
        GeometryReader {
            let size = $0.size
            
            ScrollView {
                
                VStack(spacing: 0) {
                    Text("Discussion Prompt:\n\n'Write an argument based on the second amendment, one response should discuss the what it is, why, pros, cons.'\n\nCreated Friday, Dec 8th 2023")
                        .font(.subheadline.bold())
                        .multilineTextAlignment(.leading)
                        .italic()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.secondary.opacity(0.1))
                        .clipShape(.rect(cornerRadius: 17, style: .continuous))
                        .padding()
                    ForEach(posts) { post in
                        if selected == nil || selected == post {
                            ZStack {
                                if selected == post {
                                    background
                                        .ignoresSafeArea()
                                }
                                VStack {
                                  
                                    HStack {
                                        Image(systemName: "person.fill")
                                            .font(.title3)
                                            .foregroundStyle(.secondary)
                                            .padding(10)
                                            .background(Color.secondary.opacity(0.5))
                                            .clipShape(.rect(cornerRadius: 12, style: .continuous))
                                            .opacity(0.5)
                                        Text(post.name + "'s response")
                                            .bold()
                                        Spacer()
                                        Image(systemName: "ellipsis")
                                            .font(.title)
                                    }
                                    HStack {
                                        if selected == nil {
                                            if !post.imageNames.isEmpty {
                                                TabView {
                                                    ForEach(post.imageNames, id: \.self) { name in
                                                        Image(name)
                                                            .resizable()
                                                            .scaledToFill()
                                                            .tag(name)
                                                    }
                                                }
                                                .tabViewStyle(.page(indexDisplayMode: .never))
                                                .frame(width: size.width / 5, height: size.width / 5)
                                                .clipShape(.rect(cornerRadius: 7, style: .continuous))
                                                .matchedGeometryEffect(id: "namespace-\(post.id)", in: namespace)
                                            }
                                        }
                                        
                                        VStack {
                                            HStack {
                                                Text(post.title)
                                                    .font(.title)
                                                    .bold()
                                                Spacer()
                                            }
                                            if let selected, selected == post, !post.imageNames.isEmpty {
                                                TabView {
                                                    ForEach(post.imageNames, id: \.self) { name in
                                                        Image(name)
                                                            .resizable()
                                                            .scaledToFill()
                                                            .tag(name)
                                                    }
                                                }
                                                .tabViewStyle(.page)
                                                .frame(height: size.width - 40)
                                                .clipShape(.rect(cornerRadius: 7, style: .continuous))
                                                .matchedGeometryEffect(id: "namespace-\(selected.id )", in: namespace)
                                                
                                            }
                                            
                                            if post.title == "The bad" {
                                                
                                                
                                            }
                                            
                                            Text(post.body)
                                                .lineLimit(selected == post ? nil:3)
                                        }
                                    }
                                    
                                    HStack {
                                        Text("\(Int.random(in: 1...10)) minutes ago")
                                            .font(.caption2)
                                        Spacer()
                                        Label("\(Int.random(in: 1...10) * 123) likes", systemImage: "heart.fill")
                                            .font(.caption2)
                                        Divider()
                                            .frame(height: 10)
                                            .padding(.horizontal, 10)
                                        Label("\(Int.random(in: 1...10) * 123) comments", systemImage: "bubble.left.fill")
                                            .font(.caption2)
                                    }
                                    
                                }
                            }
                            .padding()
                            .background(background)
                            .clipShape(.rect(cornerRadius: 7, style: .continuous))
                            .shadow(color: Color.black.opacity(selected == nil ? 0.3:0), radius: 20, x: 0, y: 7)
                            .padding(.horizontal)
                            .contentShape(.rect)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selected = post
                                }
                            }
                        }
                    }
                    
                    Text("End of Discussion")
                        .font(.subheadline.bold())
                        .italic()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.secondary.opacity(0.1))
                        .clipShape(.rect(cornerRadius: 17, style: .continuous))
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Shared Sources")
                            .font(.title.bold())
                        Text("Note these sources are for the entire assignment")
                            .font(.caption)
                        Text("Campbell, Jeffrey P. Bachelor of Arts in History Oklahoma State University, Stillwater, Oklahoma, 2009.\n\nNational Institute of Justice, 'Gun Violence in America,' February 26, 2019, nij.ojp.gov:https://nij.ojp.gov/topics/articles/gun-violence-america\n\nRegent University Law Review. 'Issues in the Second Amendment. Volume 6, 2009, pp. 261-284. https://www.regent.edu/acad/schlaw/student_life/studentorgs/lawreview/docs/issues/v6/6RegentULRev261.pdf.\n\nLee, Mike. 'Protect 2A.' Senator Mike Lee, https://www.lee.senate.gov/protect-2a.")
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                }
                .padding(.top, safeAreaInsets.top)
                .padding(.bottom, safeAreaInsets.bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top) {
                HStack {
                    Text("Discussion Board")
                        .font(.title.bold())
                    Spacer()
                    if selected != nil  {
                        Image(systemName: "xmark")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.red)
                            .contentShape(.rect)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    self.selected = nil
                                }
                            }
                        
                    } else {
                        Button {
                            withAnimation(.spring()) {
                                showGuide.toggle()
                            }
                        } label: {
                            Label("Guide", systemImage: "questionmark.circle.fill")
                                .font(.title3.bold())
                                .foregroundStyle(.pink)
                        }
                    }
                }
                .padding()
                .padding(.top, safeAreaInsets.top)
                .background {
                    
                    TransparentBlurView()
                        .blur(radius: 4, opaque: false)
                    //                            .overlay(alignment: .bottom) {
                    //                                Divider()
                    //                            }
                    
                }
                .ignoresSafeArea()
            }
        }
    }
    @State var shouldBegin = false
    var onBoarding: some View {
        VStack(alignment: .leading) {
            
            VStack {
                HStack {
                    Text("College English 101")
                    Spacer()
                }
                HStack {
                    Text("Ifrah Fehim")
                    Spacer()
                }
                HStack {
                    Text("Denzel Nyatsanza")
                    Spacer()
                }
                HStack {
                    Text("Multimodal Argumentantive")
                    Spacer()
                }
            }
            .opacity(0.7)
            
            Spacer()
            Text("My Second\nAmendment")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("My freedom & right? To bear arms")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            
            
            Button {
                withAnimation(.easeInOut(duration: 1)) {
                    shouldBegin = true
                    showGuide = true
                }
            } label: {
                Label("Begin", systemImage: "circle.circle")
                    .font(.title)
                    .padding(20)
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .clipShape(.capsule)
            }
            .foregroundStyle(.white)
            .bold()
            .padding(.top, 100)
        }
        .padding()
    }
}

private struct SafeAreaInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        (UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets ?? .zero).insets
    }
}

extension EnvironmentValues {
    
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}

private extension UIEdgeInsets {
    
    var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
