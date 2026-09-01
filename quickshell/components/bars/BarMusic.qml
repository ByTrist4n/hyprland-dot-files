import "../widgets"
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris

Rectangle {
    id: root

    // Fetch the active MPRIS player or fallback to first available
    property MprisPlayer activePlayer: Mpris.players.values.length > 0 ? Mpris.players.values[0] : null

    implicitWidth: musicRow.implicitWidth + 32
    implicitHeight: musicRow.implicitHeight + 16
    color: "#1e1e2e"
    radius: 12
    border.color: "#313244"
    border.width: 1

    RowLayout {
        id: musicRow

        anchors.centerIn: parent
        spacing: 12

        // Track Title
        Text {
            text: root.activePlayer && root.activePlayer.trackTitle ? root.activePlayer.trackTitle : "No media playing"
            color: "#cdd6f4"
            font.pixelSize: 14
            font.bold: true
            elide: Text.ElideRight
        }

        // Artist Name
        Text {
            text: "- " + (root.activePlayer && root.activePlayer.trackArtist ? root.activePlayer.trackArtist : "Unknown artist")
            color: "#a6adc8"
            font.pixelSize: 12
            elide: Text.ElideRight
        }

        CavaVisualizer {
            Layout.preferredWidth: 120
            Layout.preferredHeight: 24
            Layout.alignment: Qt.AlignVCenter
        }

    }

}
