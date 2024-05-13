import QtQuick 2.15
// import Qt.labs.folderlistmodel 2.15
import QtQuick.Dialogs 1.3

Item {
    id: homeView
    // width: parent.width
    // height: parent.height

    property string checkMsg: "Homeview"

    Rectangle{
        id: bgViewID
        anchors.fill: parent
        color: "transparent"

        Rectangle{
            id: titleList
            width: parent.width
            height: 30
            color: "#D3D3D3"

            visible: true

            Row{
                spacing: 1
                anchors.fill: parent
                Rectangle{
                    id: indexTitleList
                    width: parent.width / 16
                    height: parent.height
                    color: "darkcyan"
                    Text {
                        id: indexList
                        text: qsTr("Index")
                        anchors.centerIn: parent
                    }
                }

                Rectangle{
                    id: titleTitleList
                    width: parent.width / 16 * 3
                    height: parent.height
                    color: "darkcyan"
                    Text {
                        id: titleMedia
                        text: qsTr("Title")
                        anchors.centerIn: parent
                    }
                }

                Rectangle{
                    id: artistTitleList
                    width: parent.width / 16 * 3
                    height: parent.height
                    color: "darkcyan"
                    Text {
                        id: artistMedia
                        text: qsTr("Artist")
                        anchors.centerIn: parent
                    }
                }

                Rectangle{
                    id: albumTitleList
                    width: parent.width / 16 * 3
                    height: parent.height
                    color: "darkcyan"
                    Text {
                        id: albumMedia
                        text: qsTr("Album")
                        anchors.centerIn: parent
                    }
                }

                Rectangle{
                    id: durationTitleList
                    width: parent.width / 16
                    height: parent.height
                    color: "darkcyan"
                    Text {
                        id: durationMedia
                        text: qsTr("Duration")
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    id: pathTitleList
                    width: parent.width / 16 * 5
                    height: parent.height
                    color: "darkcyan"
                    Text {
                        id: pathMedia
                        text: qsTr("path")
                        anchors.centerIn: parent
                    }
                }
            }
        }

        ListView{
            id: listViewSong
            width: parent.width
            height: parent.height - 30
            y: 30
            model: 10
            clip: true
            spacing: 1
            boundsBehavior: Flickable.StopAtBounds
            visible: true

            delegate: Rectangle{
                width: parent.width
                height: 50
                color: "red"
                Row{
                    anchors.fill: parent


                    Rectangle{
                        width: indexTitleList.width
                        height: parent.height
                        Text {
                            text: index+1
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle{
                        width: titleTitleList.width
                        height: parent.height
                        Text {
                            text: "titleName"
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle{
                        width: artistTitleList.width
                        height: parent.height
                        Text {
                            text: "artname"
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle{
                        width: albumTitleList.width
                        height: parent.height
                        Text {
                            text: "album"
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle{
                        width: durationTitleList.width
                        height: parent.height
                        Text {
                            text: "duration"
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle{
                        width: pathTitleList.width
                        height: parent.height
                        Text {
                            text: "path"
                            anchors.centerIn: parent
                        }
                    }
                }
            }
        }


        Rectangle{
            id: areaBtn
            width: parent.width
            height: 60
            y: parent.height - height
            color: "transparent"
            visible: listViewSong > 0 ? true: false

            Row{
                spacing: 20
                anchors.centerIn: parent
                Rectangle{
                    id: openFilesBtn
                    width: 120
                    height: 40
                    radius: 5
                    color: "darkcyan"

                    Text {
                        id: openFilesTxt
                        text: qsTr("Open Files")
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: {
                            console.log("Open File(s)")
                            // fileDialog.nameFilters = ".mp3"
                            fileDialog.selectMultiple = true
                            fileDialog.selectFolder = false
                            fileDialog.open()
                        }

                        onEntered: {
                            openFilesBtn.color = "darkorange"
                            openFilesTxt.color = "white"
                        }

                        onExited: {
                            openFilesBtn.color = "darkcyan"
                            openFilesTxt.color = "black"
                        }
                    }

                }
                Rectangle{
                    id: openFolderBtn
                    width: 120
                    height: 40
                    radius: 5
                    color: "darkcyan"

                    Text {
                        id: openFolderTxt
                        text: qsTr("Open Folder")
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: {
                            console.log("Open Folder")
                            fileDialog.selectFolder = true
                            fileDialog.open()
                        }
                        onEntered: {
                            openFolderBtn.color = "darkorange"
                            openFolderTxt.color = "white"
                        }

                        onExited: {
                            openFolderBtn.color = "darkcyan"
                            openFolderTxt.color = "black"
                        }
                    }
                }
            }
        }


        FileDialog {
            id: fileDialog
            title: "Select File or Folder"
            // nameFilters: [ "MP3 files (*.mp3)" ]
            // nameFilters: "*.mp3"
            // selectFolder: true
            folder: shortcuts.home



            onAccepted: {
                var path = fileUrl.toString().replace("file://", "");
                console.log("have select path")
                console.log("=============>" + path)
                // songModelCpp.pathFolder = path

            }
            onRejected: {
                console.log("Cancel")
            }
        }

    }
}
