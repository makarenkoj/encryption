#encoding: UTF-8
# makarenkoj

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__


  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'digest'

puts 'Введите слово или фразу для шифрования:'
string = STDIN.gets.chomp

puts 'Каким способом шифровать:'
puts '1. MD5'
puts '2. SHA1'
encrypt_method = STDIN.gets.to_i

until encrypt_method.between?(1,2)
  puts 'Выберите метод 1 или 2'
  encrypt_method = STDIN.gets.to_i
end
puts 'Вот что получилось:'

case encrypt_method
when 1
  puts Digest::MD5.hexdigest(string)
when 2
  puts Digest::SHA1.hexdigest(string)
end
