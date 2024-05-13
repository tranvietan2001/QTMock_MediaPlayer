#ifndef INFORMEDIAFILE_H
#define INFORMEDIAFILE_H

#include<QString>

class InforMediaFile
{
public:
    InforMediaFile(QString fileName, QString titleName, QString artistName, QString albumName, unsigned int duration, QString pathCoverImage);

    QString getFileName() const;
    void setFileName(const QString &newFileName);

    QString getTitleName() const;
    void setTitleName(const QString &newTitleName);

    QString getArtistName() const;
    void setArtistName(const QString &newArtistName);

    QString getAlbumName() const;
    void setAlbumName(const QString &newAlbumName);

    unsigned int getDuration() const;
    void setDuration(const unsigned int &newDuration);

    QString getPathCoverImage() const;
    void setPathCoverImage(const QString &newPathCoverImage);

private:
    QString m_fileName;
    QString m_titleName;
    QString m_artistName;
    QString m_albumName;
    unsigned int m_duration;
    QString m_pathCoverImage;
};


#endif // INFORMEDIAFILE_H
