import "../../theme"
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    required property var networkPopup

    implicitWidth: 78
    implicitHeight: 36
    radius: 10
    color: mouse.containsMouse ? Color.bgSurface : "transparent"
    border.width: mouse.containsMouse ? 1 : 0
    border.color: Color.borderBase

    RowLayout {
        anchors.centerIn: parent
        spacing: 8

        Text {
            text: networkPopup.wifiDevice && networkPopup.wifiDevice.connected ? "󰖩" : "󱚵"
            color: Color.accentPrimary
            font.pixelSize: 18
        }

        Text {
            text: networkPopup.bluetoothAdapter && networkPopup.bluetoothAdapter.enabled ? "󰂯" : "󰂲"
            color: networkPopup.bluetoothAdapter && networkPopup.bluetoothAdapter.enabled ? Color.accentSecondary : Color.fgMuted
            font.pixelSize: 18
        }

    }

    MouseArea {
        id: mouse

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: networkPopup.opened = !networkPopup.opened
    }

}
