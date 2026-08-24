import "./components/bar"
import "./theme"
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
            color: Color.bgBase
            radius: 8

            RowLayout {
                id: barRow

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 8
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 8
                spacing: 8

                BarWorkspaces {
                }

                BarMusic {
                }

                Item {
                    Layout.fillWidth: true
                }

            }

            BarDate {
                anchors.centerIn: parent
            }

        }

    }

}
