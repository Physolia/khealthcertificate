/*
 * SPDX-FileCopyrightText: 2021 Volker Krause <vkrause@kde.org>
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick 2.15
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1 as QQC2
import org.kde.kirigami 2.12 as Kirigami
import org.kde.prison 1.0 as Prison
import org.kde.ki18n 1.0
import org.kde.khealthcertificate 1.0

Kirigami.ScrollablePage {
    id: page
    title: "Test Certificate"

    property var rawData
    property var cert

    Kirigami.FormLayout {
        width: parent.width

        Prison.Barcode {
            barcodeType: Prison.Barcode.QRCode
            content: rawData
            Kirigami.FormData.isSection: true
        }

        Kirigami.Separator {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: "Person"
        }

        QQC2.Label {
            text: cert.name
            Kirigami.FormData.label: "Name:"
        }
        QQC2.Label {
            text: cert.dateOfBirth.toLocaleDateString(Qt.locale(), Locale.ShortFormat)
            visible: cert.dateOfBirth.getTime() != 0
            Kirigami.FormData.label: "Date of birth:"
        }

        Kirigami.Separator {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: "Test"
        }

        QQC2.Label {
            text: cert.testType
            Kirigami.FormData.label: "Type:"
        }
        QQC2.Label {
            text: cert.date.toLocaleDateString(Qt.locale(), Locale.ShortFormat)
            Kirigami.FormData.label: "Date:"
        }
        QQC2.Label {
            text: cert.disease
            Kirigami.FormData.label: "Disease:"
        }
        QQC2.Label {
            text: cert.result
            Kirigami.FormData.label: "Result:"
        }

        QQC2.Label {
            text: cert.naaTestName
            visible: cert.naaTestName.length > 0
            Kirigami.FormData.label: "NAA Test:"
        }
        QQC2.Label {
            text: cert.ratTest
            visible: cert.ratTest.length > 0
            Kirigami.FormData.label: "RAT Test:"
        }

        QQC2.Label {
            text: cert.testCenter
            Kirigami.FormData.label: "Test Center:"
        }
        QQC2.Label {
            text: KCountry.fromAlpha2(cert.country).emojiFlag + " " + KCountry.fromAlpha2(cert.country).name
            Kirigami.FormData.label: "Country:"
        }
    }
}
