# ひとつの箱を動かす

line = <<LINE.gsub('0', ' ') # 箱がみっつならんだアスキーアート
11                1111                1111                11
11  011100011100  1111  011100011110  1111  011110000111  11
1   100011000110   11   100011000111   11   100011011011   1
1   000110001100   11   000110001110   11   000110011011   1
1   011100111000   11   011100000111   11   011000011111   1
11  011110111110  1111  011111011110  1111  111111000011  11
11                1111                1111                11
LINE

print "\x1b[2J"   # 画面クリア

box = "" # 最終的にputsする文字列を詰める箱を準備する
space = 32.chr # " "
box_width = 20
box_count = 3
line.lines(chomp: true).each { |str|
  box << str.slice!(-box_width, box_width) # 最後の日だけをboxに詰める
  box << 10 # 1行ごとに改行をつけ足す
}
(box_width * box_count).times {
  print "\x1b[1;1H"                    # 左上にカーソルを移動
  puts box.gsub!(/^(.)/){ space + _1 } # 行頭に空白を詰める
  sleep 0.01
}

