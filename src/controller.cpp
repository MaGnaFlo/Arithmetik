#include "controller.h"

#include "qtcsv/stringdata.h"
#include "qtcsv/writer.h"
#include "qtcsv/reader.h"

const QList<int> Controller::get_random()
{
    int min1, max1, min2, max2;
    switch (_difficulty)
    {
    case 1:
        min1 = min2 = 2;
        max1 = max2 = 9;
        break;
    case 2:
        min1 = 2;
        max1 = 9;
        min2 = 11;
        max2 = 99;
        break;
    case 3:
        min1 = min2 = 11;
        max1 = max2 = 99;
        break;
    case 4:
        min1 = 2;
        max1 = 9;
        min2 = 101;
        max2 = 999;
        break;
    case 5:
        min1 = 11;
        max1 = 99;
        min2 = 101;
        max2 = 999;
        break;
    }

    std::random_device dev;
    std::mt19937 rng(dev());
    std::uniform_int_distribution<std::mt19937::result_type> dist1(min1, max1);
    std::uniform_int_distribution<std::mt19937::result_type> dist2(min2, max2);

    _numbers.clear();
    _numbers.append(dist1(rng));
    _numbers.append(dist2(rng));

    return _numbers;
}

void Controller::check_answer(const int answer, const double time)
{
    _correct.append(answer == _numbers[0] * _numbers[1]);
    _time.append(time);
}

void Controller::log() const
{
    QList<QList<QString>> strLists;
    QtCSV::StringData data;
    QList<QString> newLine;
    if (QFile::exists(_file_path))
        strLists = QtCSV::Reader::readToList(_file_path, QString(";"), QString("\""));
    else
        strLists.append(QList<QString>() << "Score"
                                         << "Time (ms)"
                                         << "Date"
                                         << "Difficulty"
                                         << "Mood"
                                         << "Motivation"
                                         << "Reaction time (ms)");

    newLine << QString::number(_score);
    newLine << QString::number(_average_time);
    newLine << QDateTime::currentDateTime().toString();
    newLine << QString::number(_difficulty);
    newLine << QString::number(_mood);
    newLine << QString::number(_motivation);
    newLine << QString::number(_reaction_time);
    strLists.append(newLine);

    for (const auto& strList: strLists)
        data.addRow(strList);
    QtCSV::Writer::write(_file_path, data, QString(";"), QString("\""));
}

void Controller::compute_result()
{
    _score = std::accumulate(_correct.begin(), _correct.end(), 0.0);
    _score *= 100 / _n_questions;
    _average_time = std::accumulate(_time.begin(), _time.end(), 0.0);
    _average_time /= _n_questions;
    _average_time -= _reaction_time;
    log();

    _numbers.clear();
    _correct.clear();
    _time.clear();
}
