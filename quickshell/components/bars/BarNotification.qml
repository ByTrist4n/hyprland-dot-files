import "../../theme"
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: button

    required property var notificationManager
    required property var notificationCenter

    implicitWidth: 36
    implicitHeight: 36
    radius: 10
    color: {
        if (notificationMouse.pressed)
            return Color.bgSurfaceHover;

        if (notificationMouse.containsMouse)
            return Color.bgSurface;

        return "transparent";
    }
    border.width: notificationMouse.containsMouse ? 1 : 0
    border.color: Color.borderBase

    Text {
        anchors.centerIn: parent
        // TODO: Do not disturb mode
        text: false ? "󰪑" : "󰂜"
        color: notificationManager.notifications.length > 0 ? Color.accentPrimary : Color.fgPrimary
        font.pixelSize: 18

        Behavior on color {
            ColorAnimation {
                duration: 150
            }

        }

    }

    Rectangle {
        visible: notificationManager.notifications.length > 0
        width: notificationManager.notifications.length > 9 ? 18 : 16
        height: width
        radius: width / 2
        color: Color.accentPrimary

        anchors {
            top: parent.top
            right: parent.right
            topMargin: -2
            rightMargin: -2
        }

        Text {
            anchors.centerIn: parent
            text: notificationManager.notifications.length > 99 ? "99+" : notificationManager.notifications.length
            color: Color.bgBase
            font.pixelSize: 9
            font.bold: true
        }

    }

    MouseArea {
        id: notificationMouse

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            notificationCenter.toggle();
        }
    }

    Behavior on color {
        ColorAnimation {
            duration: 120
        }

    }

    Behavior on border.width {
        NumberAnimation {
            duration: 100
        }

    }

}
