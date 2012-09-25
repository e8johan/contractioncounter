/*
 * Contraction Counter - a contraction tracker app
 * Copyright 2012 (C) Johan Thelin
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */

import QtQuick 1.1
import com.nokia.meego 1.0

Rectangle {
    height: 225

    property alias lastPeriod: lastPeriodText.text
    property alias lastThreePeriods: lastThreePeriodsText.text
    property alias lastFivePeriods: lastFivePeriodsText.text
    property alias lastTime: lastTimeText.text
    property alias nextTime: nextTimeText.text
    property alias timeLeft: timeLeftText.text

    color: "darkGray"

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        height: 2

        color: "white"
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.top

        height: 7

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#00000000" }
            GradientStop { position: 1.0; color: "#aa000000" }
        }
    }

    Column {
        anchors.left: parent.left
        anchors.top: parent.top

        width: parent.width / 2

        Row {
            height: 75

            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "last-period.png"
            }
            Label {
                id: lastPeriodText
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Row {
            height: 75

            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "3x-period.png"
            }
            Label {
                id: lastThreePeriodsText
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Row {
            height: 75

            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "5x-period.png"
            }
            Label {
                id: lastFivePeriodsText
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    Column {
        anchors.right: parent.right
        anchors.top: parent.top

        width: parent.width / 2

        Row {
            height: 75

            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "last-time.png"
            }
            Label {
                id: lastTimeText
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Row {
            height: 75

            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "next-time.png"
            }
            Label {
                id: nextTimeText
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Row {
            height: 75

            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "time-left.png"
            }
            Label {
                id: timeLeftText
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
