import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtQuick.Extras 1.4


ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 1000
    height: 500
    color: "black"
    title: "I like Telemetry"

    Text {
        id: text1
        x: 300
        y: 6
        width: 353
        height: 34
        text: qsTr("Solar Car Telemetry System")
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Times New Roman"
        font.pixelSize: 30
        color: "grey"
    }


    CircularGauge {
        id: circularGauge
        x: 55
        y: 111
        width: 308
        height: 279
        anchors.verticalCenter: rowLayout.verticalCenter

        Text {
            id: text2
            x: 143
            y: 226
            text: qsTr("Speed")
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
            color: "grey"
        }
    }

    CircularGauge {
        id: auxvoltgauge
        x: 381
        y: 92
        width: 151
        height: 141
        stepSize: .5
        maximumValue: 15
        value:1



        Text {
            id: text3
            x: 445
            width: 69
            text: qsTr("Aux Battery")
            anchors.top: parent.top
            anchors.topMargin: -17
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
            color: "grey"
            }

        Text {
            id: text5
            x: 64
            y: 106
            text: qsTr("Volts")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            font.pixelSize: 12
            color: "grey"
            }
    

    }

    CircularGauge {
        id: mainvoltagegauge
        x: 381
        y: 288
        width: 151
        height: 141
        visible: true



    Text {
        id: text4
        x: 445
        y: 259
        text: qsTr("Main Battery")
        anchors.top: parent.top
        anchors.topMargin: -17
        fontSizeMode: Text.FixedSize
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 12
        color: "grey"
    }
    Text {
        id: text6
        x: 64
        y: 106
        text: qsTr("Volts")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        font.pixelSize: 12
        color: "grey"
    }
    }

    Gauge {
        id: amphourgauge
        x: 803
        y: 103
        width: 114
        height: 294
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        value: 50

        Text {
            id: text7
            x: 30
            y: 260
            text: qsTr("AMP HOURS")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -25
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 18
            color: "grey"
        }

    }



    Button {
        id: amphourreset
        objectName: amphourreset
        x: 795
        y: 434
        text: qsTr("Reset")

        onClicked: dashboard.reset(amphourgauge.value)
    }

    Button {
        id: start
        x: 880
        y: 434
        text: qsTr("Start")

        onClicked: dashboard.startme(amphourgauge.value)
    }


    Gauge {
        id: arraycurrent
        x: 621
        y: 160

        Text {
            id: text10
            text: qsTr("Array Current")
            font.pixelSize: 12
            color: "grey"
            anchors.top: parent.top
            anchors.topMargin: -17
            fontSizeMode: Text.FixedSize
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Gauge {
        id: motorcurrent
        x: 710
        y: 160

        Text {
            id: text9
            text: qsTr("Motor Current")
            font.pixelSize: 12
            color: "grey"
            anchors.top: parent.top
            anchors.topMargin: -17
            fontSizeMode: Text.FixedSize
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    
    Connections {
        target: dashboard
        ignoreUnknownSignals: true
 
        onAmpHourvalue: {
        // sub was set through arguments=['amphour']
            amphourgauge.value = amphour
            auxvoltgauge.value = 0
            
            }
        onAuxVoltage: {
        // auxvolt was set through arguments=['auxvolt']
            applicationWindow.title = "Hello"
            auxvoltgauge.value = auxvolt
            
            }
            
        onMainVoltage: {
        mainvoltagegauge.value=mainvolt
        }

            
            

    }



}
