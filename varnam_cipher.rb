#!/usr/bin/ruby
#バーナム暗号のようなもの
#暗号化の度に乱数による新しい暗号鍵を生成します

#文の入力を受け付け、これを二進数に変換する
val = gets.chomp
val_16_2 = val.unpack('H*').to_s.unpack('B*')
sentence = val_16_2[0]

#sentenceを分割して配列化する
array_sentence = Array.new
sentence.split('').each do |s|
	array_sentence.push s
end


#乱数鍵「key」をsentenceの長さに合わせて生成する
key = String.new
for i in (1..array_sentence.length) #sentenceの長さは、array_sentence.length
	key = key + [0,1].sample.to_s
end

#keyも分割して配列化する
array_key = Array.new
key.split('').each do |k|
	array_key.push k
end


#配列化した平文、暗号鍵の両方を読み取って、XOR演算をし、暗号文crpを作成する
num = array_sentence.length
crp = String.new
for i in (1..num)
	tmp = array_key[i - 1].to_i + array_sentence[i - 1].to_i
	if (tmp == 2)
		crp = crp + "0"
	elsif (tmp == 1)
		crp = crp + "1"
	else
		crp = crp + "0"
	end
end

#出力
puts "平　文: " + sentence
puts "暗号鍵: " + key
puts "暗号文: " + crp