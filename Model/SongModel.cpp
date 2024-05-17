#include "SongModel.h"


SongModel::SongModel(QObject *parent):QAbstractListModel(parent)
{
    qDebug() << __FUNCTION__ << "khỏi tạo";
}

int SongModel::rowCount(const QModelIndex &parent) const
{
    if(parent.isValid())
        return 0;
    return m_inforData.length();
}

QVariant SongModel::data(const QModelIndex &index, int role) const
{
    // qDebug() << m_inforData.size();
    const InforMediaFile item = m_inforData[index.row()];
    switch(role){
    case FileNameRole:
        return item.getFileName();
    case TitleNameRole:
        return item.getTitleName();
    case ArtistNameRole:
        return item.getArtistName();
    case AlbumNameRole:
        return item.getAlbumName();
    case DurationRole:
        return item.getDuration();
    case PathCoverImageRole:
        return item.getPathCoverImage();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> SongModel::roleNames() const
{
    static QHash<int, QByteArray> hash = {
        {FileNameRole, "file"},
        {TitleNameRole, "title"},
        {ArtistNameRole, "artist"},
        {AlbumNameRole, "album"},
        {DurationRole, "duration"},
        {PathCoverImageRole, "pathCoverImage"}
    };
    return hash;
}


QString SongModel::pathFolderSong() const
{
    return m_pathFolderSong;
}

void SongModel::setPathFolderSong(const QString &newPathFolderSong)
{
    qDebug() << __FUNCTION__ << &m_inforData;
    if (m_pathFolderSong == newPathFolderSong)
        return;
    m_pathFolderSong = newPathFolderSong;
    qDebug() << __FUNCTION__ << &m_inforData;
    if(!m_inforData.empty()){
        beginResetModel();
        m_inforData.clear();
        endResetModel();
        qDebug() << "==========> clear infordata";
    } else qDebug() << "===========> inforData null";



    // qDebug() << __FUNCTION__ << "PATH FOLDER: " << m_pathFolderSong;


    QDir folderDir(m_pathFolderSong);
    QStringList songFiles;

    QStringList nameFilters;
    nameFilters << "*.mp3";
    folderDir.setNameFilters(nameFilters);

    // Lấy danh sách tệp tin trong thư mục
    QStringList files = folderDir.entryList();


    // qDebug() << "=============================";


    // Duyệt qua danh sách các tệp tin
    int i = 1;
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
                // return;
            }

            TagLib::ID3v2::Tag* tag = file.ID3v2Tag();
            if (tag) {
                title = tag->title().toCString(true);
                artist = tag->artist().toCString(true);
                album = tag->album().toCString(true);
                if(title == "") title = msg_default;
                if(artist == "") artist = msg_default;
                if(album == "") album = msg_default;
                // qDebug() << "Title:"    << title;
                // qDebug() << "Artist:"   << artist;
                // qDebug() << "Album:"    << album;
            } else {
                qWarning() << "No ID3v2 tag found.";
            }

            TagLib::AudioProperties* properties = file.audioProperties();
            durationMedia = properties->length();
            // qDebug() << "Duration:" << durationMedia << "seconds";

            beginInsertRows(QModelIndex(), rowCount(), rowCount());
            // m_inforData.append(InforMediaFile(filePath, title, artist, album, durationMedia, pathSaveCoverImage));

            setInforData(filePath, title, artist, album, durationMedia, pathSaveCoverImage);

            endInsertRows();

            qDebug() << "i: " << i << " - " <<  filePath;

            i++;
        }
    }

    if(songFiles.length() == 0){
        qDebug() << "Folder khong co file mp3";
        emit isCheckModelEmty();
    }else
        emit pathFolderSongChanged();
}


QString SongModel::pathFilesSong() const
{
    return m_pathFilesSong;
}

void SongModel::setPathFilesSong(const QString &newPathFilesSong)
{

    if (m_pathFilesSong == newPathFilesSong)
        return;
    m_pathFilesSong = newPathFilesSong;

    qDebug() << __FUNCTION__ << &m_inforData;

    if(!m_inforData.empty()){
        beginResetModel();
        m_inforData.clear();
        endResetModel();
        qDebug() << "==========> clear infordata" <<  &m_inforData;
    } else qDebug() << "===========> inforData null" <<  &m_inforData;


    // qDebug() << "PATH FILES: " << m_pathFilesSong;
    QStringList pathList = m_pathFilesSong.split(",", Qt::SkipEmptyParts);
    QList<QString> pathQList;
    foreach (const QString& path, pathList) {
        QString cleanedPath = path;
        cleanedPath.remove("file://");
        pathQList.append(cleanedPath);
    }

    foreach (const QString& path, pathQList) {
        // qDebug() << path;
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
            // return;
        }

        TagLib::ID3v2::Tag* tag = file.ID3v2Tag();
        if (tag) {
            title = tag->title().toCString(true);
            artist = tag->artist().toCString(true);
            album = tag->album().toCString(true);
            if(title == "") title = msg_default;
            if(artist == "") artist = msg_default;
            if(album == "") album = msg_default;
            // qDebug() << "Title:"    << title;
            // qDebug() << "Artist:"   << artist;
            // qDebug() << "Album:"    << album;
        } else {
            qWarning() << "No ID3v2 tag found.";
        }

        TagLib::AudioProperties* properties = file.audioProperties();
        durationMedia = properties->length();
        // qDebug() << "Duration:" << durationMedia << "seconds";

        beginInsertRows(QModelIndex(), rowCount(), rowCount());
        // m_inforData.append(InforMediaFile(filePath, title, artist, album, durationMedia, pathSaveCoverImage));
        setInforData(filePath, title, artist, album, durationMedia, pathSaveCoverImage);
        endInsertRows();

    }
    emit pathFilesSongChanged();
}


QList<InforMediaFile> SongModel::getInforData() const
{
    qDebug() << __FUNCTION__ << m_inforData.length() << "====" << &m_inforData;
    return m_inforData;
}

void SongModel::setInforData(const QString &fileName, const QString &titleName, const QString &artistName, const QString &albumName, const int &durationM, const QString &pathCoverImage)
{

    m_inforData.append(InforMediaFile(fileName, titleName, artistName, albumName, durationM, pathCoverImage));
    //	qDebug() << __FUNCTION__ << m_inforData.length() << "====" << &m_inforData;
}
