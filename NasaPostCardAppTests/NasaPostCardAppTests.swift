//
//  NasaPostCardAppTests.swift
//  NasaPostCardAppTests
//
//  Created by curtis scott on 06/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import XCTest
import  UIKit
import MapKit
@testable import NasaPostCardApp

class NasaPostCardAppTests: XCTestCase {
    var testObject: PostcardCreatorCollectionViewController!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
       testObject = UIStoryboard(name: "Main", bundle: nil)
       .instantiateViewController(identifier: "postcard") as? PostcardCreatorCollectionViewController
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        testObject = nil
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testModelMethods(){
        let nasaphoto = MarsRoverPhoto(id: 2, img_src: "http://teamtreehouse.com/")
        let result = nasaphoto.imageDl()!.absoluteString
        XCTAssertEqual(result, "https://teamtreehouse.com/")
    }
    func testRoundButtons(){
        var but = UIButton(type: .close)
        but.roundButton()
        XCTAssertEqual(but.layer.borderWidth, 1)
    }
    
    func testfadePic(){

        var imgView = UIImageView()
        let marsPic = UIImage(named: "pia23492")!
        let spacePic = UIImage(named: "Geely_Sat")!
        imgView.image = marsPic
        Animator.fadePicture2(imgView: imgView, image1: marsPic, image2: spacePic)

        
        XCTAssertEqual(imgView.image, spacePic)
        
        Animator.fadePicture2(imgView: imgView, image1: marsPic, image2: spacePic)
        XCTAssertEqual(imgView.image, marsPic)

       
    }
    
    func testSetBackGround(){
        var imgView = UIImageView()
        let marsPic = UIImage(named: "pia23492")!
        testObject.setBackGround(imgView: imgView, img: marsPic)
        XCTAssertTrue(testObject.view.subviews.contains(imgView))
    }
    
    func testAnnotationCreation(){
        let coord = CLLocationCoordinate2D(latitude: 51.5033, longitude: 0.1195)
        let place = MKPlacemark(coordinate: coord)
        let anno = MapLocation(place: place)
        XCTAssertNotNil(anno)
        XCTAssertEqual(anno.title, place.title)
    }
    
    

}





class NasaPostCardAppTests5: XCTestCase {
    var testObject:  ViewController!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        testObject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "home") as? ViewController
       
       
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        testObject = nil
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testModelMethods(){
        let nasaphoto = MarsRoverPhoto(id: 2, img_src: "http://teamtreehouse.com/")
        let result = nasaphoto.imageDl()!.absoluteString
        XCTAssertEqual(result, "https://teamtreehouse.com/")
    }
    
    func testpicFade(){
        
        
        XCTAssertNotNil(testObject)
    
    }

}

class NasaPostCardAppTests2: XCTestCase {
    var testObject: LocationSelectorViewController!
    var window :UIWindow!
    
    
    func loadView(){
        window.addSubview(testObject.view)
        RunLoop.current.run(until: Date())
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       super.setUp()
       window = UIWindow()
       testObject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "location") as? LocationSelectorViewController
       
       
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
     
        window = nil
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testModelMethods(){
        let nasaphoto = MarsRoverPhoto(id: 2, img_src: "http://teamtreehouse.com/")
        let result = nasaphoto.imageDl()!.absoluteString
        XCTAssertEqual(result, "https://teamtreehouse.com/")
    }
    
    func testveiwLoad(){
        
        loadView()
        XCTAssertNotNil(testObject.resultSearchController)
      
    }

}
class NasaPostCardAppTests3: XCTestCase {
    var testObject: LocationSatalliteDetailViewController!
    var window :UIWindow!
    let coord = CLLocationCoordinate2D(latitude: 51.5033, longitude: 0.1195)
    var place: MKPlacemark!

          
    
    func loadView(){
        window.addSubview(testObject.view)
        RunLoop.current.run(until: Date())
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        window = UIWindow()
        place = MKPlacemark(coordinate: coord)
       testObject = UIStoryboard(name: "Main", bundle: nil)
                 .instantiateViewController(identifier: "locationDetail") as? LocationSatalliteDetailViewController
        testObject.place = place
       
       
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        testObject = nil
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testModelMethods(){
        let nasaphoto = MarsRoverPhoto(id: 2, img_src: "http://teamtreehouse.com/")
        let result = nasaphoto.imageDl()!.absoluteString
        XCTAssertEqual(result, "https://teamtreehouse.com/")
    }
    
    func testCllectionCelll(){
        
        
        XCTAssertNotNil(testObject)
    
    }
    
    func testLoad(){
        
        loadView()
        XCTAssertNotNil(testObject.satImage)
        XCTAssertNotNil(testObject.testScroll.delegate)
    
    }
    
    func testScrollSettings(){
        
        loadView()
        print(" this is the resjhdsfbhjdsgfhabdhfashjdfasdjhfhjs,adbfhjsdbfhjsbdfjsdfhjbdsfhbadsmbfhadsbfhbdshbfhsdbfhbdasfbsdabfhasbfult\(testObject.testScroll.minimumZoomScale)")
        XCTAssertEqual(testObject.testScroll.minimumZoomScale , 1.0)
        XCTAssertNotNil(testObject.testScroll.delegate)
    
    }

}


class NasaPostCardAppTests4: XCTestCase {
    var testObject:  PostCodeDetialViewController!
    var window :UIWindow!
    
    
    func loadView(){
        window.addSubview(testObject.view)
        RunLoop.current.run(until: Date())
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        window = UIWindow()
        testObject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "postcardDetail") as? PostCodeDetialViewController
       
       
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        window = nil
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testdidLoad(){
        loadView()
        XCTAssertEqual(5 , testObject.textMessage.layer.cornerRadius)
    }
    
    func testimageDrawing(){
        loadView()
         let spacePic = UIImage(named: "Geely_Sat")!
          var newPic = testObject.textToImageFull(drawText: ["test","test","test"], inImage: spacePic, atPoint:[CGPoint(x: 0, y: 0),CGPoint(x: 0, y: 0),CGPoint(x: 0, y: 0)])
        XCTAssertNotEqual(spacePic, newPic)
    }
    func testCllectionCelll(){
        
        
        XCTAssertNotNil(testObject)
    
    }

}
