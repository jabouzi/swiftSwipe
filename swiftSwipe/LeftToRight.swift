//
//  LeftToRight.swift
//  swiftSwipe
//
//  Created by dev on 11/3/16.
//  Copyright © 2016 Skander Jabouzi. All rights reserved.
//

import UIKit

class LeftToRight : UIStoryboardSegue {
    
    override func perform() {
        let source:UIViewController = self.source;
        let destination:UIViewController = self.destination;
        
        var sourceFrame:CGRect = source.view.frame;
        sourceFrame.origin.x = sourceFrame.size.width;
        
        var destFrame:CGRect = destination.view.frame;
        destFrame.origin.x = -destination.view.frame.size.width;
        destination.view.frame = destFrame;
        
        destFrame.origin.x = 0;
        
        source.view.superview?.addSubview(destination.view);
        
        UIView.animate(withDuration: 0.25, animations: {
            source.view.frame = sourceFrame;
            destination.view.frame = destFrame;
        }, completion: {
            finished in
            let window: UIWindow = source.view.window!;
            window.rootViewController = destination;
        });
    }

}
