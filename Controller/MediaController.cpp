#include "MediaController.h"

MediaController::MediaController(QObject *parent): QObject(parent)
{
    // cap nhật độ dài của bài nhạc
    connect(&m_mediaPlayer, &QMediaPlayer::durationChanged, [=](qint64 duration) {
        if (m_duration != duration) {
            m_duration = duration;
            emit durationChanged();
        }
    });

    qDebug() << "khoi tao MediaControlller";
}

MediaController::~MediaController()
{

    qDebug() << "huy MediaControlller";
}

void MediaController::processListData()
{
    qDebug() << "Processing data..." << __FUNCTION__ ;
    qDebug() << "=============================" ;
}


QString MediaController::pathFilesSongCtr() const
{
    return m_pathFilesSongCtr;
}

void MediaController::setPathFilesSongCtr(const QString &newPathFilesSongCtr)
{
    if (m_pathFilesSongCtr == newPathFilesSongCtr)
        return;
    m_pathFilesSongCtr = newPathFilesSongCtr;
    \
        qDebug() << __FUNCTION__ << m_pathFilesSongCtr;

    if(!m_inforDataCtr.empty()){
        m_inforDataCtr.clear();
        qDebug() << "==========> clear QList dataSong" ;
    } else qDebug() << "===========> QList dataSong null" ;


    QString filePath =  m_pathFilesSongCtr;
    QFileInfo fileInfo(filePath);
    QString title;
    QString artist;
    QString album;
    QString msg_default = "Unknown";
    unsigned int durationMedia;
    QString pathSaveCoverImage = "";

    TagLib::MPEG::File file(filePath.toUtf8());
    if (!file.isValid()) {
        qWarning() << "===> Failed to open file.";
    }

    TagLib::ID3v2::Tag* tag = file.ID3v2Tag();
    if (tag) {
        title = tag->title().toCString(true) ;
        artist = tag->artist().toCString(true);
        album = tag->album().toCString(true);
        if(title == "") title = msg_default;
        if(artist == "") artist = msg_default;
        if(album == "") album = msg_default;
    } else {
        qWarning() << "No ID3v2 tag found.";
    }

    TagLib::AudioProperties* properties = file.audioProperties();
    durationMedia = properties->length();

    // setInforDataCtr(filePath, title, artist, album, durationMedia, pathSaveCoverImage);

    qDebug() << "====== Files ========";

    // const InforMediaFile& data = m_inforDataCtr.at(0);
    // qDebug() << __FUNCTION__ << m_indexPlay;


    m_pathMediaPlayer = filePath;
    m_titleMediaPlayer = title;
    m_artistMediaPlayer = artist;
    m_albumMediaPlayer = album;

    m_duration = durationMedia;
    m_pathCoverImage = pathSaveCoverImage; //taglib đọc ảnh và lưu lại

    // qDebug() << m_pathMediaPlayer<< "---" << m_valVolume << +"======" << m_duration;

    // playSong(m_pathMediaPlayer);

    // setTitleNameFile(data.getTitleName());
    // setArtistameFile(data.getArtistName());
    // setAlbumNameFile(data.getAlbumName());

    // qDebug() << m_titleMediaPlayer;
    qDebug() << "=======";
}


void MediaController::setInforDataCtr(const QString &fileName, const QString &titleName, const QString &artistName, const QString &albumName, const int &durationM, const QString &pathCoverImage)
{
    m_inforDataCtr.append(InforMediaFile(fileName, titleName, artistName, albumName, durationM, pathCoverImage));
}

int MediaController::indexPlay() const
{
    return m_indexPlay;
}

void MediaController::setIndexPlay(int newIndexPlay)
{
    // if (m_indexPlay == newIndexPlay)
    //     return;
    m_indexPlay = newIndexPlay;
    qDebug() << "=======";
    const InforMediaFile& data = m_inforDataCtr.at(m_indexPlay);
    qDebug() << __FUNCTION__ << m_indexPlay;


    m_pathMediaPlayer = data.getFileName();
    m_titleMediaPlayer = data.getTitleName();
    m_artistMediaPlayer = data.getArtistName();
    m_albumMediaPlayer = data.getAlbumName();

    m_duration = data.getDuration();
    m_pathCoverImage = ""; //taglib đọc ảnh và lưu lại

    // qDebug() << m_pathMediaPlayer<< "---" << m_valVolume << +"======" << m_duration;

    // playSong(m_pathMediaPlayer);

    // setTitleNameFile(data.getTitleName());
    // setArtistameFile(data.getArtistName());
    // setAlbumNameFile(data.getAlbumName());

    // qDebug() << m_titleMediaPlayer;
    qDebug() << "=======";
    emit indexPlayChanged();
}


int MediaController::valVolume() const
{
    return m_valVolume;
}

void MediaController::setValVolume(int newValVolume)
{
    if (m_valVolume == newValVolume)
        return;
    m_valVolume = newValVolume;
    qDebug() << __FUNCTION__ << m_valVolume;
    emit valVolumeChanged();
}

void MediaController::playMusicAtPosition(qint64 position)
{
    qDebug() << "position play: " << position;
    m_mediaPlayer.setPosition(position);
    m_mediaPlayer.setVolume(m_valVolume);
    m_mediaPlayer.play();
}

void MediaController::playSong()
{
    qDebug() << __FUNCTION__<< m_pathMediaPlayer << m_valVolume;
    if (!m_pathMediaPlayer.isEmpty()) {
        m_mediaPlayer.setMedia(QUrl::fromLocalFile(m_pathMediaPlayer));
        m_mediaPlayer.setVolume(m_valVolume);
        m_mediaPlayer.play();
    }
}

// void MediaController::sl_titleNameFile()
// {
//     emit titleNameChanged(m_titleMediaPlayer);
// }

// void MediaController::sl_artistNameFile()
// {
//     emit artistNameChanged(m_artistMediaPlayer);
// }

// void MediaController::sl_albumNameFile()
// {
//     emit albumNameChange(m_albumMediaPlayer);
// }

// void MediaController::sl_durationFile()
// {
//     emit durationChange(m_duration);
// }

// void MediaController::sl_pathCoverImage()
// {
//     emit pathCoverImageChanged(m_pathCoverImage);
// }



// void MediaController::playSong(QString path)
// {
//     if (!path.isEmpty()) {
//         m_mediaPlayer.setMedia(QUrl::fromLocalFile(path));
//         m_mediaPlayer.setVolume(m_valVolume);
//         m_mediaPlayer.play();
//     }
// }

qint64 MediaController::duration() const
{
    qDebug() << __FUNCTION__ << m_duration;
    return m_duration;
}

qint64 MediaController::position() const
{
    return m_position;
}
