# Convert number to chinese
numbers = {
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
ts = (Time.now.to_f * 1000).to_i.to_s
l = ts.length
zh = ''
l.times do |i|
  idx = ts[i,i+1][0].to_i
  zh = zh + numbers["#{idx}"]
end
puts zh
