import QtQuick 2.12
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Canvas Paint + PinchArea")

    Canvas {
        id: myCanvas
        anchors.fill: parent

        property int lastX: 0
        property int lastY: 0

        function clear() {
            var ctx = getContext('2d');
            ctx.reset();
            myCanvas.requestPaint();
        }

        Button {
            id: myButton
            text: 'Clear'
            z: myCanvas.z + 1
            anchors {
                horizontalCenter: myCanvas.horizontalCenter
                bottom: myCanvas.bottom
                margins: 5
            }

            onClicked: {
                myCanvas.clear();
            }
        }//end: Button


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
