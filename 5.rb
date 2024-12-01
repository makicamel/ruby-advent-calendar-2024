# 最終日にRubyを表示する

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
message_line=<<ABDEHMNPRSUWXY
11                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                11
11  000001110000  1111  011111111000  1111  001110000000  1111  011111111100  1111  011110011110  1111  001110001111  1111  011100000111  1111  011111111100  1111  111111111000  1111  001111110000  1111  111100000111  1111  111000001111  1111  111100001110  1111  011100000111  11
1   000011111000   11   001111001110   11   010001000000   11   001111000000   11   001110011100   11   011111011111   11   011110001111   11   001110001111   11   011100011110   11   011110000000   11   111000000111   11   111000001110   11   011110011100   11   001110001110   1
1   000110011100   11   001111111000   11   011110000110   11   001111110000   11   001111111100   11   011111111111   11   011111101110   11   001110001111   11   011111111100   11   001111111000   11   111000000111   11   011011101110   11   000111111000   11   000111111000   1
1   001111111110   11   001110001110   11   100001111000   11   001110000000   11   001110011100   11   111001110111   11   111011111110   11   001111111100   11   011100111000   11   000000111100   11   111100001111   11   011111111100   11   001110111100   11   000011100000   1
11  011100001111  1111  011111111000  1111  011111011100  1111  011111111100  1111  011100011110  1111  110000000111  1111  111000111100  1111  001100000000  1111  111100011111  1111  001111111000  1111  001111111100  1111  001110011100  1111  111000001111  1111  111110000000  11
11                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                1111                11
ABDEHMNPRSUWXY
version=<<VERSION
                                  00000000000
                              000000    0000000
                              0000        000000
                                          000000
                                        00000000
                                    0000000000
                                      000000
                                       000000             000
                        0000          0000000            0000
                        0000000     000000000           0000     000
                          00000000000000000           00000     00000
                              0000000000      00    000000     000000
                                                  0000000     000000
                                                00000000000000000000000
                                                            000000
                                                          0000000
                                                        0000000
                                                      0000000
                                                    0000000
                                                 000000
VERSION

puts("\x1b[2J")   # 画面クリア
puts("\x1b[?25l") # カーソル非表示
box_height, box_width, box_count = 7, 20, 5
space = 32.chr # " "
zero = "0"
hr = "1" * box_width * box_count
threads = []
today = if(1..25).cover?(ARGV.first.to_i);ARGV.first.to_i;else((d = Time.now.day) < 25 ? d : 25)end
all, empty, ruby, message_line = [all, empty, ruby, message_line].map { |a| a.lines(chomp:true) }.map { |a| a.map { _1.gsub(zero, space) }}
all_days = (1..25).map { all.map { _1.slice!(0, box_width) }}
message_chars = (1..25).map { message_line.map { _1.slice!(0, box_width) } }
messages = [
  message_chars[5],  # M
  message_chars[3],  # E
  message_chars[8],  # R
  message_chars[8],  # R
  message_chars[13], # Y
  message_chars[12], # X
  message_chars[5],  # M
  message_chars[0],  # A
  message_chars[9],  # S
  message_chars[2],  # &
  message_chars[4],  # H
  message_chars[0],  # A
  message_chars[7],  # P
  message_chars[7],  # P
  message_chars[13], # Y
  message_chars[6],  # N
  message_chars[3],  # E
  message_chars[11], # W
  empty,
  empty,
  message_chars[8],  # R
  message_chars[10], # U
  message_chars[1],  # B
  message_chars[13], # Y
  ruby,
]

6.times { |i| puts("\x1b[#{(box_height + 1) * i + 1};1H#{hr}")}

all_days.each_slice(box_count).with_index { |five_days, i|
  threads << Thread.start(five_days, i) { |days, ti|
    sleep(0.1 * rand(9))
    boxes = Array.new(box_count){ [Array.new(box_height) { "" }, Array.new(box_height) { "" }] }
    box_count.times { |j|
      (box_width * (box_count - j)).times { |k|
        box_height.times { |l|
          if(k < box_width)then
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
    if(i < 1)
      puts("\x1b[#{r * (box_height + 1) + j + 2};#{((today - 1) % box_count) * box_width + 1}H#{empty[j]}");
    else
      char = (19..20).cover?(today) ? ruby.reverse : messages[today-1].reverse
      puts("\x1b[#{(r + 1) * (box_height + 1) - j};#{((today - 1) % box_count) * box_width + 1}H#{char[j]}");
    end
    sleep(0.06)
  }
}

# 大きなRubyを出す
if(today==25)then
  sleep(1.3)
  puts("\x1b[2J")   # 画面クリア
  puts("\x1b[1;1H#{hr}\x1b[#{5 * (box_height + 1)};1H#{hr}")

  interpolate_point = -> (ps, pl, t) {
    [
      ps[0] + (pl[0] - ps[0]) * t,
      ps[1] + (pl[1] - ps[1]) * t,
    ]
  }
  # 任意の点pが多角形の内側にいるか否か
  point_in_polygon = -> (polygon, px, py) {
    in_polygon = false
    polygon.each_with_index do |(x1, y1), i|
      x2, y2 = polygon[i-1]
      # 今見ている頂点とひとつ前の頂点の間を対象の点が横切った場合、かつ
      # 横切った時に交差するX座標を計算し対象の点が交差点の左側にいる場合、
      # 多角形の内側または外側にいる判定を反転させる
      if (y1 > py) != (y2 > py) && (px < (x2 - x1) * (py - y1) / (y2 - y1) + x1)
        in_polygon = !in_polygon
      end
    end
    in_polygon
  }

  start_polygon = [[47, 15], [48, 15], [53, 17], [47, 21], [41, 17]]
  last_polygon = [[25, 6], [77, 6], [91, 14], [52, 32], [12, 14]]
  polygons = (1..25).map { |i|
    t = i.to_f / (25 - 1)
    start_polygon.map.with_index { |start_poly, j|
      interpolate_point.call(start_poly, last_polygon[j], t)
    }
  }

  polygons.each_with_index { |polygon, i|
    poly = (1..36)
      .map { |y| (1..100).map { |x| [x, y] } }
      .map { _1.map { |px, py| point_in_polygon.call(polygon, px, py) ? '*' : space }.join }
      .join("\n")
    puts("\x1b[31;1m") # 文字色を赤にする
    puts("\x1b[2;1H#{poly}")
    sleep(0.0034 * i)
  }
  ['+', ';', ':', '.', space].each_with_index { |c, i|
    sleep(0.34 * i)
    version.lines(chomp:true).each_with_index { |line, j|
      line.chars.each_with_index { |char, k|
        if(char == zero)then
          puts("\x1b[#{j + 9};#{k + 1}H#{c}")
          sleep(0.00034 * i)
        end
      }
    }
  }
end

puts("\x1b[0m\x1b[#{5 * (box_height + 1) + 1};1H\x1b[?25h") # カーソルをカレンダー下に移動する
