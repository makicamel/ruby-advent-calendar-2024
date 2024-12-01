# 効果を加える

all=<<ALL
11                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                11
11  00000xxx0000  1111  00xxxxxxx000  1111  0000xxxxx000  1111  0000xxxxx000  1111  000xxxxxxx00  1111  00000xxx0000  1111  00xxxxxxxxx0  1111  000xxxxxx000  1111  000xxxxxx000  1111  0xxx00xxxxx0  1111  00xxx00xxx00  1111  0xxx00xxxxx0  1111  0xxx00xxxxx0  1111  0xxx000xxxx0  1111  0xxx0xxxxxx0  1111  0xxx000xxx00  1111  0xxx0xxxxxx0  1111  0xxx00xxxxx0  1111  0xxx00xxxxx0  1111  0xxxx000xxx0  1111  00xxxx00xxx0  1111  0xxx000xxx00  1111  0xxx000xxxx0  1111  0xxxx0000xxx  1111  0xxxx00xxxxx  11
1   000xxxxx0000   11   0xxx00xxxx00   11   000x000xxx00   11   00xx00xxx000   11   000xxx000000   11   000xxx000000   11   000x0000xxx0   11   00xx000xxx00   11   00xx000xxx00   11   0xxx0xx000xx   11   00xxx00xxx00   11   0xxx0x000xxx   11   0xxx0x000xxx   11   0xxx0xx00xx0   11   0xxx0xxx0000   11   0xxx00xx0000   11   0xxx0x00xxx0   11   0xxx0xx00xxx   11   0xxx0xx00xxx   11   x000xx0xx0xx   11   0x000xx0xxx0   11   x000xx000xx0   11   x000xx000xxx   11   x000xx0xx0xx   11   x000xx0xxx00   1
1   00xx0xxx0000   11   00000xxxx000   11   000000xxx000   11   0xxx00xxx000   11   000xxxxxx000   11   00xxxxxxx000   11   0000000xx000   11   00xxxxxxxx00   11   000xxxxxxx00   11   0xxx0xx000xx   11   00xxx00xxx00   11   0xxx0000xxx0   11   0xxx0000xxx0   11   0xxx0xx00xx0   11   0xxx0xxxxx00   11   0xxx0xxxxxx0   11   0xxx000xx000   11   0xxx0xxxxxxx   11   0xxx00xxxxxx   11   000xx00xx0xx   11   0000xx00xxx0   11   000xx000xx00   11   000xx000xxx0   11   000xx00xx0xx   11   000xx00xxxx0   1
1   00000xxx0000   11   000xxx000000   11   000x000xxx00   11   0xxxxxxxxxx0   11   00000000xxx0   11   00xx000xxx00   11   00000xxx0000   11   00xx000xxx00   11   0000000xx000   11   0xxx0xx000xx   11   00xxx00xxx00   11   0xxx00xxx000   11   0xxx0x000xxx   11   0xxx0xxxxxx0   11   0xxx0000xxx0   11   0xxx0xx00xxx   11   0xxx00xx0000   11   0xxx0xx00xxx   11   0xxx0000xxx0   11   0xx0000xx0xx   11   00xx0000xxx0   11   0xxx00xxx000   11   0xxx00000xxx   11   0xx0000xxxxx   11   0xx0000000xx   1
11  00000xxx0000  1111  0xxxxxxxxx00  1111  0000xxxxx000  1111  000000xxx000  1111  000xxxxxx000  1111  000xxxxxx000  1111  00000xxx0000  1111  000xxxxxx000  1111  00000xxx0000  1111  0xxx00xxxxx0  1111  00xxx00xxx00  1111  0xxx0xxxxxxx  1111  0xxx00xxxxx0  1111  0xxx00000xx0  1111  0xxx0xxxxx00  1111  0xxx00xxxxx0  1111  0xxx00xx0000  1111  0xxx00xxxxx0  1111  0xxx00xxx000  1111  xxxxxx00xxx0  1111  0xxxxxx0xxx0  1111  xxxxx0xxxxx0  1111  xxxxxx0xxxx0  1111  xxxxxx0000xx  1111  xxxxxx0xxxx0  11
11                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                11
ALL
empty=<<EMPTY
11                11
11  000000000000  11
1   000000000000   1
1   000000000000   1
1   000000000000   1
11  000000000000  11
11                11
EMPTY
ruby=<<RUBY
11                11
11  000******000  11
1   ************   1
1   0**********0   1
1   000******000   1
11  00000**00000  11
11                11
RUBY
message_line=<<ADEHMNPRSWXY # A&EHMNPRSWXYのアスキーアート
11                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                11
11  000001100000  1111  001110000000  1111  011111111100  1111  011100011100  1111  001110001110  1111  011100000111  1111  011111111000  1111  111111110000  1111  001111110000  1111  110000000011  1111  011100001100  1111  011100000111  11
1   000011110000   11   010001000000   11   001110000000   11   101110011100   11   001111011110   11   101110001110   11   001110001110   11   011100111000   11   011000000000   11   011000000110   11   101110011000   11   101110001110   1
1   000110011000   11   011110000110   11   001111110000   11   001111111100   11   001111111110   11   001111001110   11   001110001110   11   011111110000   11   001111111000   11   011011101110   11   000111110000   11   000111111000   1
1   001111111100   11   100001111000   11   001110000000   11   001110011100   11   011001110110   11   011101111100   11   001111111000   11   011100111000   11   000000001100   11   001111111100   11   001110111001   11   000011100000   1
11  011100001110  1111  011111011100  1111  011111111100  1111  011100011110  1111  110000000111  1111  111000011110  1111  001100000000  1111  111100001111  1111  001111111000  1111  001110011100  1111  011000011110  1111  111110000000  11
11                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                11
ADEHMNPRSWXY

puts("\x1b[2J")   # 画面クリア
puts("\x1b[?25l") # カーソル非表示
box_height, box_width, box_count = 7, 20, 5
space = 32.chr # " "
zero = "0"
hr = "1" * box_width * box_count
threads = []
# 日付指定を受け取る
today = if(1..25).cover?(ARGV.first.to_i);ARGV.first.to_i;else((d = Time.now.day) < 25 ? d : 25)end
all, empty, ruby, message_line = [all, empty, ruby, message_line].map { |a| a.lines(chomp:true) }.map { |a| a.map { _1.gsub(zero, space) }}
all_days = (1..25).map { all.map { _1.slice!(0, box_width) }}
message_chars = (1..25).map { message_line.map { _1.slice!(0, box_width) } }
messages = [
  message_chars[4],  # M
  message_chars[2],  # E
  message_chars[7],  # R
  message_chars[7],  # R
  message_chars[11], # Y
  message_chars[10], # X
  message_chars[4],  # M
  message_chars[0],  # A
  message_chars[8],  # S
  message_chars[1],  # &
  message_chars[3],  # H
  message_chars[0],  # A
  message_chars[6],  # P
  message_chars[6],  # P
  message_chars[11], # Y
  message_chars[5],  # N
  message_chars[2],  # E
  message_chars[9],  # W
  empty,
  empty,
  message_chars[11], # Y
  message_chars[2],  # E
  message_chars[0],  # A
  message_chars[7],  # R
  ruby,
]

6.times { |i| puts("\x1b[#{(box_height + 1) * i + 1};1H#{hr}")}

all_days.each_slice(box_count).with_index { |five_days, i|
  threads << Thread.start(five_days, i) { |days, ti|
    sleep(0.1 * rand(9))
    boxes = (1..box_count).map { [(1..box_height).map { "" }, (1..box_height).map { "" }] }
    box_count.times { |j|
      (box_width * (box_count - j)).times { |k|
        box_height.times { |l|
          if(k < box_width)then
            # 今日より前の箱は文字を詰める
            (((ti * box_count + box_count - j) < today) ? messages[ti*box_count+box_count-j-1] : days[-j-1]).tap { |day|
              boxes[-j-1][0][l].insert(-k-1,day[l].slice(-k-1, 1))
            }
          else
            boxes[-j-2][1][l] << space
          end
          boxes[-j-1][1][l].chop!
        }

        print("\x1b[#{ti * (box_height + 1) + 1};1H")
        r = "\n"
        box_height.times { |m|
          box_count.times { |n|
            r << boxes[n][0][m] << boxes[n][1][m]
          }
          r << 10 # "\n"
        }
        puts(r.gsub(zero, space))
        sleep(0.001 * rand(9))
      }
    }
  }
}
threads.each(&:join)

2.times { |i|
  r = (today - 1) / box_count
  box_height.times { |j|
    if(i < 1) # 今日の箱を消す
      puts("\x1b[#{r * (box_height + 1) + j + 2};#{((today - 1) % box_count) * box_width + 1}H#{empty[j]}");
    else # 今日の文字を下から出す
      char = (19..20).cover?(today) ? ruby : messages[today-1].reverse
      puts("\x1b[#{(r + 1) * (box_height + 1) - j};#{((today - 1) % box_count) * box_width + 1}H#{char[j]}");
    end
    sleep(0.06)
  }
}

puts("\x1b[#{5 * (box_height + 1) + 1};1H\x1b[?25h") # カーソルをカレンダー下に移動する
