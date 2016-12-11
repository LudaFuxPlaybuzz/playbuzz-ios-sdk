//
//  PlaybuzzQuiz.swift
//  Pods
//
//  Created by Luda Fux on 11/9/16.
//
//

import UIKit
import WebKit

public class PlaybuzzQuiz: UIView, WKScriptMessageHandler{

    var webView: WKWebView!
    public weak var delegate: PlaybuzzQuizProtocol?
//    let myGlobal = {
//    print("hello")
//    }()
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        addBehavior()
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)


        addBehavior()
    }
    func addBehavior ()
    {
        let contentController = WKUserContentController();
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = contentController
        configuration.allowsInlineMediaPlayback = true
        
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 250), configuration: configuration)
        webView.autoresizingMask = UIViewAutoresizing.flexibleWidth
        webView.scrollView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        webView.configuration.userContentController.add(self,name: "callbackHandler")
        
        self.addSubview(webView)
    }
    
    public func reloadItem(_ userID: String,
                    itemAlias:String,
                    showRecommendations: Bool,
                    showShareButton: Bool,
                    showFacebookComments: Bool,
                    showItemInfo: Bool,
                    companyDomain: String)
    {
        if webView.isLoading {
            webView.stopLoading()
        }
        
        let embedTamplate = "<!DOCTYPE html><html><head> <meta content=\"width=device-width\" name=\"viewport\"> <style>.pb_iframe_bottom{display:none;}.pb_top_content_container{padding-bottom: 0 !important;}</style></head><body> <script type=\"text/javascript\">window.PlayBuzzCallback=function(event){var messageDict={\"event_name\":event.eventName,data:event.data};window.webkit.messageHandlers.callbackHandler.postMessage(messageDict)}</script> <script src=\"//cdn.playbuzz.com/widget/feed.js\" type=\"text/javascript\"> </script> <div class=\"pb_feed\" data-native-id=\"%@\" data-game=\"%@\" data-recommend=\"%@\" data-shares=\"%@\" data-comments=\"%@\" data-game-info=\"%@\" data-platform=\"iPhone\" ></div></body></html>"
        
        let embedString: String = String(format: embedTamplate,
                                         userID,
                                         itemAlias,
                                         showRecommendations ? "true":"false",
                                         showShareButton ? "true":"false",
                                         showFacebookComments ? "true":"false",
                                         showItemInfo ? "true":"false")
        webView.loadHTMLString(embedString, baseURL: URL(string:companyDomain))
    }
    
    override public func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
    {
        if keyPath == "contentSize"
        {
            self.updatePageViewsFrames()
        }
    }
    
    func updatePageViewsFrames()
    {
        webView.sizeToFit()
        let webViewContentHeight:CGFloat = webView.scrollView.contentSize.height
        webView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: webViewContentHeight)
        self.delegate?.resizePlaybuzzContainer(webViewContentHeight)
        
    }
    
    public func userContentController(_ userContentController: WKUserContentController,didReceive message: WKScriptMessage)
    {
        
    }
}


// MARK: - EmbededWebViewControllerProtocol
public protocol PlaybuzzQuizProtocol: class
{
    func resizePlaybuzzContainer(_ height: CGFloat)
}
