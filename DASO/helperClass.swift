//
//  HelperClass.swift
//  NailManage
//
//  Created by Trinh Ta on 8/20/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import Foundation
import UIKit


class HelperClass{
    static func saveImage(image:UIImage, name: String)->String {
        let resizedImage = image.resizeImage(newWidth: 200);
        let fileManager = FileManager();
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString;
        let imagePath = path.strings(byAppendingPaths: [name]);
        let imageData = UIImagePNGRepresentation(resizedImage);
        fileManager.createFile(atPath: imagePath.first!, contents: imageData, attributes: nil);
        return imagePath.first!;
        
    }
    
    static func getDirectory()->String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!;
        return paths;
    }
    
    static func loadImageFromDirectory(imageName: String )->UIImage?{
        let image: UIImage?;
        let fileManager = FileManager();
        let imagePath = (self.getDirectory() as NSString).strings(byAppendingPaths: [imageName]);
        if (fileManager.fileExists(atPath: (imagePath.first)!)) {
            image = UIImage(contentsOfFile: imagePath.first!);
            
            return image!;
        }
        else {
            print("no Image");
        }
        return nil;
    }
}

extension UIImage {
    func resizeImage(newWidth: CGFloat) ->UIImage {
        let scale = newWidth / self.size.width;
        let newHeight = self.size.height * scale;
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight));
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight));
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage!;
    }
    
    
    func resizeImageWith(newSize: CGSize) -> UIImage {
        
        let horizontalRatio = newSize.width / size.width
        let verticalRatio = newSize.height / size.height
        
        let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    
    func thumbnail(size:CGSize) ->UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height));
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage!;
    }
    
    
}



extension UIView {
    
    func createLine() {
        let view = UIView(frame: CGRect(x: INDENT, y: self.frame.height - 1, width: self.frame.width - INDENT * 2, height: 1));
        view.backgroundColor = UIColor.lightGray;
        self.addSubview(view);
        
        self.bringSubview(toFront: view);
    }
    
    
}








