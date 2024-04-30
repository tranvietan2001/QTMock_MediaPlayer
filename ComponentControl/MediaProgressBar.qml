import QtQuick 2.15

Item {
    id: item
    width: widthProgressBar
    height: heightProgressBar

    property int widthProgressBar: 0
    property int heightProgressBar: 0
    property int sizePoint: 0
    property int positionPoint: 0
    property string colorBackground: "transparent"
    property string colorTimeLine: "transparent"
    property string colorPoint: "transparent"

    signal clicked()
    signal positionChanged()
    signal exited()

    Rectangle {
        id: bgProgressBarID
        anchors.fill: parent
        color: colorBackground
        radius: parent.width/2
        border.width: 1
        border.color: colorTimeLine



        Rectangle{
            id: bgTimeLineID
            width: positionPoint
            height: parent.height
            color: colorTimeLine
            radius: height/2
        }

        Rectangle {
            id: pointProgressBarID
            width: sizePoint
            height: sizePoint
            radius: sizePoint/2
            color: colorPoint
            x: positionPoint - width/2
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            positionPoint = mouse.x
            item.clicked()
        }

        onPositionChanged: {
            let checkPosition = mouse.x
            if(checkPosition > item.width) checkPosition = item.width
            if(checkPosition < 0) checkPosition = 0
            positionPoint = checkPosition

            item.positionChanged()
        }

        onExited: {
            // console.log(positionPoint)
            item.exited()
        }
    }
}
