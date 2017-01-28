/*
 * Copyright (C) 2017 Niels Tholenaar <info@123quality.nl>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.5
import org.asteroid.controls 1.0
import QtSensors 5.3

Application {
    id: app

    centerColor: "#000"
    outerColor: "#333"

    Item {
        id: mainPage
        anchors.fill: parent
        property int rotation: 0;
        property int calibration: 0;

        Compass {
            id: compass
            active: true
            onReadingChanged: {
                mainPage.rotation = reading.azimuth;
                mainPage.calibration = reading.calibrationLevel;
            }
        }

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 25
            id: arrowImage
            fillMode: Image.PreserveAspectFit
            source: "compass.png"
            rotation: -mainPage.rotation
            height: 200;
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            color: "white";
            font.pixelSize: 20
            text: mainPage.rotation + " °N Calibrated: " + mainPage.calibration
        }
    }
}
