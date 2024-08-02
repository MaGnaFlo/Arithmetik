#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <random>
#include <QList>
#include <thread>
#include <chrono>
#include <QDebug>
#include <QDir>
#include <QFile>
#include <QDateTime>


class Controller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int n_questions READ n_questions CONSTANT)
    Q_PROPERTY(int n_answers READ n_answers NOTIFY n_answersChanged)
    Q_PROPERTY(int score READ score NOTIFY scoreChanged)
    Q_PROPERTY(double average_time READ average_time NOTIFY average_timeChanged)
    Q_PROPERTY(double reaction_time READ reaction_time WRITE setReaction_time NOTIFY reaction_timeChanged)

public:
    Controller() {}

    // get a random numbers to multiply
    Q_INVOKABLE const QList<int> get_random();
    Q_INVOKABLE void check_answer(const int answer, const double time);
    Q_INVOKABLE void compute_result();
    // log the scores
    void log() const;

    // getters
    Q_INVOKABLE const int n_questions() const { return _n_questions; }
    Q_INVOKABLE int n_answers() const { return _correct.size(); }
    Q_INVOKABLE const int score() const { return _score; }
    Q_INVOKABLE const double average_time() const { return _average_time; }
    Q_INVOKABLE const double reaction_time() const { return _reaction_time; }

    // setters
    Q_INVOKABLE void setMood(const int &mood) { _mood = mood; }
    Q_INVOKABLE void setMotivation(const int &motivation) { _motivation = motivation; }
    Q_INVOKABLE void setDifficulty(const int &difficulty) { _difficulty = difficulty; }
    Q_INVOKABLE void setReaction_time(const double& time) { _reaction_time = time; }

private:
    QList<int> _numbers;
    QList<bool> _correct;
    QList<double> _time;

    const int _n_questions = 10;
    int _n_answers;
    double _reaction_time;

    int _mood;
    int _motivation;
    int _difficulty;

    int _score;
    double _average_time;

    const QString _file_path = "/Users/magnaflo/Documents/Projects/Programmation/Cplusplus/Arithmetik/results.csv";

signals:
    void n_answersChanged();
    void scoreChanged();
    void average_timeChanged();
    void reaction_timeChanged();

};

#endif // CONTROLLER_H
