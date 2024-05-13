#include "InforMediaFile.h"

// InforMediaFile::InforMediaFile() {}

InforMediaFile::InforMediaFile(QString fileName, QString titleName, QString artistName, QString albumName, unsigned int duration, QString pathCoverImage)
{
    m_fileName = fileName;
    m_titleName = titleName;
    m_artistName = artistName;
    m_albumName = albumName;
    m_duration = duration;
    m_pathCoverImage = pathCoverImage;
}

QString InforMediaFile::getFileName() const
{
    return m_fileName;
}

void InforMediaFile::setTitleName(const QString &newTitleName)
{
    m_fileName = newTitleName;
}

QString InforMediaFile::getArtistName() const
{
    return m_artistName;
}

void InforMediaFile::setArtistName(const QString &newArtistName)
{
    m_artistName = newArtistName;
}

QString InforMediaFile::getAlbumName() const
{
    return m_albumName;
}

void InforMediaFile::setAlbumName(const QString &newAlbumName)
{
    m_albumName = newAlbumName;
}

unsigned int InforMediaFile::getDuration() const
{
    return m_duration;
}

void InforMediaFile::setDuration(const unsigned int &newDuration)
{
    m_duration = newDuration;
}

QString InforMediaFile::getPathCoverImage() const
{
    return m_pathCoverImage;
}

void InforMediaFile::setPathCoverImage(const QString &newPathCoverImage)
{
    m_pathCoverImage = newPathCoverImage;
}
