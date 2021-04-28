# このアプリケーションについて
## 画面設計
![](curriculum_doc/images/screenshot1.png)
![](curriculum_doc/images/screenshot2.png)
![](curriculum_doc/images/screenshot3.png)
![](curriculum_doc/images/screenshot4.png)
![](curriculum_doc/images/screenshot5.png)
![](curriculum_doc/images/screenshot6.png)
![](curriculum_doc/images/screenshot7.png)
![](curriculum_doc/images/screenshot8.png)
Googleドライブより

https://drive.google.com/file/d/1vYhzFwIWhX5mseK_ycKz6x7JzyQhElJJ/view?usp=sharing
## モデル図
![](curriculum_doc/images/IMG_0004.JPG)

## デプロイ方法
アクセスは[こちら(todo-list)](https://todolist-curriculum.herokuapp.com/)

### 準備
 - heroku.ymlを追加
 - Dockerfileに`CMD`を追記
 - herokuのsettingから環境変数を設定
   - railのシークレットキーを定義
   - `RAILS_SERVE_STATIC_FILES`を`true`となるように設定
   - `RAILS_LOG_TO_STDOUT`を`true`に設定しておくとherokuのログが詳細になるため設定しておくべき。

### 手順
 - `git add .`
 - `git commit -m "適当なコミットメッセージを入力"`
 - `git push heroku master`(マスターブランチではないブランチをプッシュする場合は`git push heroku <ブランチ名>:main`)
