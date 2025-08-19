# Microsoft ExcelやGoogle SpreadsheetのA1表示における列名からの列数算出方法

## 🚀 最初に

---

`Microsoft Excel`や`Google Spreadsheet`といった表計算ソフトには**A1**表示と呼ばれる表示形式が存在する。
下記のように**A,B,C**と記載された列と**1,2,3**と記載された行からなる2次元の表である。

||A|B|C|...|
|:-:|:-:|:-:|:-:|:-:|
|1|||||
|2|||||
|3|||||

表計算において自動化は珍しくなく、勤勉な諸兄は`VBA`や`GAS`などを用いて自動化を試み、最適なソリューションを模索していると思う。
ただ、自動化において試行錯誤しているうち、壁に突き当たることがままあることだろう。
今回はその壁の一部にフォーカスを当てていきたく思う。

## ✨ 列名から列インデックスを算出したい

---

さてその課題であるが、ずばり

### 列名から列インデックスを取得したい

これに尽きる。
「なんだ、そんなの一度A1形式でRangeから取得すればいいじゃないか」と思うかもしれない。

### そんなのエレガントじゃない😭😭😭

わがままに聞こえるかもしれないが、エレガントさと汎用性、利便性を兼ね備えてこそのコードであると信じている。
実体に依存するコードは可能であれば書きたくないというのが性分だ。
ここはゆずれない。

ちなみに列名から列インデックスを取得したいというのは具体的に下記のような操作である。

ある関数 $ f(x) $　が存在したとき

\[
    f(x)
\]

その関数 $ f(x) $ は任意長のアルファベット（大文字）で構成された文字列を与えたとき任意の値を返すことができる。
下記に例を示す。

(例1)　AAA列
\[
    x:='AAA'\\
    f(x)=703\\
\]

(例2)　GXFASSEについて
\[
    x:='GXFASSE'\\
    f(x)=2450336231\\
\]

## 10進数,26進数,A1表記の比較

---

- 0-9を使った10進数
- A-Zの記号を使った26進数
- A1表記の列番号

この三つについて比較をしてみる

|10進数|26進数|A1表記|
|:-:|:-:|:-:|
|000|AAAA|----|
|001|AAAB|---A|
|002|AAAC|---B|
|003|AAAD|---C|
|...|... |... |
|025|AAAZ|---Y|
|026|AABA|---Z|
|027|AABB|--AA|
|028|AABC|--AB|
|...|... |... |

一般的なn進数では**ゼロ**[^1]に対応する記号が存在しており、10進数では`0`、26進数では`A`がその役割を担う。
対して、A1表記にはゼロに対応する記号がついていない。
上記表では代わりに`-`を使用しているが、繰り上がりの際に`-`の扱いに困ってしまう。
（※表計算ソフトでは`A`から始まっており、`A`の列インデックスの値が1であるため。ゼロにあたる記号が存在しないことによる）


## 計算式

---

上記や先の例題から、各桁のアルファベットの番数と26の桁ごとの指数乗より下記のように一般化可能である。
まず任意のアルファベット1文字を入力した際に数値を返す関数 $ f(d) $ を下記に定義する。
\[
    \begin{equation*}
        f(d)=
        \begin{cases}
            0,\hspace{5mm}d='A'\\
            1,\hspace{5mm}d='B'\\
            2,\hspace{5mm}d='C'\\
            \vdots\\
            25,\hspace{5mm}d='Z'
        \end{cases}
    \end{equation*}
\]

すると任意長のアルファベットが渡されたときの値は下記のように定義される。

\[
    \sum_{i=0}^{D_{max}} f(D[i])\cdot26^i
\]

ただし、$ D $ は26進数の数を示し、 $ D[i] $ は右からi番目の桁の文字を表している。
また $ D_{max} $ は $ D $ の最大桁の番号を表すものとする。

またA1表記にて計算を行う場合、上記式ではAのとき0乗算が行われるため、関数 $ f $ の値へ1を加算し、下記のように再定義する。

\[
    \sum_{i=0}^{D_{max}} \Big[f(D[i])+1\Big]\cdot26^i
\]

\[
    \begin{align*}
    \sum_{i=0}^{D_{max}}\Big[f(D[i])+1\Big]\cdot26^i=\Bigl(f(d_0)+1\Bigl)\cdot26^0+\Bigl(f(d_1)+1\Bigl)\cdot26^1+\dots+\Bigl(f(d_i)+1\Big)\cdot26^i
    \end{align*}
\]

## アルゴリズムの実装

---

**TypeScript** (※代表として表示)

```typescript
const a1ColumnStringToNumber = (value: string): number =>
  value
  .toUpperCase()
  .split("")
  .filter(x => /^[A-z]+$/).test(x))
  .reverse()
  .map((c, index) => (c.charCodeAt(0) - 64) * (26 ** index))
  .reduce((tmpSum, x) => tmpSum + x, 0);
```

<details><summary>JavaScript</summary>

```javascript
function a1ColumnStringToNumber(value) {
    // regex pattern.
    const VALID_PATTERN = /^[A-Za-z]+$/;

    // Error handling.
    // ------------------------------------------
    // 1. type guard.
    if (typeof value !== 'string') {
        throw new TypeError("The provided value must be a string.");
    }
    // 2. pattern match.
    if (!VALID_PATTERN.test(value)) {
        throw new Error("The specified value must contain only alphabetical characters. For example, 'A' or 'AB'.");
    }

    // split & arrange & calcurate
    return value
    .toUpperCase()
    .split("")
    .reverse()
    .map((c, index) => (c.charCodeAt(0) - 64) * (26 ** index))
    .reduce((tmpSum, x) => tmpSum + x, 0);
}
```

</details>

<details><summary>C#</summary>

```Csharp
using System;
using System.Linq;
using System.Text.RegularExpressions;

// ... other codes.

private static decimal A1ColumnStringToInt(string value)
{
    if (string.IsNullOrEmpty(value) || !Regex.IsMatch(value, "^[A-Za-z]+$"))
    {
        throw new ArgumentException("The specified value must be a non-empty string and contain only alphabetical characters. (e.g., 'A', 'AZ')", nameof(value));
    }

    return value
    .ToUpper()
    .Reverse()
    .Select((c, index) =>
    {
        // A-Zの値の計算(A=1とした場合)
        decimal decimalChar = Convert.ToDecimal(c - 64);
        // 26 ^ indexの計算.
        decimal powerdNumber = Convert.ToDecimal(Math.Pow(26, index));

        return decimalChar * powerdNumber;
    })
    .Sum();
}

// ... other codes.
```

</details>

<details><summary>VBA</summary>

```VBA
```

</details>

\[
    \mathbb{K} = \{X_1, X_2,X_3, \ldots, X_n\}となるような集合\mathbb{K}が存在した場合、 \\
    \\
    自然数の集合を\mathbb {N}として\mathbb{K} = \{(X, n) \mid 1 \leq X \leq 26, 1 \leq n \leq \mathbb{N} \} が成り立つとき \\
     \\
\]

注釈

[^1]:ここでいう**ゼロ**とは概念そのものを指す。
**位取り表記で空欄を示すための記号**としてのゼロを示す。
