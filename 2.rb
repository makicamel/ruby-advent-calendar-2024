# 複数の箱を動かす

line = <<LINE.gsub('0', ' ')
11                1111                1111                11
11  011100011100  1111  011100011110  1111  011110000111  11
1   100011000110   11   100011000111   11   100011011011   1
1   000110001100   11   000110001110   11   000110011011   1
1   011100111000   11   011100000111   11   011000011111   1
11  011110111110  1111  011111011110  1111  111111000011  11
11                1111                1111                11
LINE

print "\x1b[2J" # 画面クリア

space = 32.chr # " "
box_width = 20
box_count = 3
box_height = 7

# 描画用の変数。箱の個数分配列を作る。それぞれ日付用とパディング用のふたつの配列を持つ
boxes = Array.new(box_count) { [Array.new(box_height){''}, Array.new(box_height){''}] }
# アスキーアートを解釈した日付の配列。ここからboxesにカット&ペーストする
days = Array.new(box_count) { [] }
line.lines(chomp:true).each { |str|
  # アスキーアートを箱ごとに分けて日付用配列に詰める
  str.scan(/.{#{box_width}}/).each_with_index { |st, i| days[i] << st }
}

box_count.times { |j|
  (box_width * (box_count - j)).times{ |k|
    box_height.times { |l|
      if (k < box_width) then
        # 日付ボックスに1文字ずつ値を詰める
        boxes[-j-1][0][l].insert(-k-1, days[-j-1][l].slice!(-1, 1))
      else
        # パディングボックスに1文字ずつ空白を詰める
        boxes[-j-2][1][l] << space
      end
      # 現在のインデックスより前のパディングボックスの空白を1文字ずつ削る
      boxes[-j-1][1][l].chop!
    }

    print "\x1b[1;1H" # 1:1の位置にカーソル移動
    r = ''
    box_height.times { |m|
      box_count.times{ |n|
        r << boxes[n][0][m] << boxes[n][1][m]
      }
      r << 10 # "\n"
    }
    puts(r)
    sleep 0.01
  }
}