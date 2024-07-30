//
//  Places.swift
//  sketch-elements
//
//  Created by Filip Krayem on 03.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import MapKit
import SwiftUI

struct Places: View {
    var tintColor: Color = Constant.color.tintColor
    @State private var region = MKCoordinateRegion(center: photographyData[21].locationCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.6, longitudeDelta: 0.6))

    let places = groupBy(photographyData) { $0.location?.city }

    let pointsOfInterest: [Annotation] = createAnnotations(groupBy(photographyData) { $0.location?.city })

    var body: some View {
        ZStack {
            
            if #available(iOS 14.0, *) {
                Map(coordinateRegion: $region, annotationItems: pointsOfInterest) { item in
                    MapAnnotation(coordinate: item.coordinate) {
                        PhotoStack(numberOfPhotos: item.photos.count, showcasedPhotos: Array(item.photos.prefix(3)), hidden: region.span.latitudeDelta / 2 > 30)
                            .frame(width: 100 - CGFloat(region.span.latitudeDelta / 2), height: 100 - CGFloat(region.span.longitudeDelta / 1.5), alignment: .center)
                            .clipped()
                    }
                }.ignoresSafeArea()
                .navigationBarHidden(true)
            } else {
              Text("This view requires iOS 14.0 and later. Update your system in Settings.")
            }
        }
    }
}

struct Places_Previews: PreviewProvider {
    static var previews: some View {
        Places()
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}

struct Annotation: Identifiable {
    let id = UUID()
    var photos: [Photo]
    var coordinate: CLLocationCoordinate2D
}

func createAnnotations(_ places: [String?: [Photo]]) -> [Annotation] {
    var poi: [Annotation] = []
    for place in Array(places.keys) {
        poi.append(Annotation(photos: Array((places[place]?.prefix(3))!), coordinate: places[place]![0].locationCoordinate))
    }
    return poi
}
