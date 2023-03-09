# Umu (プロトタイプ))

Umu はRuby on Rails の`rails generator`コマンドを生成するためのライブラリです。



https://user-images.githubusercontent.com/78460152/223889166-b69a6a65-f655-4b86-aae4-900d5ddd5b48.mov




# インストール方法

アプリケーションのGemfileに追加する

```ruby
group :development, :test do
    gem 'umu'
end
```
そして
```
bundle install 
```

# 使用方法
次のコマンドを実行してください。

    bundle exec umu

## Doc

#### 言語変更
```
bundle exec umu --lang
# or
bundle exec umu -l
```
#### オプションの確認
```
bundle exec umu --help
# or
bundle exec umu -h
```

# 貢献方法
バグ報告やプルリクエストは、https://github.com/chen-196-hub/umu で受け付けています。このプロジェクトは、協力のための安全で歓迎される空間であることを意図しており、貢献者は[行動規範](https://github.com/chen-196-hub/umu/blob/main/CODE_OF_CONDUCT.md)に従うことが期待されています。

# ライセンス
このgemは[MITライセンス](https://opensource.org/licenses/MIT)の下でオープンソースとして利用可能です。

# 行動規範
Umuプロジェクトのコードベース、問題トラッカー、チャットルーム、メーリングリストに参加するすべての人が、[行動規範](https://github.com/chen-196-hub/umu/blob/main/CODE_OF_CONDUCT.md)に従うことを期待しています。



