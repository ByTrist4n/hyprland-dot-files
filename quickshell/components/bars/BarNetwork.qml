import "../../theme"
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    required property var networkPopup

    implicitWidth: networkRow.implicitWidth + 24
    implicitHeight: networkRow.implicitHeight + 16
    radius: 10
    color: networkMouseArea.containsMouse ? Color.bgSurfaceHover : Color.bgSurface
    border.width: 1
    border.color: Color.borderBase

    RowLayout {
        id: networkRow

        anchors.centerIn: parent
        spacing: 8

        Text {
            text: networkPopup.wifiDevice && networkPopup.wifiDevice.connected ? "󰖩" : "󱚵"
            color: Color.accentPrimary
            font.pixelSize: ThemeFont.lg
        }

        Text {
            text: networkPopup.bluetoothAdapter && networkPopup.bluetoothAdapter.enabled ? "󰂯" : "󰂲"
            color: networkPopup.bluetoothAdapter && networkPopup.bluetoothAdapter.enabled ? Color.accentSecondary : Color.fgMuted
            font.pixelSize: ThemeFont.lg
        }

    }

    MouseArea {
        id: networkMouseArea

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: networkPopup.opened = !networkPopup.opened
    }

}
