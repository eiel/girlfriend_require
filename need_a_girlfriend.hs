import Control.Monad.Writer

main = mapM_ putStr $ snd . runWriter $ do
  h1 "彼女募集"
  background
  proviso
  merit
  profile
  present_oneself
  contact
  reference

-- section
background = do
  h2 "彼女募集の背景"
  p "もうすぐ30歳になるしとかそういうのもあるけど、それをさておいて、自分ならこういう風に書くよ。と思ったので、書いたに過ぎない。あ、でも、素敵な人に出会う努力はしていきたい。"

proviso = do
  h2 "パートナーの条件"
  li ["たばこを吸わない人"]

merit = do
  h2 "私と一緒にいるメリット"
  li ["めったにわがまま言わない。わがままを言われるのもほどほどなら好き。",
      "割と即興で前向きに聞こえる発言をする",
      "考えてることの半分ぐらいが Twitter に垂れ流し状態",
      "旅客鉄道株式会社旅客運賃減額に「第1種」なので、バス、JRが半額なので交通費が安く済む",
      "映画館、美術館などの入場料が割引になる"]

profile = do
  h2 "eiel のプロフィール"
  li . map profile' $
    [("生年月日","1984年2月24日"),
     ("性別","男"),
     ("身長","167cm"),
     ("体重","60-62kg"),
     ("性格","マイペース 能天気 真面目"),
     ("職業", "たぶん、プログラマ。フリーランスっぽい無職。ぼっちに生きるならこのまま。状況によっては就職も考えたい。"),
     ("居住地", "広島市。ぼっちに生きるなら離れるつもりはないけど、状況によってはどっか行くかもしれない。"),
     ("言語", "メイン Ruby。Haskellに興味あり。"),
     ("OS", "Mac OS X, Debian GNU/Linux, Gentoo Linux"),
     ("マシン", "MacBook Pro Retina, Mid 2012"),
     ("ゲーム", "Beatmania IIDX SP 8段 DP 7段, jubeat ☆10は全部クリアできる程度"),
     ("たばこ","吸うと医者に怒られるし、吸ったこともない"),
     ("お酒","飲んでも医者には怒られないっぽいけど、基本的に飲まない。"),
     ("好きな音楽", "Syroup 16g 「(I'm not) by you」 とか 「ハミングバード」あたりが好き。高橋優 「花のように」 とか 「駱駝」が好き。Ryu☆ HAPPY HARD CORE な曲が好き"),
     ("趣味", "ゲーム、コンピュータ、アニメ除いたらあんまりないけど、変わったものとか新しいものが好き。アニメは見れそうなものはだいたい見たい。放送中のものでは「凪のあすから」が好き。")
     ]

    where profile' (key, value) = key ++ ": " ++ value

present_oneself = do
  h2 "自己PR"
  p "2009年7月に[拡張型心筋症](http://www.nanbyou.or.jp/entry/155)と診断されて身体障害者手帳 3級持ちです。心臓のポンプ機能が常人の半分ぐらいらしく、疲れやすいらしいです。とはいえ、外で活動できるし、症状悪化は今のところなくて、そもそも症状も比較的軽いです。そういう特殊性を生かしていろいろ活動したいと、考えてます。発症してからのほうが前向きに生きていて、やりたいと思うことをやろうということで、[Hiroshima.rb](http://hiroshimarb.github.io/)や[すごい広島](http://great-h.github.io/)をはじめるような行動力を身につけたようです。ほっといたいらダメになりそうなものを見ると行動力を発揮するらしいです。二人で一緒にいるからこそお互いの能力をより発揮できるような関係が作れたらいいのに、なんて幻想を抱いている。口だけにならないように努力したい。"

contact = do
  h2 "連絡先"
  p "条件を満たすとかそんなに気にしなくて良いと思う。会ってみたいとか、試しに一緒に過ごして思えば、好きな方法で連絡してみてください。写真とかぐぐればちらほら出てしまいます。たぶん。"
  p "[Twitter](https://twitter.com/eielh) [gmail](mailto: eiel.hal@gmail.com)"
  p "このREADME.mdはHaskellで生成してみてます。 詳しくは source ブランチを。"

reference = do
  h2 "参考"
  li ["[minamiyama1994/girlfriend_require](https://github.com/minamiyama1994/girlfriend_require)",
      "[norinori2222/boyfriend_require](https://github.com/norinori2222/boyfriend_require)"]

-- base api
tell' :: [String] -> Writer [String] ()
tell' strs = tell strs >> tell ["\n"]

h1 :: String -> Writer [String] ()
h1 str = tell' ["# ", str, "\n"]

h2 :: String -> Writer [String] ()
h2 str = tell' ["## ", str, "\n"]

p :: String -> Writer [String] ()
p str = tell' [str, "\n"]

li :: [String] -> Writer [String] ()
li strs = do
  forM_ strs $ \str -> tell ["* ", str, "\n"]
  tell ["\n"]
