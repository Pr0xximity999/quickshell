pragma ComponentBehavior: Bound

import QtQuick
import qs.config

Item{
    id: root
    required property list<string> buttons
    signal selected(number: int)

    onClickedNumChanged: selected(clickedNum)
    property bool isExpanded: false
    property int clickedNum: 0

    Rectangle{
        width: root.width
        height: root.isExpanded ? root.height * root.buttons.length : root.height
        y: root.isExpanded ?  root.height * (0 - root.clickedNum) : 0
        color: "transparent"
        z: 3
        radius: 5

        Behavior on height {
            NumberAnimation{
                easing.type: Easing.InOutQuad
                duration: 150
                }
        }

        Behavior on y {
            NumberAnimation{
                easing.type: Easing.InOutQuad
                duration: 150
            }
        }

        border{
            width: 3
            color: Appearance.color.back
        }
    }

    Repeater{
        model: root.buttons.length
        StyledButton{
            id: button
            required property int modelData
            property bool isCurrent: modelData == root.clickedNum
            property bool isVisible: root.isExpanded || isCurrent
            
            highlighted: isCurrent
            width: root.width
            height: root.height
            z: isCurrent ? 1 : 0

            topLeftRadius: isCurrent && !root.isExpanded || modelData == 0 ? 5 : 0
            topRightRadius: isCurrent && !root.isExpanded || modelData == 0 ? 5 : 0
            bottomLeftRadius: isCurrent && !root.isExpanded || modelData == root.buttons.length - 1 ? 5 : 0
            bottomRightRadius: isCurrent && !root.isExpanded || modelData == root.buttons.length - 1 ? 5 : 0

            onClicked: {
                root.clickedNum = modelData
                root.isExpanded = !root.isExpanded
            }

            text: root.buttons[modelData]

            // Set the current selected button in the middle, others adjust relatively
            // If the buttons are not the current one, put them under the current button
            states: 
            [
                State{
                    when: !root.isExpanded
                    PropertyChanges{
                        button.y: 0
                        button.opacity: button.isCurrent ? 1 : 0
                        button.visible: button.isVisible
                    }
                },
                State{
                    when: root.isExpanded 
                    PropertyChanges{
                        button.y: root.height * (button.modelData - root.clickedNum)
                        button.opacity: 1
                        button.visible: true
                    }
                }
            ]
            
            Behavior on y {
                NumberAnimation {
                    properties: "y"
                    duration: 150
                    easing.type: Easing.InOutQuad
                } 
            }
        }
    }
}