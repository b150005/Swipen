#  Swipen

## 画面遷移

- ContentView: 環境値を取得・適用するためのビュー
  - ContentTabView: コンテンツ全体のタブ遷移を行うビュー
    - DashboardView: 学習の進捗状況を表示するビュー
      - LearnView: 学習を進めるビュー(直近の内容を表示する)
    - ContentListView: タグ一覧とコンテンツ一覧を表示するビュー
      - ContentAddView: コンテンツの追加(新規タグが設定された場合はここで追加する)
      - TagListView: タグ一覧を表示するビュー
        - LearnView: 学習を進めるビュー(タグに紐づく全てのコンテンツを表示する)
      - DetailContentListView: 登録したコンテンツをリスト形式で表示するビュー
        - LearnView: 学習を進めるビュー(タグに紐づく一部のコンテンツを表示する)

## 
