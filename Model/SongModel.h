#ifndef SONGMODEL_H
#define SONGMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QDebug>
#include <QString>
#include <QDir>
#include <taglib/taglib.h>
#include <taglib/fileref.h>
#include <taglib/mpegfile.h>
#include <taglib/id3v2tag.h>
#include <taglib/attachedpictureframe.h>
#include "View/InforMediaFile.h"

class SongModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QString pathFolderSong READ pathFolderSong WRITE setPathFolderSong NOTIFY pathFolderSongChanged FINAL)
    Q_PROPERTY(QString pathFilesSong READ pathFilesSong WRITE setPathFilesSong NOTIFY pathFilesSongChanged FINAL)

public:
    enum Role{
        FileNameRole = Qt::UserRole +1,
        TitleNameRole,
        ArtistNameRole,
        AlbumNameRole,
        DurationRole,
        PathCoverImageRole
        // CoverImage
    };

    SongModel(QObject *parent = nullptr);
    virtual int rowCount(const QModelIndex &parent = QModelIndex()) const;
    virtual QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const ;
    virtual QHash<int,QByteArray> roleNames() const;



    QString pathFolderSong() const;
    void setPathFolderSong(const QString &newPathFolderSong);

    QString pathFilesSong() const;
    void setPathFilesSong(const QString &newPathFilesSong);

signals:
    void pathFolderSongChanged();

    void pathFilesSongChanged();

private:
    QList<InforMediaFile> m_inforData;
    QString m_pathFolderSong;
    QString m_pathFilesSong;
};

#endif // SONGMODEL_H
