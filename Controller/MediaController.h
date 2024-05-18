#ifndef MEDIACONTROLLER_H
#define MEDIACONTROLLER_H

#include<Model/SongModel.h>
#include<Model/VideoModel.h>

#include <QMediaPlayer>
#include <QMediaMetaData>
#include <QFileInfo>
#include <QFile>
#include <QDir>
// #include <QSettings>

class MediaController: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString pathFileSongCtr READ pathFileSongCtr WRITE setPathFileSongCtr NOTIFY pathFileSongCtrChanged)

    Q_PROPERTY(QString pathFilesSongCtr READ pathFilesSongCtr WRITE setPathFilesSongCtr NOTIFY pathFilesSongCtrChanged)
    Q_PROPERTY(QString pathFolderSongCtr READ pathFolderSongCtr WRITE setPathFolderSongCtr NOTIFY pathFolderSongCtrChanged)


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

    // Nhạn path folder từ qml xuống -> set để đọc file *.mp3 và lưu vào model data
    QString pathFolderSongCtr() const;
    void setPathFolderSongCtr(const QString &newPathFolderSongCtr);

    // append thong tin file đọc được từ path thông qua taglib
    void setInforDataCtr(const QString &fileName, const QString &titleName, const QString &artistName, const QString &albumName, const int &durationM, const QString &pathCoverImage);

    // nhận được vị trí media được nhấn chọn trên list view.
    int indexPlay() const;
    void setIndexPlay(int newIndexPlay);


    // void playSong(QString path);
    Q_INVOKABLE void playMusicAtPosition(qint64 position);

    QString pathFileSongCtr() const;
    void setPathFileSongCtr(const QString &newPathFileSongCtr);


    // test gửi data từ c++ đến qml sử dụng signal slot không có connect
    //sử dụng q-invokable để đk 1 hàm dưới cpp có thể call dùng trên qml, có thể truyền tham số vào từ qml để hàm này được xử lý dưới c++ và pát các emit signal để trả kết quả về cho qlm
    // emit là tên signal sẽ phát ra và nhận được trên qml (có thể truyền data bằng emit signal này lên qml)
    Q_INVOKABLE void logInforData();

public slots:

    void processListData();
    void playSong();
    void pauseSong();
    void stopSong();
    void logSongPosition();

signals:
    void pathFilesSongCtrChanged();
    void pathFileSongCtrChanged();

    void inforDataCtrChanged();

    void indexPlayChanged();

    void pathFolderSongCtrChanged();

    void isCheckModelCtrEmty();

    void valVolumeChanged();

    void durationChanged();

    void positionChanged(qint64 position);

    void logTitleNameChanged(QString title);
    void logArtistNameChanged(QString artist);
    void logAlbumNameChanged(QString album);

private:

    QMediaPlayer m_mediaPlayer;
    QList<InforMediaFile> m_inforDataCtr;
    QString m_pathFileSongCtr;
    QString m_pathFilesSongCtr;
    QString m_pathFolderSongCtr;

    int m_indexPlay;


    QString m_titleMediaPlayer = "TiTle";
    QString m_artistMediaPlayer= "Artist";
    QString m_albumMediaPlayer = "Album";
    QString m_pathMediaPlayer = "";
    QString m_pathCoverImage = "";
    // int m_duration = 0;



    int m_valVolume = 50;
    qint64 m_duration = 0;
    qint64 m_position = 0;


};

#endif // MEDIACONTROLLER_H
