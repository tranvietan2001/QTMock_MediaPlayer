import QtQuick 2.15

Item {
    id: itemTabBtnID
    width: widthBtn
    height: heightBtn

    signal clicked()
    property int widthBtn: 0
    property int heightBtn: 0
    property string nameBtn: "default"
    property string pathImg: "qrc:/ComponentControl/icon/home_b.png"

    Rectangle{
        id: tabBtnID
        anchors.fill: parent
        color: "transparent"

        Row{
            height: heightBtn
            Rectangle{
                id: bgIconTabBtn
                width: heightBtn
                height: parent.height
                color: "transparent"
                // anchors.horizontalCenter: pa


                Image {
                    id: iconTabBtnID
                    width: heightBtn/3*2
                    height: heightBtn/3*2
                    source: pathImg

                    anchors.centerIn: parent
                }
            }

            Rectangle{
                id: nameTabBtnID
                width: widthBtn-height
                height: heightBtn
                color: "transparent"

                Text {
                    text: qsTr(nameBtn)
                    font.pointSize: 16
                    color: "black"

                    // anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    // anchors.bottom: parent.bottom
                }
            }
        }
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true

        onClicked: {
            itemTabBtnID.clicked()
        }

        onEntered: {
            tabBtnID.color = "darkcyan"

        }

        onExited: {
            tabBtnID.color = "transparent"
        }
    }



}
