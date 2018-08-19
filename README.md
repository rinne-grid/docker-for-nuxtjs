## docker-for-nuxtjs

### これは何

* Nuxt.jsアプリの開発環境です。Docker上にyarnや@vue/cli等がインストールされます
* Docker上でvue init nuxt-community/starter-templateがすぐに使えます

* ※Docker for WindowsやDocker Toolboxの場合、仮想マシン（docker-machine）を管理者権限で起動する必要があります

### 利用方法

#### Nuxtプロジェクト作成

``` bash
# --- hostで実行 ---
$ git clone https://github.com/rinne-grid/docker-for-nuxtjs docker-for-nuxtjs
$ cd ./docker-for-nuxtjs
$ mkdir sample-project
$ docker-compose up -d
$ docker-compose exec dev bash
# --- Docker上で実行 ---
$ cd sample-project
$ vue init nuxt-community/starter-template .
$ yarn install
```

#### Dockerゲストのアプリに接続できるようにする

* package.jsonの修正(25行目付近に追加)

```json
  "config": {
    "nuxt": {
      "host": "0.0.0.0",
      "port": "3000"
    }
  }
```

#### ホットリロード対応

* nuxt.conf.jsの修正(37行目付近に追加)

```js
  watchers: {
    webpack: {
      poll: true
    }
  }
```

#### サーバー起動

```bash
$ yarn run dev
# Terminalに、「OPEN  http://localhost:3000」が出力されるまで待つ必要があります
```

#### Dockerコンテナを停止する

```bash
# --- hostで実行 ---
$ docker-compose down
```

#### 開発を再開する

```bash
# --- hostで実行 ---
$ docke-compose up -d
$ docker-compose exec dev bash
# --- Docker上で実行 ---
$ cd project
$ yarn run dev
```

### よくある問題

#### Step13/25: RUN bash remi.shでエラーになる

* dev/remi.shやdev/direnv.shの改行コードがCRLFになっている可能性があるので、LFを指定してください

