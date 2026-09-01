import "./components/bars"
import "./components/notifications"
import "./components/widgets"
import "./theme"
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Services.Notifications

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

                BarNetwork {
                    id: barNetwork

                    networkPopup: networkPopup
                }

            }

            BarDate {
                id: barDate

                anchors.centerIn: parent
            }

            BarNotification {
                id: barNotification

                anchors.left: barDate.right
                anchors.leftMargin: 8
                anchors.verticalCenter: barDate.verticalCenter
                notificationManager: notificationManager
                notificationCenter: notificationCenter
            }

        }

    }

    NotificationServer {
        id: server

        bodySupported: true
        bodyMarkupSupported: false
        actionsSupported: true
    }

    NotificationManager {
        id: notificationManager

        server: server
    }

    NotificationPopup {
        manager: notificationManager
    }

    NotificationCenter {
        id: notificationCenter

        manager: notificationManager
    }

    NetworkPopup {
        id: networkPopup

        barHeight: barContainer.height
    }

}
