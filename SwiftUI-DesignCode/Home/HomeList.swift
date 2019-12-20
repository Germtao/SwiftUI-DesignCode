//
//  HomeList.swift
//  SwiftUI-DesignCode
//
//  Created by QDSG on 2019/12/17.
//  Copyright © 2019 unitTao. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    @State var showCourse = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Courses")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("22 courses")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal, 60.0)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 20.0) {
                        ForEach(courseData) { course in
                            Button(action: { self.showCourse.toggle() }) {
                                GeometryReader { geometry in
                                    CourseView(course: course)
                                        .rotation3DEffect(
                                            Angle(degrees:
                                                Double(geometry.frame(in: .global).minX - 30) / -40),
                                            axis: (x: 0.0, y: 10.0, z: 0.0)
                                        )
                                }
                                .frame(width: 246.0, height: 360)
                            }.sheet(isPresented: self.$showCourse, onDismiss: {
                                self.showCourse = false
                            }) {
                                ContentView()
                            }
                        }
                    }
                    .padding(.horizontal, 30.0)
                    .padding(.top, 30.0)
                    .padding(.bottom, 70.0)
                    Spacer()
                }
                
                CertificateRow()
            }
            .padding(.top, 78.0)
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    var course: Course
    var body: some View {
        VStack(alignment: .leading) {
            Text(course.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(30)
                .lineLimit(4)
                .padding(.trailing, 50)
            Spacer()
            Image(course.image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
        .background(course.color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: course.shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let courseData = [
    Course(
        title: "Build an app with SwiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow3")
    ),
    Course(
        title: "Flutter For Designers",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow4")
    ),
    Course(
        title: "Build an app with SwiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow3")
    ),
    Course(
        title: "Flutter For Designers",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow4")
    ),
]
