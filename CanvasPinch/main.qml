import QtQuick 2.12
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Canvas Paint + PinchArea")

    Button {
        id: myButton
        text: 'Clear'
        x: (root.width / 2.0) - (width / 2.0)
        y: root.height - height - 5
        z: myCanvas.z + 1

        onClicked: {
            myCanvas.clear();
        }
    }//end: Button

    Canvas {
        id: myCanvas

        property var canvasScale: 5
        width: root.width * canvasScale
        height: root.height * canvasScale

        x: -((width - root.width) / 2.0)
        y: -((height - root.height) / 2.0)

        property int lastX: 0
        property int lastY: 0

        function clear() {
            var ctx = getContext('2d');
            ctx.reset();
            myCanvas.requestPaint();
        }//end: function clear()

        Rectangle {
            width: myCanvas.width
            height: myCanvas.height
            color: "lightblue"
            z: -1
        }//end: Rectangle

        PinchArea {
            id: myPinchArea
            anchors.fill: parent
            pinch.target: myCanvas
            pinch.maximumScale: 10.0
            pinch.minimumScale: 0.1
            pinch.maximumRotation: 360
            pinch.minimumRotation: -360
            pinch.dragAxis: Pinch.XAndYAxis

            MouseArea {
                id: myMouseArea
                anchors.fill: parent

                onPressed: {
                    myCanvas.lastX = mouseX;
                    myCanvas.lastY = mouseY;
                }

                onPositionChanged: {
                    myCanvas.requestPaint();
                }

            }//end: MouseArea

        }//end: PinchArea

        onPaint: {
            var ctx = getContext('2d');
            ctx.lineWidth = 4;
            ctx.strokeStyle = "orange"
            ctx.beginPath();
            ctx.moveTo( lastX, lastY );
            lastX = myMouseArea.mouseX;
            lastY = myMouseArea.mouseY;
            ctx.lineTo( lastX, lastY );
            ctx.stroke();
        }//end: onPaint

    }//end: Canvas

}//END
