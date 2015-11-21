/*
 * Copyright (c) 2011-2015 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.4
// >>> needed for adaptive theme
import QtMobility.sensors 1.3
import my.library 1.0
// <<< needed for adaptive theme

NavigationPane {
    id: nav
    // >>> needed for adaptive theme
    property bool ambient: true
    // <<< needed for adaptive theme
    Page {
        id: page
        // >>> needed for adaptive theme
        property variant sensorVal: AmbientLightSensor.Undefined
        // <<< needed for adaptive theme
        Container {
            ListView {
                dataModel: XmlDataModel {
                    source: "data.xml"
                }
                contextActions: [
                    ActionSet {
                        title: qsTr("Contextmenu") + Retranslate.onLanguageChanged
                        
                        ActionItem {
                            title: qsTr("Todo") + Retranslate.onLanguageChanged
                            onTriggered: {
                                if (enabled) {
                                }
                            }
                        }
                    }
                ]
                // >>> needed for adaptive theme
                contextMenuHandler: ContextMenuHandler {
                    id: myHandler
                    onVisualStateChanged: {
                        deactivateAmbLight(myHandler.visualState)
                    }
                }
                // <<< needed for adaptive theme
                onTriggered: {
                    
                    if (indexPath.length == 2) {
                        var chosenItem = dataModel.data(indexPath);
                        var contentpage = itemPageDefinition.createObject();
                        
                        // >>> needed for adaptive theme
                        contentpage.stateChanged.connect(nav.deactivateAmbLight)
                        // <<< needed for adaptive theme
                        contentpage.itemPageTitle = chosenItem.name
                        contentpage.itemPageBody = chosenItem.name
                        nav.push(contentpage);
                    }
                }
                accessibility.name: "Listing"
            }
            TextArea {
                id: hint
                textFormat: TextFormat.Plain
                editable: false
                
                text: "If you implement context menu to components like ListView, TextField, TextArea, Label, ... you need to be sure that you need to implement the contextMenuHandler. From the moment on when the context menu is opening you need to disable the adaptive Theme, otherwise the adaptive theme will close the context menu. This will disturb the user."
            }
        
        }
        
        // >>> needed for adaptive theme
        onActionMenuVisualStateChanged: {
            deactivateAmbLight(actionMenuVisualState)
        }
        // <<< needed for adaptive theme
    }
    
    attachedObjects: [
        // >>> needed for adaptive theme
        QTimer {
            id: ambTimer
            // set the interval. low = if lightcondition are not good the background switches continuously between bright and dark.
            // 1000 ms can be a good value
            interval: 1000
            onTimeout: {
                checkLight(page.sensorVal)
                ambTimer.stop()
            }
        },
        // <<< needed for adaptive theme
        // >>> needed for adaptive theme
        AmbientLightSensor {
            id: ambLight
            
            // Turn on the sensor
            active: appSettings.adaptiveTheme && ambient
            
            // If the device isn't moving (x&y&z==0), don't send updates, saves power
            skipDuplicates: true
            
            onReadingChanged: { // Called when an ambient light reading is available
                
                page.sensorVal = reading.lightLevel
                // start the timer. if lightcondition are not good the background switches continuously between bright and dark.
                ambTimer.start()            
            }
        },
        // <<< needed for adaptive theme
        ComponentDefinition {
            id: additionalPage
            source: "settings.qml"
        },
        ComponentDefinition {
            id: itemPageDefinition
            source: "ItemPage.qml"
        }
    ]
    onPopTransitionEnded: {
        page.destroy();
    }
    onCreationCompleted: {
        // >>> needed for adaptive theme
        switch (appSettings.theme) {
            case (VisualStyle.Bright):
                Application.themeSupport.setVisualStyle(VisualStyle.Bright);
                break
            case (VisualStyle.Dark):
                Application.themeSupport.setVisualStyle(VisualStyle.Dark);
                break
        }
        // <<< needed for adaptive theme
    }
    Menu.definition: MenuDefinition {
        
        settingsAction: SettingsActionItem {
            id: actionSettings
            onTriggered: {
                openPages("settings")
                enabled = false
            }
        }
        actions: [
            ActionItem {
                id: actionAbout
                title: qsTr("About") + Retranslate.onLanguageChanged
                imageSource: "asset:///images/ic_info.png"
                
                onTriggered: {
                    openPages("about")
                }
                ActionBar.placement: ActionBarPlacement.OnBar
            }
        ]
    }
    function openPages(page) {
        if (page == "about") {
            additionalPage.source = "about.qml"
        } else if (page == "settings") {
            additionalPage.source = "settings.qml"
        }
        var sheet = additionalPage.createObject();
        nav.push(sheet);
    }
    function deactivateAmbLight(state) {
        console.log("appSettings.adaptiveTheme" + appSettings.adaptiveTheme)
        console.log("deactivateAmbLight: " + state)
        if (state == 3) {
            ambient = false
        } else if (state == 0) {
            ambient = appSettings.adaptiveTheme
        }
    }
    function checkLight(val) {
        if(val > 2) {
            if (VisualStyle.Bright != appSettings.theme) {
                Application.themeSupport.setVisualStyle(VisualStyle.Bright)
                appSettings.theme = VisualStyle.Bright
            }
        } else {
            if (VisualStyle.Dark != appSettings.theme) {
                Application.themeSupport.setVisualStyle(VisualStyle.Dark)
                appSettings.theme = VisualStyle.Dark
            }
        }
    }   
}