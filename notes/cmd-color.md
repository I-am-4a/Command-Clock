# コマンドプロンプトで個々に色付けをする方法

忘れそうなのでメモ。  
役に立てばいいと思い残しておきます。

---
## コマンドリスト

### テンポラリファイルの生成
1. AppDataに`pushd`で移動  
```
C:\Users\Tateshiki> pushd %appdata%
C:\Users\Tateshiki\AppData\Roaming>
```
2. テンポラリファイル(ここでは`test.txt`)を作成する  
```
C:\Users\Tateshiki\AppData\Roaming> type test.txt > test.txt
C:\Users\Tateshiki\AppData\Roaming> dir
ドライブ C のボリューム ラベルがありません。
ボリューム シリアル番号は ****-**** です

C:\Users\Tateshiki\AppData\Roaming のディレクトリ

2017/12/11  16:19    <DIR>          .
2017/12/11  16:19    <DIR>          ..
                      ～省略～
2015/12/31  13:15    <DIR>          Bat To Exe Converter
2017/12/11  16:19             2,340 test.txt
2015/12/28  13:12    <DIR>          Co34571
2015/12/09  19:08    <DIR>          CravingExplorer
                      ～省略～
2017/11/09  07:24    <DIR>          yknk
```

3. エスケープ文字()と色コードを入力する  

#### Color List by hp.vector.co.jp
![Color List by hp.vector.co.jp](https://github.com/I-am-4a/Command-Clock/raw/master/notes/colorlist.png)
```
C:\Users\Tateshiki\AppData\Roaming> echo [1;36mLight Aqua[m> test.txt
C:\Users\Tateshiki\AppData\Roaming>
```
4. typeコマンドで出力する  
```
C:\Users\Tateshiki\AppData\Roaming> type test.txt
Light Aqua(実際には色付き)

C:\Users\Tateshiki\AppData\Roaming>
```
5. `popd`で戻って終了。  
```
C:\Users\Tateshiki\AppData\Roaming> popd
C:\Users\Tateshiki>
```
