fancy_colors = %w[91 93 92 96 94 95]
secret_msg = '4665656C0A667265650A746F0A6D6573736167650A6D65210A0A6D61696C746F3A7469616E7975616E63756970616E40676D61696C2E636F6D0A0A'
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
                