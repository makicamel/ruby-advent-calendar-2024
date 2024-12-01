# 複数列動くようにする

all = <<ALL.gsub('0', ' ') # 25 日分箱が並んだアスキーアート
11                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                11
11  00000xxx0000  1111  00xxxxxxx000  1111  0000xxxxx000  1111  0000xxxxx000  1111  000xxxxxxx00  1111  00000xxx0000  1111  00xxxxxxxxx0  1111  000xxxxxx000  1111  000xxxxxx000  1111  0xxx00xxxxx0  1111  00xxx00xxx00  1111  0xxx00xxxxx0  1111  0xxx00xxxxx0  1111  0xxx000xxxx0  1111  0xxx0xxxxxx0  1111  0xxx000xxx00  1111  0xxx0xxxxxx0  1111  0xxx00xxxxx0  1111  0xxx00xxxxx0  1111  0xxxx000xxx0  1111  00xxxx00xxx0  1111  0xxx000xxx00  1111  0xxx000xxxx0  1111  0xxxx0000xxx  1111  0xxxx00xxxxx  11
1   000xxxxx0000   11   0xxx00xxxx00   11   000x000xxx00   11   00xx00xxx000   11   000xxx000000   11   000xxx000000   11   000x0000xxx0   11   00xx000xxx00   11   00xx000xxx00   11   0xxx0xx000xx   11   00xxx00xxx00   11   0xxx0x000xxx   11   0xxx0x000xxx   11   0xxx0xx00xx0   11   0xxx0xxx0000   11   0xxx00xx0000   11   0xxx0x00xxx0   11   0xxx0xx00xxx   11   0xxx0xx00xxx   11   x000xx0xx0xx   11   0x000xx0xxx0   11   x000xx000xx0   11   x000xx000xxx   11   x000xx0xx0xx   11   x000xx0xxx00   1
1   00xx0xxx0000   11   00000xxxx000   11   000000xxx000   11   0xxx00xxx000   11   000xxxxxx000   11   00xxxxxxx000   11   0000000xx000   11   00xxxxxxxx00   11   000xxxxxxx00   11   0xxx0xx000xx   11   00xxx00xxx00   11   0xxx0000xxx0   11   0xxx0000xxx0   11   0xxx0xx00xx0   11   0xxx0xxxxx00   11   0xxx0xxxxxx0   11   0xxx000xx000   11   0xxx0xxxxxxx   11   0xxx00xxxxxx   11   000xx00xx0xx   11   0000xx00xxx0   11   000xx000xx00   11   000xx000xxx0   11   000xx00xx0xx   11   000xx00xxxx0   1
1   00000xxx0000   11   000xxx000000   11   000x000xxx00   11   0xxxxxxxxxx0   11   00000000xxx0   11   00xx000xxx00   11   00000xxx0000   11   00xx000xxx00   11   0000000xx000   11   0xxx0xx000xx   11   00xxx00xxx00   11   0xxx00xxx000   11   0xxx0x000xxx   11   0xxx0xxxxxx0   11   0xxx0000xxx0   11   0xxx0xx00xxx   11   0xxx00xx0000   11   0xxx0xx00xxx   11   0xxx0000xxx0   11   0xx0000xx0xx   11   00xx0000xxx0   11   0xxx00xxx000   11   0xxx00000xxx   11   0xx0000xxxxx   11   0xx0000000xx   1
11  00000xxx0000  1111  0xxxxxxxxx00  1111  0000xxxxx000  1111  000000xxx000  1111  000xxxxxx000  1111  000xxxxxx000  1111  00000xxx0000  1111  000xxxxxx000  1111  00000xxx0000  1111  0xxx00xxxxx0  1111  00xxx00xxx00  1111  0xxx0xxxxxxx  1111  0xxx00xxxxx0  1111  0xxx00000xx0  1111  0xxx0xxxxx00  1111  0xxx00xxxxx0  1111  0xxx00xx0000  1111  0xxx00xxxxx0  1111  0xxx00xxx000  1111  xxxxxx00xxx0  1111  0xxxxxx0xxx0  1111  xxxxx0xxxxx0  1111  xxxxxx0xxxx0  1111  xxxxxx0000xx  1111  xxxxxx0xxxx0  11
11                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                11
ALL

print "\x1b[2J" # 画面クリア

space = 32.chr # " "
box_height = 7
box_width = 20
box_count = 5
hr = '1' * box_width * box_count # 区切り線
threads = []
all = all.lines(chomp:true)
all_days = (1..25).map{ all.map { _1.slice!(0, box_width) } }

6.times { |i| puts("\x1b[#{(box_height + 1) * i + 1};1H#{hr}")} # 各行の区切り線。箱と一緒に描画すると遅延するので先に描画する

all_days.each_slice(box_count).with_index { |five_days, i|
  threads << Thread.new(five_days, i) { |days, ti|
    sleep(0.1 * rand(9)) # 開始をランダムにずらす
    boxes = Array.new(box_count) { [Array.new(box_height) { "" }, Array.new(box_height) { "" } ] }
    box_count.times { |j|
      (box_width * (box_count - j)).times { |k|
        box_height.times { |l|
          if(k < box_width)then
            boxes[-j-1][0][l].insert(-k-1, days[-j-1][l].slice!(-1, 1))
          else
            boxes[-j-2][1][l] << space
          end
          boxes[-j-1][1][l].chop!
        }

        print("\x1b[#{ti * (box_height + 1) +1};1H") # カーソル位置移動
        r = "\n"
        box_height.times { |m|
          box_count.times { |n|
            r << boxes[n][0][m] << boxes[n][1][m]
          }
          r << 10 # "\n"
        }
        puts(r)
        sleep(0.001 * rand(9))
      }
    }
  }
}
threads.each(&:join)

puts("\x1b[#{5 * (box_height + 1) + 1};1H") # カーソルをカレンダー下に移動する
