# データ圧縮

data = [
  {
    name: 'ruby',
    str: 'zxawe6ulllbzbitv05hen15efpf',
    row: 7,
    length: 20 * 1,
  },
  {
    name: 'empty',
    str: 'zxawe2sxt34pwaake6gy8xaamtf',
    row: 7,
    length: 20 * 1,
  },
  {
    name: 'message_line',
    str: '14vobdzknjscg8aoavlla26eelye8bty961sars90kqq6xiy9ucz6no9atsq0elyfpeyi93bi6qieumgiizjhr1nuxyhkmc1ysguknebrl39bsd564haz9bq42x0m5lvli1mw4v63an9q529y6fuhoccgm17a9xyhqquzvvkwj5zn886f4pq3nqn610zqcb0lx0f9mkdm1t9sr1kfeyoriq3p1c1k39k0vrvcni0gu0mgt2ozf43ri980cqp2dlqtg1rfcfsiclyu1jrbsd2qg1ab1rvk3kcy37wac6ay5viwofyyt6hbb7rmv2t1x106k3t7er9qaq1edye0j02i7uzsl823eifwboecff4fq1homfb1n84gcbj4kjn',
    row: 7,
    length: 20 * 14,
  },
  {
    name: 'all',
    str: 'q9xki158dgt0uld7lz61hc9o9k8tuz3j76bwzvzxf4tymb7va8ge9ex4u7xmeyfyh4q3s32pdd23cxdl558i8euhk7ms5j7f8h8cy6gaax0hqu6t6c8hmurd0cajqm283ut710hsu1qqpqmjbr2ee4mbzlt339y07xww803894b9fvnr72gncfuk6mmmlbafh9cogahqr4l5o7npmctzmhskn3a8mlg66vgcaqti9a8gxqgx6myo3og42hfybescjz6dxk8j6qjwiix0epxt5my2m32zcrybj3zmq63glc329mi7gs1gyjlcsibvss1hk6qhgb65a3wd6e04435brfgt9vairod3f9x9xcvq9lppyzlxzp2nwzfy1kq1vuu2uye6fn0gqdy6zboc335mv3co76ayj7n67i31wgfea95soez3rnu34b1c7psq0da694w729e1oinrog6a7vni4iugwd9k20uu3idufe1sl6t7llwacayo2niip6thrb18m62pdf3hgagg6sas2vf8z48otv1tr0o7f82guefzwwtcca1pjcq6rawlbh2gwy9li4jsph2wmxpw3be9yt67ne6qo806bkd4uzf6lq67ms1rh6kg2wi2v7nne7hurcavezxrox9el434byizyot2wc686puar8sqcz6kj',
    row: 7,
    length: 20 * 25,
  },
  {
    name: 'version',
    str: 'auuf6egu8vvhq0jqtscht6uwcr4s1vmtvjauqj6homnikg3cbzh03yguh9yr0lwlxx7ila0v7mq88uqhhglxobempy1vq96iplehgm9m1yyz7wtf0t4i2gtl66bskgprdyp7ubuijwla1odr9zgcfkbxx8v2hzor0o029ex38c4mcf616k81h7imyr26k33ktpb06e3t6xo85gn292m6kelefz72e64eweovluv6xuuozaztvbgmb7196goyyo0kcpypvrpngs2zgx5fegv',
    row: 20,
    length: 71,
  },
]
data.each { |hash|
  line = (0...hash[:row]).map { |y|
    (0..hash[:length]-1).map { |x|
      hash[:str].to_i(36)[x+y*hash[:length]]
    }.join.slice(/.{#{hash[:length]}}/)
  }
  binding.local_variable_set(hash[:name], line)
}

puts("\x1b[2J")   # 画面クリア
puts("\x1b[?25l") # カーソル非表示
box_height, box_width, box_count = 7, 20, 5
space = 32.chr # " "
zero = "0"
hr = "1" * box_width * box_count
pattern = /^(1{1,2})(0[01]{14,16}0)(1{1,2})$/
threads = []
today = if(1..25).cover?(ARGV.first.to_i);ARGV.first.to_i;else((d = Time.now.day) < 25 ? d : 25)end

all, empty, ruby, message_line, version = [all, empty, ruby, message_line, version]
all_days = (1..25).map { all.map { _1.slice!(0, box_width).sub(pattern) { sf=$3; "#{$1}#{$2.gsub('1', 'x')}#{sf}" }.gsub(zero, space) } }
message_chars = (1..25).map { message_line.map { _1.slice!(0, box_width).sub(pattern){ sf=$3; "#{$1}#{$2.gsub('1', '-')}#{sf}" }.gsub(zero, space) } }
empty, ruby = [empty, ruby].map { |line| line.map { _1.sub(pattern){ sf=$3; "#{$1}#{$2.gsub('1', '*')}#{sf}" }.gsub(zero, space) } }

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
        puts(r)
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
  point_in_polygon = -> (polygon, px, py) {
    in_polygon = false
    polygon.each_with_index do |(x1, y1), i|
      x2, y2 = polygon[i-1]
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
    version.each_with_index { |line, j|
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


