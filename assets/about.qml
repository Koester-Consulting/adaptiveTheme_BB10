import bb.cascades 1.3
import bb.platform 1.0
import bb.device 1.0
import bb.system 1.2

Page {
    id: page
    objectName: "about"
    titleBar: TitleBar {
        title: qsTr("About us") + Retranslate.onLanguageChanged
        scrollBehavior: TitleBarScrollBehavior.Sticky
    }
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        //background: Color.create("#1078A0")
        ScrollView {
            Container {
                property bool brightThemeSelected: (Application.themeSupport.theme.colorTheme.style == VisualStyle.Bright) ? true : false;
                
                layout: DockLayout {
                }
                
                Container {
                    verticalAlignment: VerticalAlignment.Fill
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    Container {
                        verticalAlignment: VerticalAlignment.Fill
                        horizontalAlignment: HorizontalAlignment.Fill
                        
                        leftPadding: ui.du(1.0)
                        rightPadding: ui.du(1.0)
                        topPadding: ui.du(1.0)   
                        bottomPadding: ui.du(1.0)
                        
                        Header {
                            title: qsTr("Developed by:") + Retranslate.onLanguageChanged
                        }
                        Container {
                            minHeight: ui.du(10)
                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight
                            }
                            horizontalAlignment: HorizontalAlignment.Fill
                            verticalAlignment: VerticalAlignment.Fill
                            ImageView {
                                layoutProperties: StackLayoutProperties {
                                    spaceQuota: 0.6
                                }
                                horizontalAlignment: HorizontalAlignment.Left
                                verticalAlignment: VerticalAlignment.Center
                                imageSource: "asset:///images/about/koester_consulting.png"
                                scalingMethod: ScalingMethod.AspectFit
                            }
                            Container {
                                layout: StackLayout {
                                    orientation: orientation.TopToBottom
                                
                                }
                                layoutProperties: StackLayoutProperties {
                                    spaceQuota: 3
                                }
                                horizontalAlignment: HorizontalAlignment.Center
                                verticalAlignment: VerticalAlignment.Center
                                leftMargin: ui.du(3.0)
                                Label {
                                    horizontalAlignment: HorizontalAlignment.Left
                                    text: qsTr("Köster Consulting") + Retranslate.onLanguageChanged
                                    
                                    bottomMargin: ui.du(0.0)
                                    textStyle {
                                        base: SystemDefaults.TextStyles.TitleText
                                    }
                                }
                                Label {
                                    text: qsTr("We enhanced the user experience by fixing some bugs with context menu.") + Retranslate.onLanguageChanged
                                    
                                    textStyle.lineHeight: 1.0
                                    textStyle.textAlign: TextAlign.Default
                                    textFit.mode: LabelTextFitMode.Default
                                    textFit.maxFontSizeValue: 10.0
                                    autoSize.maxLineCount: 5
                                    multiline: true
                                    topMargin: ui.du(0.0)
                                    textStyle {
                                        base: SystemDefaults.TextStyles.SubtitleText
                                    }
                                }
                                Container {
                                    layout: StackLayout {
                                        orientation: LayoutOrientation.LeftToRight
                                    }
                                    ImageView {
                                        verticalAlignment: VerticalAlignment.Center
                                        preferredHeight: ui.du(6.0)
                                        imageSource: "asset:///images/about/ic_twitter.png"
                                        scalingMethod: ScalingMethod.AspectFit
                                        rightMargin: ui.du(2.0)
                                        
                                        onTouch: {
                                            if (event.touchType == TouchType.Up) {
                                                _socialInvocation.invoke("com.twitter.urihandler", "bb.action.VIEW", "", "twitter:connect:stekoester")
                                            }
                                        }
                                    }
                                    ImageView {
                                        verticalAlignment: VerticalAlignment.Center
                                        preferredHeight: ui.du(6.0)
                                        imageSource: "asset:///images/about/ic_facebook.png"
                                        scalingMethod: ScalingMethod.AspectFit
                                        rightMargin: ui.du(2.0)
                                        
                                        onTouch: {
                                            if (event.touchType == TouchType.Up) {
                                                _socialInvocation.invoke("com.rim.bb.app.facebook", "bb.action.OPEN", "page", "341517809389424")
                                            }
                                        }
                                    }
                                    ImageView {
                                        verticalAlignment: VerticalAlignment.Center
                                        preferredHeight: ui.du(6.0)
                                        imageSource: "asset:///images/about/ic_bbm_channel.png"
                                        scalingMethod: ScalingMethod.AspectFit
                                        rightMargin: ui.du(2.0)
                                        
                                        onTouch: {
                                            if (event.touchType == TouchType.Up) {
                                                _socialInvocation.invoke("sys.bbm.channels.card.previewer", "bb.action.OPENBBMCHANNEL", "", "bbmc:C0037A4FD")
                                            }
                                        }
                                    }
                                    ImageView {
                                        verticalAlignment: VerticalAlignment.Center
                                        preferredHeight: ui.du(6.0)
                                        imageSource: "asset:///images/about/ic_mail.png"
                                        scalingMethod: ScalingMethod.AspectFit
                                        rightMargin: ui.du(2.0)
                                        
                                        onTouch: {
                                            if (event.touchType == TouchType.Up) {
                                                _socialInvocation.invoke("sys.pim.uib.email.hybridcomposer", "bb.action.SENDEMAIL", "", "mailto:info@koester-consulting.eu?subject=BB10QNX Url-Shortener:%20")
                                            }
                                        }
                                    }
                                    ImageView {
                                        verticalAlignment: VerticalAlignment.Center
                                        preferredHeight: ui.du(6.0)
                                        imageSource: "asset:///images/about/ic_internet.png"
                                        scalingMethod: ScalingMethod.AspectFit
                                        rightMargin: ui.du(2.0)
                                        
                                        onTouch: {
                                            if (event.touchType == TouchType.Up) {
                                                _socialInvocation.invoke("sys.browser", "bb.action.OPEN", "text/html", "http://bbq.pm")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Divider {
                            
                        }
                        Header {
                            topMargin: ui.du(10.0)
                            title: qsTr("Thanks to:") + Retranslate.onLanguageChanged
                        }
                        Container {
                            minHeight: ui.du(10)
                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight
                            }
                            horizontalAlignment: HorizontalAlignment.Fill
                            verticalAlignment: VerticalAlignment.Fill
                            ImageView {
                                layoutProperties: StackLayoutProperties {
                                    spaceQuota: 0.6
                                }
                                horizontalAlignment: HorizontalAlignment.Left
                                verticalAlignment: VerticalAlignment.Center
                                imageSource: "asset:///images/about/emberify.png"
                                scalingMethod: ScalingMethod.None
                            }
                            Container {
                                layout: StackLayout {
                                    orientation: orientation.TopToBottom
                                
                                }
                                layoutProperties: StackLayoutProperties {
                                    spaceQuota: 3
                                }
                                horizontalAlignment: HorizontalAlignment.Center
                                verticalAlignment: VerticalAlignment.Center
                                leftMargin: ui.du(3.0)
                                Label {
                                    //id: copyToClipBoardLabels
                                    text: qsTr("Emberify") + Retranslate.onLanguageChanged
                                    
                                    bottomMargin: ui.du(0.0)
                                    textStyle {
                                        base: SystemDefaults.TextStyles.TitleText
                                    }
                                }
                                Label {
                                    //id: copyToClipBoardDescriptions
                                    text: qsTr("Shashwat supported us with the template of adaptive theme.") + Retranslate.onLanguageChanged
                                    
                                    topMargin: ui.du(0.0)
                                    bottomMargin: ui.du(0.0)
                                    textStyle.lineHeight: 1.0
                                    textStyle.textAlign: TextAlign.Left
                                    textFit.mode: LabelTextFitMode.Standard
                                    textFit.maxFontSizeValue: 10.0
                                    autoSize.maxLineCount: 5
                                    multiline: true
                                    textStyle {
                                        base: SystemDefaults.TextStyles.SubtitleText
                                    }
                                }
                                Container {
                                    layout: StackLayout {
                                        orientation: LayoutOrientation.LeftToRight
                                    }
                                    topMargin: ui.du(1.0)
                                    ImageView {
                                        verticalAlignment: VerticalAlignment.Center
                                        preferredHeight: ui.du(6.0)
                                        imageSource: "asset:///images/about/ic_twitter.png"
                                        scalingMethod: ScalingMethod.AspectFit
                                        rightMargin: ui.du(2.0)
                                        
                                        onTouch: {
                                            if (event.touchType == TouchType.Up) {
                                                _socialInvocation.invoke("com.twitter.urihandler", "bb.action.VIEW", "", "twitter:connect:emberify")
                                            }
                                        }
                                    }
                                    ImageView {
                                        verticalAlignment: VerticalAlignment.Center
                                        preferredHeight: ui.du(6.0)
                                        imageSource: "asset:///images/about/ic_facebook.png"
                                        scalingMethod: ScalingMethod.AspectFit
                                        rightMargin: ui.du(2.0)
                                        
                                        onTouch: {
                                            if (event.touchType == TouchType.Up) {
                                                _socialInvocation.invoke("com.rim.bb.app.facebook", "bb.action.OPEN", "page", "1451670688441156")
                                            }
                                        }
                                    }
                                    ImageView {
                                        verticalAlignment: VerticalAlignment.Center
                                        preferredHeight: ui.du(6.0)
                                        imageSource: "asset:///images/about/ic_bbm_channel.png"
                                        scalingMethod: ScalingMethod.AspectFit
                                        rightMargin: ui.du(2.0)
                                        
                                        onTouch: {
                                            if (event.touchType == TouchType.Up) {
                                                _socialInvocation.invoke("sys.bbm.channels.card.previewer", "bb.action.OPENBBMCHANNEL", "", "bbmc:C002FEE57")
                                            }
                                        }
                                    }
                                    ImageView {
                                        verticalAlignment: VerticalAlignment.Center
                                        preferredHeight: ui.du(6.0)
                                        imageSource: "asset:///images/about/ic_mail.png"
                                        scalingMethod: ScalingMethod.AspectFit
                                        rightMargin: ui.du(2.0)
                                        
                                        onTouch: {
                                            if (event.touchType == TouchType.Up) {
                                                _socialInvocation.invoke("sys.pim.uib.email.hybridcomposer", "bb.action.SENDEMAIL", "", "mailto:shashwat@emberify.com?subject=BB10QNX Url-Shortener:%20")
                                            }
                                        }
                                    }
                                    ImageView {
                                        verticalAlignment: VerticalAlignment.Center
                                        preferredHeight: ui.du(6.0)
                                        imageSource: "asset:///images/about/ic_internet.png"
                                        scalingMethod: ScalingMethod.AspectFit
                                        rightMargin: ui.du(2.0)
                                        
                                        onTouch: {
                                            if (event.touchType == TouchType.Up) {
                                                _socialInvocation.invoke("sys.browser", "bb.action.OPEN", "text/html", "http://emberify.com/")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Divider {
                        }
                    }
                }
            }
        }
    }
}