#ifndef MEDIACONTROLLER_H
#define MEDIACONTROLLER_H

#include<Model/SongModel.h>
#include<Model/VideoModel.h>

class MediaController: public QObject
{
    Q_OBJECT
public:

    explicit MediaController(QObject* parent = nullptr);
    ~MediaController();

public slots:

    void processListData();

private:
    SongModel* m_songModel;
};

#endif // MEDIACONTROLLER_H
