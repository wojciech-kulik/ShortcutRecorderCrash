//
//  ViewController.swift
//  ShortcutRecorderCrash
//
//  Created by Wojciech Kulik on 07/10/2023.
//

import Cocoa
import ShortcutRecorder

class ViewController: NSViewController {
    private weak var newWindow: NSWindow?

    override func viewDidAppear() {
        super.viewDidAppear()

        view.window?.center()
    }

    @IBAction func openWindow(sender: Any?) {
        let recorderControl = RecorderControl()

        let viewController = NSViewController()
        viewController.view.addSubview(recorderControl)

        recorderControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recorderControl.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            recorderControl.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor)
        ])

        let detachButton = NSButton(title: "Detach ViewController", target: self, action: #selector(detachViewController))
        viewController.view.addSubview(detachButton)
        detachButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detachButton.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            detachButton.topAnchor.constraint(equalTo: recorderControl.bottomAnchor, constant: 24.0)
        ])

        let window = NSWindow(contentViewController: viewController)
        window.minSize = .init(width: 200, height: 200)
        window.maxSize = .init(width: 200, height: 200)
        window.makeKeyAndOrderFront(nil)

        window.center()

        newWindow = window
    }

    @objc func detachViewController() {
        newWindow?.contentViewController = NSViewController()
    }
}
