<!--
コメントアウト
デザイン用絵文字サイト：https://emojidb.org/

マークダウン記法に関連するいろいろ
Qiita(コメントアウトについて): https://qiita.com/yu0819ki/items/e1e1d20cedc68706ba23
Qiita(Markdown初歩の初歩): https://qiita.com/hachihacchi/items/46ea7251f1e5675b1ecb
Qiita(Markdownチートシート): https://qiita.com/Qiita/items/c686397e4a0f4f11683d
Qiita(VSCode Markdown拡張): https://qiita.com/ryokat3/items/fe61d9234be2e147cb7f

記法：
  ＜空白スペース＞ // 下へ行くほどスペースの幅が広くなる
    &thinsp;    
    &nbsp;  // ← 半角スペースと同等
    &ensp;
    &emsp;  // ← 全角スペースと同等
-->

# 開発備忘録　🧠

---

## 目次　👇

### TODO. ✔️

※ 適当にリンク差込み。

---

## 環境設定　🛠️

### 最初にやること

&emsp; 最初に開発環境の整備を行う。</br>
&emsp; 開発に最低限必要なものは下記の通り。

> ---

* ### **Node.js**</br>

  JavaScriptを動かすための汎用ランタイム。</br>
  GoogleのV8ランタイムエンジンを搭載している。</br>
  ![](./_ico/nodejsLight.svg)</br>
  [公式サイト](https://nodejs.org/ja "Nodejs")&nbsp;|&nbsp;[ロゴリンク](https://nodejs.org/ja/about/branding "Nodejs")&nbsp;|&nbsp;[GitHub](https://github.com/nodejs/node "GitHub")

* ### **TypeScript**</br>

  JavaScriptは動的型付け言語であるため、意図しない型を許容しないように</br>
  静的型付けを行えるようにMicroSoft社が開発した言語。</br>
  デプロイ時などにJavaScriptへビルドしなければならない。</br>
  ![](./_ico/ts-logo-128.svg)</br>
  [公式サイト](https://www.typescriptlang.org/ "TypeScript")&nbsp;|&nbsp;[ロゴリンク](https://www.typescriptlang.org/branding/ "TypeScript")&nbsp;|&nbsp;[GitHub](https://github.com/microsoft/TypeScript/#readme "GitHub")

* ### **Clasp**</br>

  Googleが提供するGAS(Google App Script)をローカル環境で開発可能なようにするCLIツール。</br>
  GASをJavaScriptで開発できるようにする。</br>
  <img src="./_ico/Google_Apps_Script.svg" width="15%"/></br>
  [公式サイト](https://developers.google.com/apps-script/guides/clasp?hl=ja "Google")&nbsp;|&nbsp;[ロゴリンク](https://upload.wikimedia.org/wikipedia/commons/2/2f/Google_Apps_Script.svg "Wiki")&nbsp;|&nbsp;[GitHub](https://github.com/google/clasp "GitHub")

* ### **Visual Studio Code ( VSCode )**</br>

  MicroSoft開発の汎用テキストエディタ。「vim」や「Emacs」などの古参エディタと比肩するツール。</br>
  拡張機能を追加することで、デバッグや入力補完など様々な仕事を行ってくれる。</br>
  <img src="./_ico/Visual_Studio_Code_1.35_icon.svg" width="14%"/></br>
  [公式サイト](https://code.visualstudio.com/ "Visual Studio Code")&nbsp;|&nbsp;[ロゴリンク](https://upload.wikimedia.org/wikipedia/commons/9/9a/Visual_Studio_Code_1.35_icon.svg "Wiki")&nbsp;|&nbsp;[GitHub](https://github.com/microsoft/vscode "GitHub")

> ---

### 導入方法

* #### Node.js をインストール

  公式サイトよりインストーラをダウンロードし、インストーラを起動してインストールする。

* #### Visual Studio Codeをインストール

  公式サイトよりインストーラをダウンロードし、インストーラを起動してインストールする。

* #### TypeScriptとClaspをインストール
  
  コマンドプロンプトを起動し、下記のコマンドを実行する。

  ```cmd s.txt
  npm install -g @google/clasp
  ```

  *説明*
  
  * #### `npm`
  
    Node.jsのパッケージマネージャで、以後JavaScriptやTypeScript開発する際には欠かせない重要なキーワードとなる。
  
  * #### `install`

    `npm`のコマンド。外部から様々なパッケージを取り込むために利用する。

  * #### `-g`
  
    `install`のオプション`-g`はグローバル(Global)の頭文字から、都度インストールすることなく、そのまま利用できる。

* #### インストール後の操作

  コマンドラインの環境変数が通っていれば、コマンドプロンプトへ下記コマンドを打ち込む。

  ```cmd
  clasp login
  ```

  すると既定のブラウザが開き、Googleアカウントへのログインを要求してくるので、ログインを行いたいアカウントを選択する。

  