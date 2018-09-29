fancy_colors = %w[91 93 92 96 94 95]
secret_msg = '596f750A7265616c6c790A6f756768740A746f0A6d6573736167650A6d65210A0A6D61696C746F3A6D61726B406D61726B63756970616E2E636F6D0A0A'
chars = secret_msg.scan(/../).map { |x| x.hex.chr }
char_color_idx = start_color_idx = 0
100.times do
  char_color_idx = start_color_idx
  print "\e[H\e[2J" # Clear terminal
  chars.each do |char|
    print "\e[#{fancy_colors[char_color_idx]}m#{char}\e[0m"
    char_color_idx += 1
    char_color_idx %= fancy_colors.length
  end
  sleep(0.05)
  start_color_idx -= 1
  start_color_idx %= fancy_colors.length
end
                