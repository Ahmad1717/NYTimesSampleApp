//
//  ActivityIndicator.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 19/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import NVActivityIndicatorView

class LoadingIndicator: UIViewController, NVActivityIndicatorViewable {

    private var activityView: NVActivityIndicatorView?

    // singleton
    static let shared = LoadingIndicator()

    // show loading indicator
     func show() {
        let size = CGSize(width: 50, height: 50)
        startAnimating(size, message: "", type: .lineScalePulseOutRapid, color: .navigationColor, backgroundColor: .clear)
    }

    // dismiss loading indicator
    func dismiss() {
        stopAnimating()
        activityView?.removeFromSuperview()
    }
}
