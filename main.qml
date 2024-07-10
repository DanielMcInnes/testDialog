import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls

Window {
	id: root

	readonly property real scalingRatio: contentItem.scale

	width: Screen.width
	height: Screen.height
	visible: true
	title: qsTr("Hello World")
	onWidthChanged: console.log("Main: width:", width, "Screen.width:", Screen.width, "scalingRatio:", scalingRatio, "contentItem.scale:", contentItem.scale)

	contentItem {
		scale: Math.min(root.width/1920, root.height/1080)
	}

	Rectangle {
		id: rectangle
		anchors.centerIn: parent
		color: "yellow"
		opacity: 0.1
		width: 1600
		height: 800

		Row {
			anchors.verticalCenter: parent.verticalCenter
			Repeater {
				model: 30
				Text {
					text: index + " "
				}
			}
		}
	}

	Popup {
		id: popup
		anchors.centerIn: parent
		implicitWidth: 1400
		implicitHeight: 700
		//width: 1400
		//height: 700
		padding: 0
		topInset: 0
		bottomInset: 0
		leftInset: 0
		rightInset: 0
		background: Rectangle {
			radius: 10
			color: "green"
			opacity: 0.1
		}

		onWidthChanged: console.log("dialog.width:", width, "availableWidth:", availableWidth)
	}

	Component.onCompleted: {
		popup.open()
	}
}
