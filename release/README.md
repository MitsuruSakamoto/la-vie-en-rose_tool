* 目的
  * fluct_dlvのrtblogAndNativeAdTestPageを使ってラビアンローズ環境にてnative.jsを配信テストできるようにする
  * rtblogAndNativeAdTestPageブランチはテストしたいブランチを派生させてチェリーピックで追加して運用する
* 実行方法
  * 第一引数 : 派生させたチケットブランチの名称をにする
    * 指定例 : 12345
  * 第二引数 : 広告リクエストを本番ではなくラビアンローズに向けたい時に、自分の環境のドメインを指定する
    * 指定例 : m-sakamoto.r53.fluct.me
    * 指定されたドメインで、s.sh.adingo.jpを置換する。その為、指定がない場合は置換しないのでs.sh.adingo.jp(本番環境)へ広告取得リクエストが飛ぶようになる
