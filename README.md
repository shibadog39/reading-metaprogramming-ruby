# reading-metaprogramming-ruby

![](https://github.com/shibadog39/reading-metaprogramming-ruby/workflows/Ruby/badge.svg?branch=develop)

ようこそ！　メタプログラミングRuby第2版の読書会のためのリポジトリです！
この読書会の目的は、常に(☝ ՞ਊ ՞)☝のバッジをグリーンに保つことです！

# まずやること

1. リポジトリをfork
2. 問題を解くためのブランチを切って、今後メイン作業をそのブランチで行う
    1. masterを使わない理由は、fork元のmasterに修正のプルリクを送りたいときに、解いた問題のコミットが紛れると邪魔だからです
    2. 定期的に作業用ブランチにmasterをmergeしてください
    3. リポジトリのデフォルトブランチを、作成したものに変更してください。masterは必ず失敗するので、バッジの色が常にグレーになってしまいます。
3. バッジのURIを次のように変更します `![](https://github.com/<YOUR_NAME>/reading-metaprogramming-ruby/workflows/Ruby/badge.svg?branch=<YOUR_BRANCH_NAME>)`
4. forkしたリポジトリのGitHub Actionsを有効化します
    1. 緑色のボタンを押すだけで大丈夫なはず
5. ここまでの変更をpushします

# このリポジトリの目的

このリポジトリの目的は、バッジを常にグリーンに保ち続けることです！

バッジは、GitHub Actionsの実行結果に応じて色が変わります。このリポジトリに置かれているActionsは、すべてのテストが回ることでグリーンになる設定が書かれています。
つまりバッジをグリーンに保ち続けるには、このリポジトリをforkする人が自らテストを通過するコードを書く必要があります。読書会開催期間中は毎週追加される（予定の）テストは、メタプログラミングRuby第2版を読み進めていくことによって、クリアするためのコードが書ける力が付いていく想定のもと用意されます。

メタプログラミングRubyを読んで、バッジをグリーンに保ち続けましょう！


# テストの実行
手元でやるとき
```
bundle exec ruby -Itest test/00_setup/test_try_out.rb
```
