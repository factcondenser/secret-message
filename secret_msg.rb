fancy_colors = %w[91 93 92 96 94 95]
secret_msg = '596f750a7265616c6c790a6f756768740a746f0a6d6573736167650a6d65210a0a6d61696c746f3a6d61726b70616e406865792e636f6d0a'
chars = secret_msg.scan(/../).map { |x| x.hex.chr }
char_color_idx = start_color_idx = 0
loop do
  char_color_idx = start_color_idx
  print "\e[H\e[2J" # Clear terminal
  chars.each do |char|
    print "\e[#{fancy_colors[char_color_idx]}m#{char}\e[0m"
    char_color_idx += 1
    char_color_idx %= fancy_colors.length
  end
  puts 'Ctrl+C to quit'
  sleep(0.05)
  start_color_idx -= 1
  start_color_idx %= fancy_colors.length
end
