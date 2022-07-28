//
//  SceneDelegate.swift
//  TOP NEWS
//
//  Created by amit sah on 28/07/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        self.splashScreen()
    }
    
    func splashScreen(){
        
        let rootVC = K.StoryBoard.lunchScreenStoryBoard.instantiateViewController(withIdentifier: "splashScreenIdentifier")
        
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(dismissSplashController), userInfo: nil, repeats: false);
        
    }
    
    @objc func dismissSplashController(){
        let rootVC = K.StoryBoard.mainStoryBoard.instantiateViewController(withIdentifier: NewsModel.identifier)
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    
    
}

