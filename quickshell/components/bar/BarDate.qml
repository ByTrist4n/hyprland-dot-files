import "../../components/widget"
import "../../theme"
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

Rectangle {
    id: clockPill

    anchors.centerIn: parent
    implicitHeight: 30
    implicitWidth: clockLayout.implicitWidth + 16
    color: clockMouseArea.containsMouse ? Color.bgSurfaceHover : "transparent"
    radius: 6
    border.color: Color.borderBase
    border.width: 1

    RowLayout {
        id: clockLayout

        anchors.centerIn: parent
        spacing: 6

        Text {
            text: "󰃭"
            color: Color.accentPrimary
            font.pixelSize: 13
        }

        Text {
            id: clockText

            text: clockTimer.timeString
            color: Color.fgPrimary
            font.pixelSize: 14
            font.bold: true
        }

    }

    Timer {
        id: clockTimer

        property string timeString: ""

        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            timeString = Qt.formatDateTime(new Date(), "ddd, dd MMM - hh:mm AP");
        }
    }

    MouseArea {
        id: clockMouseArea

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            calendarPopup.toggle();
        }
    }

    Calendar {
        id: calendarPopup

        targetItem: clockPill
    }

}
