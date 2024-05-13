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
    Q_PROPERTY(QString pathFolder READ pathFolder WRITE setPathFolder NOTIFY pathFolderMusdicChanged FINAL);

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

    QString pathFolder() const;
    void setPathFolder(const QString &newPathFolder);


    virtual int rowCount(const QModelIndex &parent = QModelIndex()) const;
    virtual QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const ;
    virtual QHash<int,QByteArray> roleNames() const;


signals:
    void pathFolderMusdicChanged();

private:
    QList<InforMediaFile> m_inforData;
    QString m_pathFolder;
};

#endif // SONGMODEL_H
