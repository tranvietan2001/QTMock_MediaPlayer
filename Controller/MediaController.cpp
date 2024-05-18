#include "MediaController.h"

MediaController::MediaController(QObject *parent): QObject(parent)
{
    // báo bài hát đã phát hết
    connect(&m_mediaPlayer, &QMediaPlayer::mediaStatusChanged, [=](QMediaPlayer::MediaStatus status) {
        if (status == QMediaPlayer::EndOfMedia) {
            qDebug() << "Da phat xong bai nhac";
        }
    });

    // cap nhật độ dài của bài nhạc
    connect(&m_mediaPlayer, &QMediaPlayer::durationChanged, [=](qint64 duration) {
        if (m_duration != duration) {
            m_duration = duration;
            emit durationChanged();
        }
    });

    //cap nhat vị tri cua bai nhat
    connect(&m_mediaPlayer, &QMediaPlayer::positionChanged, this, &MediaController::logSongPosition);

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



QString MediaController::pathFileSongCtr() const
{
    return m_pathFileSongCtr;
}

void MediaController::setPathFileSongCtr(const QString &newPathFileSongCtr)
{
    if (m_pathFileSongCtr == newPathFileSongCtr)
        return;
    m_pathFileSongCtr = newPathFileSongCtr;

    \
        qDebug() << __FUNCTION__ << m_pathFilesSongCtr;

    if(!m_inforDataCtr.empty()){
        m_inforDataCtr.clear();
        qDebug() << "==========> clear QList dataSong" ;
    } else qDebug() << "===========> QList dataSong null" ;


    QString filePath =  m_pathFileSongCtr;
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

    m_pathMediaPlayer = filePath;
    m_titleMediaPlayer = title;
    m_artistMediaPlayer = artist;
    m_albumMediaPlayer = album;

    m_duration = durationMedia;
    m_pathCoverImage = pathSaveCoverImage; //taglib đọc ảnh và lưu lại
    qDebug() << "=======";
    emit pathFileSongCtrChanged();
}

void MediaController::logInforData()
{
    QString title = m_titleMediaPlayer;
    emit logTitleNameChanged(title);
    QString artist = m_artistMediaPlayer;
    emit logArtistNameChanged(artist);
    QString album = m_albumMediaPlayer;
    emit logAlbumNameChanged(album);
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


    QStringList pathList = m_pathFilesSongCtr.split(",", Qt::SkipEmptyParts);
    QList<QString> pathQList;
    foreach (const QString& path, pathList) {
        QString cleanedPath = path;
        cleanedPath.remove("file://");
        pathQList.append(cleanedPath);
    }

    foreach (const QString& path, pathQList) {
        QString filePath =  path;
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

        setInforDataCtr(filePath, title, artist, album, durationMedia, pathSaveCoverImage);
    }

    qDebug() << "====== Files ========";
    for(const InforMediaFile& item : m_inforDataCtr){
        qDebug() << "Title: " << item.getTitleName();
    }
    qDebug() << "====== Files ========";
    emit pathFilesSongCtrChanged();
}

QString MediaController::pathFolderSongCtr() const
{
    return m_pathFolderSongCtr;
}

void MediaController::setPathFolderSongCtr(const QString &newPathFolderSongCtr)
{
    qDebug() << __FUNCTION__ << &m_inforDataCtr;
    if (m_pathFolderSongCtr == newPathFolderSongCtr)
        return;
    m_pathFolderSongCtr = newPathFolderSongCtr;
    qDebug() << __FUNCTION__ << &m_inforDataCtr;
    if(!m_inforDataCtr.empty()){
        m_inforDataCtr.clear();
        qDebug() << "==========> clear m_inforDataCtr";
    } else qDebug() << "===========> m_inforDataCtr null";

    QDir folderDir(m_pathFolderSongCtr);
    QStringList songFiles;

    QStringList nameFilters;
    nameFilters << "*.mp3";
    folderDir.setNameFilters(nameFilters);

    // Lấy danh sách tệp tin trong thư mục
    QStringList files = folderDir.entryList();

    foreach (QString file, files) {
        // Kiểm tra phần mở rộng của tệp tin
        if (file.endsWith(".mp3", Qt::CaseInsensitive)) {
            // Đường dẫn đầy đủ của tệp tin
            QString filePath = folderDir.absoluteFilePath(file);
            QFileInfo fileInfo(filePath);
            QString fileName = fileInfo.fileName().remove(".mp3");
            QString title;
            QString artist;
            QString album;
            QString msg_default = "Unknown";
            unsigned int durationMedia;
            QString pathSaveCoverImage = "";
            songFiles.append(filePath);
            TagLib::MPEG::File file(filePath.toUtf8());
            if (!file.isValid()) {
                qWarning() << "===> Failed to open file.";
            }
            TagLib::ID3v2::Tag* tag = file.ID3v2Tag();
            if (tag) {
                title = tag->title().toCString(true);
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

            setInforDataCtr(filePath, title, artist, album, durationMedia, pathSaveCoverImage);
        }
    }

    if(songFiles.length() == 0){
        qDebug() << "Folder khong co file mp3";
        emit isCheckModelCtrEmty();
    }else

    emit pathFolderSongCtrChanged();
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

    m_indexPlay = newIndexPlay;
    const InforMediaFile& data = m_inforDataCtr.at(m_indexPlay);

    m_pathMediaPlayer = data.getFileName();
    m_titleMediaPlayer = data.getTitleName();
    m_artistMediaPlayer = data.getArtistName();
    m_albumMediaPlayer = data.getAlbumName();

    m_duration = data.getDuration();
    m_pathCoverImage = ""; //taglib đọc ảnh và lưu lại
    emit indexPlayChanged();
}

void MediaController::playMusicAtPosition(qint64 position)
{
    qDebug() << "position play: " << position;
    m_mediaPlayer.setPosition(position);
    m_mediaPlayer.setVolume(m_valVolume);
    m_mediaPlayer.play();
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

    emit valVolumeChanged();
    qDebug() << __FUNCTION__ << m_valVolume;
}



void MediaController::playSong()
{
    qDebug() << __FUNCTION__<< m_pathMediaPlayer;
    if (!m_pathMediaPlayer.isEmpty()) {
        m_mediaPlayer.setMedia(QUrl::fromLocalFile(m_pathMediaPlayer));
        m_mediaPlayer.setVolume(m_valVolume);
        m_mediaPlayer.play();
    }
}

void MediaController::pauseSong()
{
    m_mediaPlayer.pause();
    qDebug() << "PAUSE C++";

}

void MediaController::stopSong()
{
    m_mediaPlayer.stop();
    qDebug() << "STOP C++";
}

void MediaController::logSongPosition()
{
    qint64 position = m_mediaPlayer.position();
    emit positionChanged(position);
}

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
