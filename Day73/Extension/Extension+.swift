//
//  Extension+.swift
//  BucketList
//
//  Created by 褚宣德 on 2023/11/17.
//

import Foundation
import MapKit
extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 50, longitude: 0)
    }
    
    static let home = CLLocationCoordinate2D(latitude: 23.5, longitude: 121.5)
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return.init(
            center: .userLocation,
            span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25)
        )
    }
}
