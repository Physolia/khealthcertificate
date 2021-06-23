/*
 * SPDX-FileCopyrightText: 2021 Volker Krause <vkrause@kde.org>
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

#include "ktestcertificate.h"
#include "khealthcertificatetypes_p.h"

class KTestCertificatePrivate : public QSharedData
{
public:
    QString name;
    QDate dateOfBirth;
    QDate date;
    QString disease;
    QString testType;
    QString naaTestName;
    QString ratTest;
    KTestCertificate::Result result = KTestCertificate::Unknown;
    QString resultString;
    QString testCenter;
    QString country;
};

KHEALTHCERTIFICATE_MAKE_GADGET(Test)
KHEALTHCERTIFICATE_MAKE_PROPERTY(Test, QString, name, setName)
KHEALTHCERTIFICATE_MAKE_PROPERTY(Test, QDate, dateOfBirth, setDateOfBirth)
KHEALTHCERTIFICATE_MAKE_PROPERTY(Test, QDate, date, setDate)
KHEALTHCERTIFICATE_MAKE_PROPERTY(Test, QString, disease, setDisease)
KHEALTHCERTIFICATE_MAKE_PROPERTY(Test, QString, testType, setTestType)
KHEALTHCERTIFICATE_MAKE_PROPERTY(Test, QString, naaTestName, setNaaTestName)
KHEALTHCERTIFICATE_MAKE_PROPERTY(Test, QString, ratTest, setRatTest)
KHEALTHCERTIFICATE_MAKE_PROPERTY(Test, KTestCertificate::Result, result, setResult)
KHEALTHCERTIFICATE_MAKE_PROPERTY(Test, QString, resultString, setResultString)
KHEALTHCERTIFICATE_MAKE_PROPERTY(Test, QString, testCenter, setTextCenter)
KHEALTHCERTIFICATE_MAKE_PROPERTY(Test, QString, country, setCountry)

KHealthCertificate::CertificateValidation KTestCertificate::validationState() const
{
    if (d->result == Positive) {
        return KHealthCertificate::Invalid;
    }

    if (d->date.addDays(2) < QDate::currentDate()) {
        return KHealthCertificate::Invalid;
    }
    return d->result == Negative ? KHealthCertificate::Valid : KHealthCertificate::Unknown;
}

#include "moc_ktestcertificate.moc"
