//
//  HelperFunction.swift
//  DASO
//
//  Created by Trinh Ta on 12/17/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import Foundation


func shortToUint8(value: UInt16) ->[UInt8] {
    var array = [UInt8](repeatElement(0, count: MemoryLayout<UInt16>.size));
    let temp = value;
    array[1] = UInt8((temp >> 8) & 0xff);
    array[0] = UInt8(temp & 0xff);
    
    return array;
}


func UInt8ToShort(value: [UInt8], offset:Int) ->UInt16 {
    var temp: UInt16 = 0;
    temp = UInt16(value[offset + 1]);
    temp = UInt16(temp << 8);
    temp = temp | UInt16(value[offset]);
    
    return temp;
}


func Int32ToUint8(value: Int32) ->[UInt8] {
    var array = [UInt8](repeatElement(0, count: MemoryLayout<Int32>.size));
    let temp = value;
    array[3] = UInt8((temp >> 24) & 0xff);
    array[2] = UInt8((temp >> 16) & 0xff);
    array[1] = UInt8((temp >> 8) & 0xff);
    array[0] = UInt8((temp & 0xff));
    
    return array;
    
    
}




func Uint8ToInt32(value: [UInt8], offset:  Int) ->Int32 {
    var byte1: Int32 = 0;
    byte1 = Int32(value[offset + 3]);
    byte1 = byte1 << 24;
    
    var byte2: Int32 = Int32(value[offset + 2]);
    byte2 = byte2 << 16;
    
    var byte3: Int32 = Int32(value[offset + 1]);
    byte3 = byte3 << 8;
    
    var byte4: Int32 = Int32(value[offset]);
    
    
    return byte1 | byte2 | byte3 | byte4;
}
