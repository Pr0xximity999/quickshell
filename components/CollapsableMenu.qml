pragma ComponentBehavior: Bound

import QtQuick

Item{
    id: root
    required property list<string> buttons
    signal selected(number: int)

    onClickedNumChanged: selected(clickedNum)
    property bool expand: false
    property int clickedNum: 0

    Repeater{
        model: root.buttons.length
        StyledButton{
            id: button
            required property int modelData
            property bool isCurrent: modelData == root.clickedNum
            property bool isVisible: root.expand || isCurrent
            
            highlighted: isCurrent
            width: root.width
            height: root.height
            z: isCurrent ? 1 : 0

            onClicked: {
                root.clickedNum = modelData
                root.expand = !root.expand
            }

            text: root.buttons[modelData]

            // Set the current selected button in the middle, others adjust relatively
            // If the buttons are not the current one, put them under the current button
            states: 
            [
                State{
                    name: "collapsed"
                    when: !root.expand
                    PropertyChanges{
                        button.y: 0
                        button.opacity: button.isCurrent ? 1 : 0
                        button.visible: button.isVisible
                    }
                },
                State{
                    name: "expanded"
                    when: root.expand 
                    PropertyChanges{
                        button.y: root.height * button.modelData
                        button.opacity: 1
                        button.visible: true
                    }
                }
            ]
            
            transitions: 
            [
                Transition{
                    from: "collapsed"
                    to: "expanded"
                    reversible: true
                    NumberAnimation {
                        target: button
                        properties: "y"
                        duration: 200
                        easing.type: Easing.InOutQuad
                    } 
                }
            ]
        }
    }
}