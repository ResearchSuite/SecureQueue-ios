//
//  PAMSample.swift
//  OMHClient
//
//  Created by James Kizer on 1/7/17.
//  Copyright © 2017 Cornell Tech. All rights reserved.
//

import OMHClient

final class PAMSample: OMHDataPointBase {
    
    var affectValence: Int!
    var affectArousal: Int!
    var positiveAffect: Int!
    var negativeAffect: Int!
    var mood: String!
    
    required init() {
        super.init()
        self.acquisitionSourceName = "example"
        self.acquisitionModality = .SelfReported
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        self.affectValence = aDecoder.decodeObject(of: NSNumber.self, forKey: "affectValence")!.intValue
//        self.affectArousal = aDecoder.decodeObject(of: NSNumber.self, forKey: "affectArousal")!.intValue
//        self.positiveAffect = aDecoder.decodeObject(of: NSNumber.self, forKey: "positiveAffect")!.intValue
//        self.negativeAffect = aDecoder.decodeObject(of: NSNumber.self, forKey: "negativeAffect")!.intValue
//        self.mood = aDecoder.decodeObject(of: NSString.self, forKey: "mood") as! String
//        
//    }
//    
//    override func encode(with aCoder: NSCoder) {
//        super.encode(with: aCoder)
//        
//        aCoder.encode(self.affectValence, forKey: "affectValence")
//        aCoder.encode(self.affectArousal, forKey: "affectArousal")
//        aCoder.encode(self.positiveAffect, forKey: "positiveAffect")
//        aCoder.encode(self.negativeAffect, forKey: "negativeAffect")
//        aCoder.encode(self.mood, forKey: "mood")
//    }
    
    override var schema: OMHSchema {
        return OMHSchema(
            name: "photographic-affect-meter-scores",
            version: "1.0",
            namespace: "cornell")
    }
    
    override var body: [String: Any] {
        
        return [
            "affect_valence": self.affectValence,
            "affect_arousal": self.affectArousal,
            "positive_affect": self.positiveAffect,
            "negative_affect": self.negativeAffect,
            "mood": self.mood,
            "effective_time_frame": [
                "date_time": self.stringFromDate(self.creationDateTime)
            ]
            
        ]
    }
    

}
