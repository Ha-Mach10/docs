# tsconfig.jsonの記入方法

## 目次

---

## Compiler Options

---

### Projects（プロジェクト）

* **incremental** 規定値：`true`
増分コンパイルを可能にする。
**メリット**：
前回コンパイルからの差分のみを今回コンパイルの対象とするため、コンパイル速度の向上が見込まれる。また、差分チェックのために出力先のディレクトリへ`.tsbuildinfo`ファイルが生成される。
**デメリット**：
途中、`tsconfig.json`に変更を加えた場合は前回差分だけでは最新の`tsconfig.json`の内容に準拠しない可能性がある為`.tsbuildinfo`を削除しなければいけない。
* 

### Language and Environment（言語と環境）

### Modules（モジュール）

### JavaScript Support（JavaScriptサポート）

### Emit（出力）

### Interop Constraints（相互運用製薬）

### Type Checking（型チェック）

### Completeness（完全性？）
