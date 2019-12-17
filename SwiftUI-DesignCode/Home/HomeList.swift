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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20.0) {
                ForEach(courseData) { course in
                    Button(action: { self.showCourse.toggle() }) {
                        CourseView(course: course)
                    }.sheet(isPresented: self.$showCourse, onDismiss: {
                        self.showCourse = false
                    }) {
                        ContentView()
                    }
                }
            }
            .padding(.horizontal, 20)
            .frame(height: 480)
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
                .padding(20)
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
]
