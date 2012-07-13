import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonTools

    function formattedDelta(a ,b, c)
    {
        var d = (b-a)/c;

        return formatSeconds(d);
    }

    function updateEstimatedTime()
    {
        if (contractionModel.count > 5)
            infoPanel.lastFivePeriods = formattedDelta(
                        contractionModel.get(contractionModel.count-6).contractionTime,
                        contractionModel.get(contractionModel.count-1).contractionTime,
                        5);

        if (contractionModel.count > 3)
            infoPanel.lastThreePeriods = formattedDelta(
                        contractionModel.get(contractionModel.count-4).contractionTime,
                        contractionModel.get(contractionModel.count-1).contractionTime,
                        3);

        if (contractionModel.count > 1)
        {
            var delta = contractionModel.get(contractionModel.count-1).contractionTime - contractionModel.get(contractionModel.count-2).contractionTime;
            infoPanel.nextTime = formatSeconds(contractionModel.get(contractionModel.count-1).contractionTime + delta);
            infoPanel.lastPeriod = formattedDelta(
                        contractionModel.get(contractionModel.count-2).contractionTime,
                        contractionModel.get(contractionModel.count-1).contractionTime,
                        1);
        }

        infoPanel.lastTime = formatSeconds(contractionModel.get(contractionModel.count-1).contractionTime);
    }

    Timer {
        interval: 200
        repeat: true
        running: contractionModel.count > 1
        onTriggered: {
            var delta = contractionModel.get(contractionModel.count-1).contractionTime - contractionModel.get(contractionModel.count-2).contractionTime;
            var nextTime = contractionModel.get(contractionModel.count-1).contractionTime + delta;
            var d = new Date;
            var currentTime = d.getHours()*3600 + d.getMinutes()*60 + d.getSeconds();
            if (nextTime > currentTime)
                infoPanel.timeLeft = formatSeconds(nextTime-currentTime);
            else
                infoPanel.timeLeft = "now"
        }
    }

    function addContraction()
    {
        var d = new Date;
        contractionModel.append({"contractionTime": d.getHours()*3600 + d.getMinutes()*60 + d.getSeconds()});
        listView.positionViewAtEnd();
        updateEstimatedTime();
    }

    function strRight(t, l)
    {
        return t.substr(t.length-l)
    }

    function formatSeconds(t)
    {
        var hours = Math.floor(t/3600);
        var minutes = Math.floor(t/60)%60;
        var seconds = Math.floor(t%60);
        return strRight("00" + hours, 2) + ":" + strRight("00" + minutes, 2) + ":" + strRight("00" + seconds, 2);
    }

    ListModel {
        id: contractionModel
    }

    ListView {
        id: listView

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: infoPanel.top

        model: contractionModel
        delegate: Item {
            width: ListView.view.width
            height: 50

            Label {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10

                text: formatSeconds(contractionTime);

                font.pixelSize: 32
            }
        }
    }

    InfoPanel {
        id: infoPanel

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
}
