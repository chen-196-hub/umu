

# Umu (prototype)

Umu 是一個支援在Ruby on Rails中製作和執行`rails generator`指令的框架



https://user-images.githubusercontent.com/78460152/223889166-b69a6a65-f655-4b86-aae4-900d5ddd5b48.mov



# 安裝
透過執行以下命令安裝 gem

    $ bundle add umu

或將其加入Rails on Rails的 Gemfile 中：
```ruby
group :development, :test do
    gem 'umu'
end
```
然後執行
```
bundle install
```

# 用法
```
bundle exec umu
```

## Doc

#### 變更語言
```
bundle exec umu --lang
# or
bundle exec umu -l
```
#### 指令選項確認
```
bundle exec umu --help
# or
bundle exec umu -h
```


# 貢獻
歡迎在 https://github.com/chen-196-hub/umu 上報告錯誤和拉取請求。本專案旨在成為一個安全、友好的協作空間，期望貢獻者遵守[行為準則](https://github.com/chen-196-hub/umu/blob/main/CODE_OF_CONDUCT.md)。

# 許可證
該 gem 以 [MIT 許可證](https://opensource.org/licenses/MIT)的形式作為開放原始碼提供。

# 行為準則
在 Umu 專案的程式碼庫、問題追蹤器、聊天室和郵件列表中，所有互動都應遵守[行為準則](https://github.com/chen-196-hub/umu/blob/main/CODE_OF_CONDUCT.md)。
