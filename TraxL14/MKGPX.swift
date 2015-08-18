//
//  MKGPX.swift
//  TraxL14
//
//  Created by iMac21.5 on 5/6/15.
//  Copyright (c) 2015 Garth MacKenzie. All rights reserved.
//

import MapKit

//implement protocol of MKAnnotation

extension GPX.Waypoint: MKAnnotation { //extensions can't have any storage
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var title: String! { return name }
    
    var subtitle: String! { return info }
    
    var thumbnailURL: NSURL? {
        return getImageURLofType("thumbnail")
    }
    var imageURL: NSURL? {
        return getImageURLofType("large")
    }
    
    private func getImageURLofType(type: String) -> NSURL? {
        for link in links { //link is in a GPX.WayPoint
            if link.type == type {
                return link.url
            }
        }
        return nil
    }
}
