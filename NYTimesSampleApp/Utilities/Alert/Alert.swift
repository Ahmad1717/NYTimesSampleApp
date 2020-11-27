//
//  Alert.swift
//  NYTimesSampleApp
//
//  Created by Ahmad Jabri on 27/11/2020.
//  Copyright © 2020 Ahmad Jabri. All rights reserved.
//

import UIKit

class Alert: NSObject {

    let style: UIAlertController.Style
    var title: String?
    var message: String?
    var actions: [UIAlertAction] = []

    init(style: UIAlertController.Style) {
        self.style = style
    }

    static func alert(_ title: String = "", message: String = "") -> Alert {
        return Alert(style: .alert).title(title).message(message)
    }

    static func sheet() -> Alert {
        return Alert(style: .actionSheet)
    }

    static func sheet(_ title: String) -> Alert {
        return sheet().title(title)
    }

    func title(_ title: String?) -> Alert {
        self.title = title
        return self
    }

    func message(_ message: String?) -> Alert {
        self.message = message
        return self
    }

    @discardableResult func ok(_ button: String) -> Alert {
        return ok(button: button, callback: nil)
    }

    func ok(button: String, callback: VoidClosure?) -> Alert {
        actions.append(UIAlertAction(title: button, style: .default) { _ in
            callback?()
        })
        return self
    }

    // to display/ present the alert
    func show() {

        if actions.isEmpty {
            ok(&&"Common.Ok")
        }

        // create alert
        let viewController = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { viewController.addAction($0) }

        DispatchQueue.main.async {
            Alert.present(viewController)
        }
    }

    // alert with ok button only with action
    static func ok(_ title: String, _ message: String?, okButtonTitle: String = &&"General.Ok", _ callback: @escaping VoidClosure) {
        alert(title).message(message).ok(button: okButtonTitle, callback: callback).show()
    }

    // to present the alert
    fileprivate static func present(_ viewController: UIViewController) {
        if let topController = topController() {
            topController.present(viewController, animated: true, completion: nil)
        }
    }
}
