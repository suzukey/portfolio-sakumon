# SakuMon

ユーザー投稿型問題集サービスです。

就職活動用のポートフォリオとして作成しました。

## デモ

**リンク**  
https://portfolio.sakumon.me

> **テストユーザーログイン**  
> ログインページからかんたんログインボタンを押してください

**手元で動かす(docker-compose)**

```
make test-run
```

**手元で動かす(skaffold)**

```
docker-compose run --rm backend rake db:setup
make skaffold-dev
```

## 使用技術

**バックエンド**

- Ruby
  - Ruby on Rails

**フロントエンド**

- Node.js
  - Nuxt.js

**サーバー周り**

- docker
  - docker-compose
- kubernetes
  - ingress
  - skaffold
  - minikube

**クラウド**

- AWS
  - EC2
  - CloudFront
  - Route53

## アピールポイント

- AWS CloudFront を通すことで常時 TLS 接続を行っている点
- Kubernetes, Skaffold を使用し、スムーズな開発環境を整備している点
- フロントエンドに Nuxt.js を使用し、SSR(サーバーサイドレンダリング)で配信している点
- 実際に友人に使ってもらい、フィードバックを受けながら開発している点

## 今後の展望

- 今は EC2 上の minikube から配信しているが、kubeadm などを使用して Kubernetes クラスターを作成し、Kubernetes に対する理解を深める。
- フロントエンド、バックエンドのテストを導入していきたい。
- CI/CD パイプラインなどを導入していきたい。
