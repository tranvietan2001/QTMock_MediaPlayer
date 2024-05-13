import QtQuick 2.15

Item {
    id: homeView
    // width: parent.width
    // height: parent.height

    property string checkMsg: "Homeview"

    Rectangle{
        id: bgViewID
        anchors.fill: parent
        color: "cyan"


        Rectangle{
            width: parent.width
            height: 50
            y: parent.height/3*2
            color: "red"

            MouseArea{
                anchors.fill: parent

                onClicked: {
                    console.log(bgViewID.width + "-" + bgViewID.height)
                }
            }
        }
    }

}
