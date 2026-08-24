import "./modules" as Modules
import "./theme" as Theme
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

ShellRoot {
    PanelWindow {
        id: root

        implicitHeight: barContainer.implicitHeight
        color: "transparent"

        anchors {
            top: true
            left: true
            right: true
        }

        Rectangle {
            id: barContainer

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 8
            implicitHeight: barRow.implicitHeight + 16
            color: Theme.Color.bgBase
            radius: 8

            RowLayout {
                id: barRow

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 8
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 8
                spacing: 8

                Modules.Workspaces {
                }

                Item {
                    Layout.fillWidth: true
                }

            }

            Modules.DateFull {
                anchors.centerIn: parent
            }

        }

    }

}
