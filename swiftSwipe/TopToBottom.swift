//
//  TopToBottom.swift
//  swiftSwipe
//
//  Created by dev on 11/3/16.
//  Copyright © 2016 Skander Jabouzi. All rights reserved.
//

import UIKit

class TopToBottom : UIStoryboardSegue {
    
    override func perform() {
        let source:UIViewController = self.source;
        let destination:UIViewController = self.destination;
        
        var sourceFrame:CGRect = source.view.frame;
        sourceFrame.origin.y = sourceFrame.size.height;
        
        var destFrame:CGRect = destination.view.frame;
        destFrame.origin.y = -destination.view.frame.size.height;
        destination.view.frame = destFrame;
        
        destFrame.origin.y = 0;
        source.view.superview?.addSubview(destination.view);
        
        UIView.animate(withDuration: 0.24, animations: {
            source.view.frame = sourceFrame;
            destination.view.frame = destFrame;
        }, completion: {
            finished in
            let window: UIWindow = source.view.window!;
            window.rootViewController = destination;
        });
    }

}
