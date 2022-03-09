# README

## 環境セット
- ruby 3.1.1
- rails 7.0.2.2
- docker
- mysql 8.0
## 環境構築
- イメージのビルド
```
docker-compose build
```
- コンテナ起動
```
docker-compose up
```
- db(mysql)の作成とテストデータ投入
```
docker-compose run --rm app rails db:setup
```
- ブラウザを確認する(以下のようなログイン画面が表示されたらOK！)
```
http://localhost:3000
```
![picture 1](images/652398abbeae3f1f0ca51eb31ae217aebdb4f9be9e8dc2de80c205c8954a1ec1.png)


## 開発コマンド
