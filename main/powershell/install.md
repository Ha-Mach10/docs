<!--
 リファレンス

 Qiita：https://qiita.com/ryome/items/f2a0bc2de007da30bbfd
 （nvmのインストール方法【Node Version Manager】）

-->

# PowerShellでソフトウェアをインストールする方法

---

## 目次

---

## きっかけ

---

## 各種用語の説明

### 変数

変数は一時的に値を格納しておくための**箱**としてたとえられることが多い。
**PowerShellにおける変数**とは、`$foo`や`$bar`といった、頭に **$** マークを付け、そのすぐ後ろに任意のアルファベット、数字などをつけたものである。

```powershell
$foo = "foo"
$bar = "bar"
```

※これは関係のないことではあるが、`foo`や`bar`などは**メタ構文変数**と呼ばれる例示の際に頻繁に用いられる**意味のない文字列**である。

### 一時ファイル(TemporaryFile)

**一時ファイル**とは、その名の通り、**一時的に使用するファイル**の事であり、PowerShellを使用する際には覚えておいた方が良い概念である。
一時ファイルを使用する際は**New-TemporaryFileコマンドレット**を使用することで、`$env:TEMP`と呼ばれる環境変数へパスが格納される。

```powershell
New-TemporaryFile
$env:TEMP /// ここに一時ファイルのパスが格納されている。
```

### 進捗表示の抑制

PowerShellを使用して時間のかかる処理などをしていると、緑帯表示の上に作業進捗を示すインジケーターが表示されるが、バッチ処理などではこれらの表示が邪魔になることがある。
そこで進捗表示を抑制するために**自動変数**である **$ProgressPreference** に設定を行うことで、表示が抑制される。

```powershell
$ProgressPreference = 'SilentContinue'
```

**Preference**とある通り、基本的にこの設定はユーザーのニーズに合わせて設定されることを目的とされている。
MicrosoftのページにProgressPreference以外のPreference変数が紹介されているので、詳しく知りたい方はそちらを参照すると良いだろう。
Microsoft Learn : [about_Preference_Variables](https://learn.microsoft.com/ja-jp/powershell/module/microsoft.powershell.core/about/about_preference_variables?view=powershell-7.5)

---

## 実際にインストールしてみる

