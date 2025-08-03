# 実環境構成

---

## 目次

---

## 構成の構想

---

### ドライブ構成

* システムドライブ（OS）
* 作業用ドライブ
* バックアップドライブ（外付け）

#### 1. システムドライブ（C:）
OSを配置するドライブ。
基本的にここには余計なファイルを置かないようにしたい。

#### 2. 作業用ドライブ（D~Z:）
作業や適当なファイルを置いておくためのドライブ。
1つか2つ程度で構成したい。

#### 3. バックアップドライブ
システム・作業用それぞれ独立してバックアップがとれるように構成したい。



### 作業用ドライブ
#### 各ドライブのディレクトリ構成

```plantuml
@startuml
scale 1.6
salt
{
    {T
        +<&hard-drive>Drive1 | 💾ソフトウェア専用ドライブ（いらないかも）
        ++<&folder>manager
        +++<&folder>scoop
        +++<&folder>winget
        +++<&folder>chocoratey
        ++<&folder>self
        ++<&folder>tools

        +<&hard-drive>Drive2 | 💻作業用ドライブ
        ++<&folder>media
        +++<&folder>comic
        ++++<&file> .managerconfig.json
        +++<&folder> picture
        +++<&folder> video
        ++<&folder>document
        +++<&folder>agreement
        +++<&folder>art
        +++<&folder>catalog
        +++<&folder>development
        +++<&folder>note
        +++<&folder>paper
        +++<&folder>receipt
        +++<&folder>trpg
        ++<&folder>workspace
        +++<&folder> done
        ++++<&folder> atelier
        ++++<&folder> database
        ++++<&folder> design
        ++++<&folder> program
        ++++<&folder> studio
        +++<&folder> wip
        ++++<&folder> atelier
        ++++<&folder> database
        ++++<&folder> design
        ++++<&folder> program
        +++++<&folder>lib
        ++++<&folder> studio
        ++<&folder>data
        ++<&folder>game
    }
}
@enduml
```

</br>

### ディレクトリの説明

---

#### 第一層

##### media 🎞️

メディアファイルを管理するディレクトリ
下層の構成は下記のとおり

* **picture**：画像ファイル
* **video**：動画ファイル
* **sound**：音声ファイル
* **book**：電子書籍（PDFを含む）

##### document 📄

カタログや論文、契約書などの書類を管理するディレクトリ
下層の構成は下記のとおり

* **agreement**：契約書
* **art**：絵画等の参考資料
* **catalog**：カタログ
* **paper**：論文
* **manual**：取扱説明書・マニュアル
* **receipt**：レシート・領収書
* **trpg**：テーブルゲームとそのサプリ

##### workspace 💼

作業用のディレクトリ
下層の構成は下記の通り

* **done**：完了済みのプロジェクト
* **wip**：作業中のプロジェクト

##### data

各種データ用のディレクトリ
JsonやCSV,データベースファイルの置き場所
下層の構成は下記の通り

* **do**：

##### game

ゲームフォルダなどを格納するためのディレクトリ
下層の構成は下記の通り

* **do**：
