x_point, y_point, xu, yu = ARGV

if x_point==xu && y_point==yu
puts 'Точка найдена'
else x_point!=xu && y_point!=yu
puts 'Близко,но нет'
if x_point==xu && y_point!=yu
puts 'х верна, y нет'
elsif x_point!=xu && y_point==yu
puts 'y верна, x нет'
end
end
