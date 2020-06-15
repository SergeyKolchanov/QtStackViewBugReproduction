import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        color: "yellow"
        anchors.fill: parent

        Button {
            text: "push green view"
            anchors.centerIn: parent
            onClicked: {
                swipeView.push(swipeComponent, {}, StackView.PushTransition)
            }

            width: 300
            height: 100
        }
    }

    StackView {
        anchors.fill: parent
        id: swipeView

        onDepthChanged: {
            print("depth changed to " + depth)
        }
    }

    Component {
        id: swipeComponent

        Rectangle {
            color: "green"
            Button {
                text: "pop green view"
                anchors.centerIn: parent
                onClicked: {
                    // NOTE: If you do swipeView.clear() then you can see log message "depth changed to 0"
                    // But if you do swipeView.clear(StackView.PopTransition) then you can't
                    swipeView.clear(StackView.PopTransition)
                }
            }
        }
    }
}
