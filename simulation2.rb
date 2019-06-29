set_x_data=(-20..20).to_a.collect{|elem| elem.to_r}.collect{|elem| elem/=10}#丸め誤差の影響を極力少なくするために分数で計算を行う
set_y_data=[]
#問題1−3
for i in 0..(set_x_data.size-1) 
  set_y_data << Math.sin(set_x_data[i]*(Math::PI)).to_r
end
##1次精度風上差分
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
fp=File.open("kadai1-3data1.txt","w")#データ保存用ファイル
set_tmp_data=set_y_data.clone

#初期値
fp.puts "t=0"
set_tmp_data.each do |elem|
  fp.puts(elem.to_f)
end
set_ans_data=[]

#実際の計算
4.times do |i|
  fp.puts "t=#{i+1}"
  set_ans_data = upwind(set_tmp_data,cdtdx)
  set_ans_data.each do |elem|
    fp.puts(elem.to_f)
  end
  set_tmp_data=set_ans_data.clone
end

##2次精度風上差分
def upwind2(ary,cdtdx)
  cal_ary=[]
  for i in 2..(ary.size-1) do
    cal_ary << ary[i]-cdtdx*(3*ary[i]-4*ary[i-1]+ary[i-2])/2
  end
  return cal_ary
end

#2次精度風上差分を利用した計算
cdtdx=-100.0r
while cdtdx < 0.0r || cdtdx >1.0r
  print "クーラン数を入力:"
  cdtdx=$stdin.gets.to_r
end
fp=File.open("kadai1-3data2.txt","w")#データ保存用ファイル
set_tmp_data=set_y_data.clone

#初期値
fp.puts "t=0"
set_tmp_data.each do |elem|
  fp.puts(elem.to_f)
end
set_ans_data=[]

#実際の計算
4.times do |i|
  fp.puts "t=#{i+1}"
  set_ans_data = upwind2(set_tmp_data,cdtdx)
  set_ans_data.each do |elem|
    fp.puts(elem.to_f)
  end
  set_tmp_data=set_ans_data.clone
end
