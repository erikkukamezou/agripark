# アプリの概要 <br>
### アグリパーク<br>
プログラミングスクールの受講中に知り合いのハウス農家さんのお手伝いをしていて、 <br>
農作業に関することを管理、記録出来るツールがあればいいなと思い制作しました。 <br>
必要な事柄を数値化、グラフ化し見やすくすることによって経験からの判断だけでなく、 <br>
農業や家庭菜園などを初心者でも自分の作物の品質や収穫量を一定の基準を保つためのツールです。 <br>

# 開発言語 <br>
Ruby 2.6.5 <br>
Rails 5.2.5 <br>
psql(PostgreSQL) 13.3-1 <br>

# 就業Termの技術 <br>
・devise <br>
・Ajaxを使ったコメント機能 <br>

# カリキュラム外の技術（一部） <br>
・FullCalender <br>
gem 'jquery-rails' <br>
gem 'fullcalendar-rails' <br>
gem 'momentjs-rails' <br>
フルカレンダーの実装 <br>
一か月のサイクルをみて、日々のタスクを判断していくので、ぱっと見てわかりやすくするために、このgemを導入 <br>

・gem 'chartkick' <br>
生産管理機能、コスト管理機能に記録した数値を基にグラフ表示 <br>
いろんなグラフの種類を選べるため導入 <br>

・gem 'ransack' <br>
観察日記や日々のことを記録していくので、情報が多くなるとほしい時にすぐ表示ができないので検索できるようにするため導入 <br>


# 実行手順
```
$ git clone git@github.com:erikkukamezou/agripark.git
$ cd agripark
$ bundle install
$ rails db:create db:migrate
$ rails db:seed
$ rails s
```

# カタログ設計　<br>
https://docs.google.com/spreadsheets/d/1ME-1gXcocqcyixC3rx1pKhO4gj_QeFLSpys9BUkpzPg/edit?usp=sharing　<br>


# テーブル設計　<br>
https://docs.google.com/spreadsheets/d/1ME-1gXcocqcyixC3rx1pKhO4gj_QeFLSpys9BUkpzPg/edit?usp=sharing　<br>


# ワイヤーフレーム　<br>
https://drive.google.com/file/d/1MFA8nBl1ddbEk1WGKNoCWk8-K7k0pzX7/view?usp=sharing　<br>


# ER図　<br>
https://drive.google.com/file/d/1MFA8nBl1ddbEk1WGKNoCWk8-K7k0pzX7/view?usp=sharing　<br>

![ER図12](https://user-images.githubusercontent.com/80878956/130807961-b584a203-4177-4ec6-8113-c6416ede6961.png) <br>


# 画面遷移図　<br>
https://drive.google.com/file/d/1MFA8nBl1ddbEk1WGKNoCWk8-K7k0pzX7/view?usp=sharing　<br>

![画面遷移図3](https://user-images.githubusercontent.com/80878956/128869605-fd86b613-90a1-4af0-a2dc-cf8faceddcb5.png) <br>
