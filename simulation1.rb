set_x_data=(-20..20).to_a.collect{|elem| elem.to_r}.collect{|elem| elem/=10}
set_y_data=[]
#問題1−2
for i in 1..40 do
  set_y_data << ((i<=20)? 1.0r : 0.0r)
end
##一次精度風上差分
def upwind(ary,cdtdx)
  cal_ary=[]
  for i in 1..(ary.size-1) do
    cal_ary << ary[i]-cdtdx*(ary[i]-ary[i-1])
  end
  return cal_ary
end

#一次精度風上差分を用いた計算
cdtdx=-100.0r
while cdtdx < 0.0r || cdtdx >1.0r
  print "クーラン数を入力:"
  cdtdx=$stdin.gets.to_r
end
fp=File.open("kadai1-2data1.txt","w")
set_tmp_data=set_y_data.clone
set_ans_data=[]

#初期値
fp.puts "t=0"
set_tmp_data.each do |elem|
  fp.puts(elem.to_f)
end

#実際の計算
4.times do |i|
  fp.puts "t=#{i+1}"
  set_ans_data = upwind(set_tmp_data,cdtdx)
  set_ans_data.each do |elem|
    fp.puts(elem.to_f)
  end
  set_tmp_data=set_ans_data.clone
end


#LAXスキーム
def LAX(ary,cdtdx)
  cal_ary=[]
  for i in 1..(ary.size-2) do
    cal_ary <<  (ary[i-1] + ary[i+1])/2 - cdtdx*(ary[i+1]-ary[i-1])/2
  end
  return cal_ary
end

#LAXスキームを用いた計算
cdtdx=-100.0r
while cdtdx < 0.0r || cdtdx >1.0r
  print "クーラン数を入力:"
  cdtdx=$stdin.gets.to_r
end
fp=File.open("kadai1-2data2.txt","w")
set_tmp_data=set_y_data.clone
set_ans_data=[]
fp.puts "t=0"

#初期値
set_tmp_data.each do |elem|
  fp.puts(elem.to_f)
end

#実際の数値計算
4.times do |i|
  fp.puts "t=#{i+1}"
  set_ans_data = LAX(set_tmp_data,cdtdx)
  set_ans_data.each do |elem|
    fp.puts(elem.to_f)
  end
  set_tmp_data=set_ans_data.clone
end
