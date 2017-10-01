import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.2
import QtQuick.Extras 1.4


ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 1200
    height: 750
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
        width: 336
        height: 377
        anchors.verticalCenterOffset: -26
        anchors.horizontalCenterOffset: -417
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

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
        y: 95
        width: 220
        height: 220
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: mainvoltgauge.horizontalCenter
        stepSize: .05
        maximumValue: 16
        value:1
        
        style: CircularGaugeStyle {
            minorTickmarkCount: 5
            tickmarkStepSize: 2
        }
        
        
        
        Behavior on value { SmoothedAnimation { velocity: 20 } }


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
            x: 97
            y: 160
            text: qsTr("Volts")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 46
            font.pixelSize: 12
            color: "grey"
            }
    

    }

    CircularGauge {
        id: mainvoltgauge
        x: 381
        y: 377
        width: 220
        height: 220
        anchors.horizontalCenterOffset: -124
        anchors.horizontalCenter: parent.horizontalCenter
        maximumValue: 80
        visible: true
        stepSize: .05
        value: 0
        
        Behavior on value { SmoothedAnimation { velocity: 20 } }



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
        y: 168
        text: qsTr("Volts")
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 46
        font.pixelSize: 12
        color: "grey"
    }
    }

    Gauge {
        id: amphourgauge
        x: 873
        y: 103
        width: 114
        height: 294
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        value: 100
        style: GaugeStyle {
            valueBar: Rectangle {
                implicitWidth: 24
                color: "green"
            }
        }

        Text {
            id: text7
            x: 30
            y: -29
            text: qsTr("AMP HOURS")
            anchors.horizontalCenterOffset: -17
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 301
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 18
            color: "grey"
        }

        Text {
            id: amphourtext
            y: 313
            text: amphourgauge,value
            anchors.horizontalCenterOffset: -15
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -41
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
        anchors.bottom: amphourgauge.top
        anchors.bottomMargin: -373
        anchors.horizontalCenterOffset: -13
        anchors.horizontalCenter: amphourgauge.horizontalCenter

        onClicked: dashboard.reset(amphourgauge.value)
    }



    Gauge {
        id: arraycurrent
        x: 651
        y: 160
        width: 84
        height: 250
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter

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
        style: GaugeStyle {
            valueBar: Rectangle {
                implicitWidth: 20
                color: "green"
            }
        }
        
        Behavior on value { SmoothedAnimation { velocity: 100 } }
    }

    Gauge {
        id: motorcurrent
        x: 755
        y: 160
        width: 84
        height: 250
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        value: 0
        style: GaugeStyle {
            valueBar: Rectangle {
                implicitWidth: 20
                color: "red"
            }
        }
        
        Behavior on value { SmoothedAnimation { velocity: 100 } }

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
            
            }
        onAuxVoltage: {
        // auxvolt was set through arguments=['auxvolt']
            auxvoltgauge.value = auxvolt
            
            }
        onMainVoltage: {
        // auxvolt was set through arguments=['mainvolt']
            mainvoltgauge.value = mainvolt
            
            }
 
         onMotorCurrent: {
            motorcurrent.value = motorcur
            
            }
         onArrayCurrent: {
            arraycurrent.value = arraycurrent
            
            }                 

            
            

    }



}
