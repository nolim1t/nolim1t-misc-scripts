# encoding: UTF-8
# Convert number to chinese
def ntz(the_num)
  numbers = {
      '0' => '零',
      '1' => '一',
      '2' => '二',
      '3' => '三',
      '4' => '四',
      '5' => '五',
      '6' => '六',
      '7' => '七',
      '8' => '八',
      '9' => '十'
  }
  the_num_str = the_num.to_s
  l = the_num_str.length
  zh = ''
  l.times do |i|
    idx = the_num_str[i,i+1][0].to_i
    to_append = numbers["#{idx}"]
    zh = "#{zh}#{to_append}"
  end
  return zh
end

puts ntz((Time.now.to_f * 1000).to_i)
