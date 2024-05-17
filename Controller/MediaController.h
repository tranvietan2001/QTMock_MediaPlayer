#ifndef MEDIACONTROLLER_H
#define MEDIACONTROLLER_H

#include<Model/SongModel.h>
#include<Model/VideoModel.h>

#include <QMediaPlayer>
#include <QMediaMetaData>

class MediaController: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString pathFilesSongCtr READ pathFilesSongCtr WRITE setPathFilesSongCtr NOTIFY pathFilesSongCtrChanged)

    Q_PROPERTY(int indexPlay READ indexPlay WRITE setIndexPlay NOTIFY indexPlayChanged)
    Q_PROPERTY(int valVolume READ valVolume WRITE setValVolume NOTIFY valVolumeChanged)
    Q_PROPERTY(qint64 duration READ duration NOTIFY durationChanged)
    Q_PROPERTY(qint64 position READ position NOTIFY positionChanged)

public:

    explicit MediaController(QObject* parent = nullptr);
    ~MediaController();

    qint64 duration() const;
    qint64 position() const;
    int valVolume() const;
    Q_INVOKABLE void setValVolume(int newValVolume);


    // Nhạn path file từ qml xuống -> set để lưu vào model data
    QString pathFilesSongCtr() const;
    void setPathFilesSongCtr(const QString &newPathFilesSongCtr);


    // append thong tin file đọc được từ path thông qua taglib
    void setInforDataCtr(const QString &fileName, const QString &titleName, const QString &artistName, const QString &albumName, const int &durationM, const QString &pathCoverImage);

    // nhận được vị trí media được nhấn chọn trên list view.
    int indexPlay() const;
    void setIndexPlay(int newIndexPlay);


    // Q_INVOKABLE QString titleNameFile();
    // Q_INVOKABLE QString artistNameFile();
    // Q_INVOKABLE QString albumNameFile();

    // void playSong(QString path);






    Q_INVOKABLE void playMusicAtPosition(qint64 position);





public slots:

    void processListData();
    void playSong();

    // void sl_titleNameFile();
    // void sl_artistNameFile();
    // void sl_albumNameFile();
    // void sl_durationFile();
    // void sl_pathCoverImage();

signals:
    void pathFilesSongCtrChanged();

    void inforDataCtrChanged();

    void indexPlayChanged();

    void isCheckModelCtrEmty();

    void valVolumeChanged();

    // void titleNameChanged(QString title);
    // void artistNameChanged(QString art);
    // void albumNameChange(QString album);
    // void durationChange(int duration);
    // void pathCoverImageChanged(QString path);


    void durationChanged();


    void positionChanged(qint64 position);

private:
    SongModel* m_songModel;
    QString test = "hello";
    QString m_pathFilesSongCtr;

    QList<InforMediaFile> m_inforDataCtr;

    int m_indexPlay;

    QString m_titleMediaPlayer = "TiTle";
    QString m_artistMediaPlayer= "Artist";
    QString m_albumMediaPlayer = "Album";
    QString m_pathMediaPlayer = "";
    // int m_duration = 0;
    QString m_pathCoverImage = "";

    QMediaPlayer m_mediaPlayer;
    int m_valVolume = 100;

    qint64 m_duration;
    qint64 m_position;
};

#endif // MEDIACONTROLLER_H
