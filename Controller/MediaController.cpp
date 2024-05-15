#include "MediaController.h"

MediaController::MediaController(QObject *parent): QObject(parent)
{
    m_songModel = new SongModel;
    qDebug() << "khoi tao MediaControlller";
}

MediaController::~MediaController()
{
    delete m_songModel;
    m_songModel = nullptr;
    qDebug() << "huy MediaControlller";
}

void MediaController::processListData()
{
    qDebug() << "Processing data..." << __FUNCTION__ << m_songModel->getInforData().length();
    QList<InforMediaFile> inforData = m_songModel->getInforData();
    inforData.append(InforMediaFile("", "sss", "sss", "", 1, ""));


    qDebug() << "Processing data..." << __FUNCTION__ << inforData.length();
    // // Xử lý dữ liệu trong inforData
    // // ...

    // // In thông tin từ inforData bằng qDebug
    for (const InforMediaFile& infor : inforData) {
        qDebug() << "Title:" << infor.getArtistName();
        // ...
    }
}

