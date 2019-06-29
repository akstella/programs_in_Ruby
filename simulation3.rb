set_x_data1=(-30..30).to_a.collect{|elem| elem.to_r}.collect{|elem| elem/=10}#-3から3までを定義域とし冗長性をもたせる
set_y_data1=[]
set_y_data2=[]
#問題1−2
for i in 1..60 do
  set_y_data1 << ((i<=30)? 1.0r : -1.0r)
  set_y_data2 << ((i<30)? -1.0r : 1.0r)
end
##一次精度風上差分
def upwind(ary,dtdx)
  cal_ary=[]
  for i in 1..(ary.size-1) do
    f_plus=(ary[i]**2)/2
    f_minus=(ary[i-1]**2)/2
    cal_ary << ary[i]-dtdx*(f_plus-f_minus)
  end
  return cal_ary
end
##2次精度風上差分
def upwind2(ary,dtdx)
  cal_ary=[]
  for i in 2..(ary.size-1) do
    f_p=(3*ary[i]/2-ary[i-1]/2)**2/2
    f_m=(3*ary[i-1]/2-ary[i-2]/2)**2/2
    cal_ary << ary[i]-dtdx*(f_p-f_m)
  end
  return cal_ary
end

#case1: u_1=1, u_2=-1
#一次精度風上差分を用算
cdtdx=-100.0r
while cdtdx < 0.0r || cdtdx >1.0r
  print "case1, 一次精度風上差分のdxdtの値を入力:"
  cdtdx=$stdin.gets.to_r
  if cdtdx < 0.0r || cdtdx > 1.0r
    puts "もう一度入力してください."
  end
end
fp=File.open("kadai2case1data1.txt","w")
set_tmp_data=set_y_data1.clone

#初期値
set_ans_data=[]
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

#2次精度風上差分計算
cdtdx=-100.0r
while cdtdx < 0.0r || cdtdx >1.0r
  print "case1, 二次精度風上差分のdxdtの値を入力:"
  cdtdx=$stdin.gets.to_r
  if cdtdx < 0.0r || cdtdx > 1.0r
    puts "もう一度入力してください."
  end
end
fp=File.open("kadai2case1data2.txt","w")
set_tmp_data=set_y_data1.clone
set_ans_data=[]

#初期値
fp.puts "t=0"
set_tmp_data.each do |elem|
  fp.puts(elem.to_f)
end

#実際の計算
4.times do |i|
  fp.puts "t=#{i+1}"
  set_ans_data = upwind2(set_tmp_data,cdtdx)
  set_ans_data.each do |elem|
    fp.puts(elem.to_f)
  end
  set_tmp_data=set_ans_data.clone
end

#case2, u_1=-1, u_2=1
#一次精度風上差分計算
cdtdx=-100.0r
while cdtdx < 0.0r || cdtdx >1.0r
  print "case2, 一次精度風上差分のdxdtの値を入力:"
  cdtdx=$stdin.gets.to_r
  if cdtdx < 0.0r || cdtdx > 1.0r
    puts "もう一度入力してください."
  end
end
fp=File.open("kadai2case2data1.txt","w")
set_tmp_data=set_y_data2.clone
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

#2次精度風上差分計算
cdtdx=-100.0r
while cdtdx < 0.0r || cdtdx >1.0r
  print "case2, 二次精度風上差分のdxdtの値を入力:"
  cdtdx=$stdin.gets.to_r
  if cdtdx < 0.0r || cdtdx > 1.0r
    puts "もう一度入力してください."
  end
end
fp=File.open("kadai2case2data2.txt","w")
set_tmp_data=set_y_data2.clone
set_ans_data=[]

#初期値
fp.puts "t=0"
set_tmp_data.each do |elem|
  fp.puts(elem.to_f)
end

#実際の計算
4.times do |i|
  fp.puts "t=#{i+1}"
  set_ans_data = upwind2(set_tmp_data,cdtdx)
  set_ans_data.each do |elem|
    fp.puts(elem.to_f)
  end
  set_tmp_data=set_ans_data.clone
end

