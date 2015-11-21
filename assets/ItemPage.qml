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

Page {
    property alias itemPageTitle: titlebar.title
    property alias itemPageBody: body.text
    // >>> needed for adaptive theme
    signal stateChanged(int state)
    onActionMenuVisualStateChanged: {
        stateChanged(actionMenuVisualState)
        console.log("ActionMenuVisualStateChanged")
    }
    // <<< needed for adaptive theme
    titleBar: TitleBar {
        id: titlebar
    }
    Container {
        TextArea {
            id: body
            textFormat: TextFormat.Html
            editable: false
            // >>> needed for adaptive theme
            contextMenuHandler: ContextMenuHandler {
                id: myHandler
                onVisualStateChanged: {
                    stateChanged(myHandler.visualState)
                }
            }
            // <<< needed for adaptive theme
        }
        
        TextArea {
            id: hint
            textFormat: TextFormat.Plain
            editable: false
            
            text: "If you implement context menu to components like ListView, TextField, TextArea, Label, ... you need to be sure that you need to implement the contextMenuHandler. From the moment on when the context menu is opening you need to disable the adaptive Theme, otherwise the adaptive theme will close the context menu. This will disturb the user."
        }
    }
}