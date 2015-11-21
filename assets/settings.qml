import bb.cascades 1.3
import bb.platform 1.0
import bb.device 1.0
import bb.system 1.2

Page {
    id: settingPage
    objectName: "settings"
    
    property int gvBrightTheme: VisualStyle.Bright
    property int gvDarkTheme: VisualStyle.Dark
    property bool brightThemeSelected: (Application.themeSupport.theme.colorTheme.style == VisualStyle.Bright) ? true : false;
    
    titleBar: TitleBar {
        id: settingTitleBar
        title: qsTr("Settings") + Retranslate.onLanguageChanged
        scrollBehavior: TitleBarScrollBehavior.Sticky
        acceptAction: ActionItem {
            title: qsTr("Default")
            
            attachedObjects: [
                SystemDialog {
                    id: myQmlDialog
                    title: qsTr("Reset settings to default") + Retranslate.onLanguageChanged
                    body: qsTr("Do you realy want to reset settings to default?") + Retranslate.onLanguageChanged
                    onFinished: {
                        if (myQmlDialog.result == SystemUiResult.ConfirmButtonSelection)
                            appSettings.reset()
                    }
                }
            ]
            onTriggered: {
                myQmlDialog.show()
            }
        }
    }
    
    function setTheme(theme) {
        console.log("setTheme: " + theme)
        switch (theme) {
            case (gvBrightTheme):
                optBrightTheme.selected = true
                break
            
            case (gvDarkTheme):
                optDarkTheme.selected = true
                break
        }
    }
    onCreationCompleted: {
        appSettings.themeChanged.connect(setTheme)
    }
    ScrollView {
        id: settingScrollView
        Container {
            
            layout: DockLayout {
            }
            
            Container {
                verticalAlignment: VerticalAlignment.Fill
                horizontalAlignment: HorizontalAlignment.Fill
                                
                Container {
                    id: cntThemeSettings
                    verticalAlignment: VerticalAlignment.Fill
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    leftPadding: ui.du(1.0)
                    rightPadding: ui.du(1.0)
                    topPadding: ui.du(1.0)   
                    bottomPadding: ui.du(1.0)
                    
                    Header {
                        id: headThemeSettings
                        title: qsTr("Theme settings") + Retranslate.onLanguageChanged
                    }
                    Container {
                        id: cntAdaptiveThem
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        horizontalAlignment: HorizontalAlignment.Fill
                        verticalAlignment: VerticalAlignment.Fill
                        onTouch: {
                            if (event.touchType == TouchType.Up) {
                                tbtnAdaptiveTheme.checked = !tbtnAdaptiveTheme.checked 
                            }
                        }
                        ImageView {
                            id: imgAdaptiveTheme
                            layoutProperties: StackLayoutProperties {
                                spaceQuota: 0.5
                            }
                            horizontalAlignment: HorizontalAlignment.Left
                            verticalAlignment: VerticalAlignment.Center
                            imageSource: "asset:///images/settings/ic_qs_displaybrightness.png"
                            filterColor: !tbtnAdaptiveTheme.checked ? Color.Gray : appSettings.theme == 1 ? Color.Blue : Color.Yellow
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
                                id: lblAdaptiveTheme
                                horizontalAlignment: HorizontalAlignment.Left
                                text: qsTr("Adaptive Theme") + Retranslate.onLanguageChanged
                                
                                bottomMargin: ui.px(0.0)
                                textStyle {
                                    base: SystemDefaults.TextStyles.TitleText
                                }
                            }
                            Label {
                                id: lblAdaptiveThemeDescription
                                text: qsTr("Set the theme automatically depending on the brightness recieving with the light sensor.") + Retranslate.onLanguageChanged
                                
                                textStyle.lineHeight: 1.0
                                textStyle.textAlign: TextAlign.Default
                                textFit.mode: LabelTextFitMode.Default
                                textFit.maxFontSizeValue: 10.0
                                autoSize.maxLineCount: 5
                                multiline: true
                                topMargin: ui.px(0.0)
                                textStyle {
                                    base: SystemDefaults.TextStyles.SubtitleText
                                }
                            }
                        }
                        ToggleButton {
                            layoutProperties: StackLayoutProperties {
                                spaceQuota: 0.5
                            }
                            verticalAlignment: VerticalAlignment.Center
                            id: tbtnAdaptiveTheme
                            horizontalAlignment: HorizontalAlignment.Right
                            checked: appSettings.adaptiveTheme
                            onCheckedChanged: {
                                appSettings.adaptiveTheme = checked
                            }
                        }
                    }
                    DropDown {   
                        id: drdTheme
                        title: qsTr("Theme selection") + Retranslate.onLanguageChanged
                        enabled: !tbtnAdaptiveTheme.checked
                        options: [
                            Option {
                                id: optDarkTheme
                                value: VisualStyle.Dark
                                text: qsTr("Dark Theme") + Retranslate.onLanguageChanged
                            },
                            Option {
                                id: optBrightTheme
                                value: VisualStyle.Bright
                                text: qsTr("Bright Theme") + Retranslate.onLanguageChanged
                            }
                        ]
                        
                        onCreationCompleted: {
                            switch (appSettings.theme) {
                                case (gvBrightTheme):
                                    optBrightTheme.selected = true
                                    break
                                
                                case (gvDarkTheme):
                                    optDarkTheme.selected = true
                                    break
                            }
                        }
                        
                        onSelectedOptionChanged: {
                            // Set the theme when selection changes.
                            Application.themeSupport.setVisualStyle(selectedOption.value);
                            appSettings.theme = selectedOption.value
                        }
                    }
                }
                Divider {
                }
                Label {
                    horizontalAlignment: HorizontalAlignment.Right
                    text: 'Version: ' + Application.applicationVersion
                }
            }
        }
    }
}