#include "SongModel.h"

SongModel::SongModel(QObject *parent): QAbstractListModel(parent){}

QString SongModel::pathFolder() const
{
    return m_pathFolder;
}

void SongModel::setPathFolder(const QString &newPathFolder)
{
    if(!m_inforData.empty()){
        beginResetModel();
        m_inforData.clear();
        endResetModel();
        qDebug() << "==========> clear infordata";
    } else qDebug() << "===========> inforData null";



    if (m_pathFolder == newPathFolder)
        return;
    m_pathFolder = newPathFolder;

    qDebug() << __FUNCTION__ << "====> c++" << m_pathFolder;

    QDir folderDir(m_pathFolder);
    QStringList mp3Files;

    QStringList nameFilters;
    nameFilters << "*.mp3";
    folderDir.setNameFilters(nameFilters);

    // Lấy danh sách tệp tin trong thư mục
    QStringList files = folderDir.entryList();
    qDebug() << "=============================";

    // Duyệt qua danh sách các tệp tin
    int i = 1;
    foreach (QString file, files) {
        // Kiểm tra phần mở rộng của tệp tin
        if (file.endsWith(".mp3", Qt::CaseInsensitive)) {
            // Đường dẫn đầy đủ của tệp tin
            QString filePath = folderDir.absoluteFilePath(file);
            QString pathSaveCoverImage = "";
            QString title;
            QString artist;
            QString album;
            QString msg_default = "Unknown";
            unsigned int durationMedia;

            mp3Files.append(filePath);
            qDebug() << "i: " << i << " - " <<  filePath;

            TagLib::MPEG::File file(filePath.toUtf8());
            if (!file.isValid()) {
                qWarning() << "===> Failed to open file.";
                // return;
            }
            qDebug() << pathSaveCoverImage ;
            TagLib::ID3v2::Tag* tag = file.ID3v2Tag();
            if (tag) {
                title = tag->title().toCString(true);
                artist = tag->artist().toCString(true);
                album = tag->album().toCString(true);
                if(title == "") title = msg_default;
                if(artist == "") artist = msg_default;
                if(album == "") album = msg_default;
                qDebug() << "Title:"    << title;
                qDebug() << "Artist:"   << artist;
                qDebug() << "Album:"    << album;
            } else {
                qWarning() << "No ID3v2 tag found.";
            }

            TagLib::AudioProperties* properties = file.audioProperties();
            durationMedia = properties->length();
            qDebug() << "Duration:" << durationMedia << "seconds";

            beginInsertRows(QModelIndex(), rowCount(), rowCount());
            m_inforData.append(InforMediaFile(filePath, title, artist, album, durationMedia, pathSaveCoverImage));
            endInsertRows();

            i++;
        }
    }
    if(mp3Files.length() == 0){
        qDebug() << "Folder khong co file mp3";
    }
    qDebug() << "=============================";
    qDebug() << mp3Files;
    qDebug() << "=============================";
    emit pathFolderMusdicChanged();
}



int SongModel::rowCount(const QModelIndex &parent) const
{
    if(parent.isValid())
        return 0;
    return m_inforData.length();
}

QVariant SongModel::data(const QModelIndex &index, int role) const
{
    qDebug() << m_inforData.size();
    const InforMediaFile &item = m_inforData[index.row()];
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



