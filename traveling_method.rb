# 旅行プランを表示する
def show_plan(plans)
  puts "旅行プランを選択して下さい。"
  puts ""
  plans.each.with_index(FIRST_NUM) do |plan, i|
    puts "#{i}. #{plan[:destination]}(#{plan[:price]}円)"
  end
  puts ""
end

# 旅行プランを選択し、入力する
def select_plan(plans)
  while true
  print "プランの番号を選択 > "
  select_plan_num = gets.to_i
  break if (FIRST_NUM..LAST_NUM).include?(select_plan_num)
  puts "プランの番号である1〜3を入力して下さい。"
  end
  chosen_plan_index = select_plan_num - FIRST_NUM
  plans[chosen_plan_index - 1]
end

# プランを確認し、予約人数を入力する
def reserve_plan(chosen_plan)
  puts <<~TXT
  #{chosen_plan[:destination]}ですね。
  何名で予約されますか？
  TXT
  while true
    print "人数を入力 > "
    number_of_people = gets.to_i
    break if number_of_people >= 1
    puts "1名以上の数で入力して下さい。"
  end
  puts "#{number_of_people}名ですね。"
  number_of_people
end

# 料金の計算を行う。人数によっては割引した料金になる
def calculate_plan(chosen_plan, number_of_people)
  total_price = chosen_plan[:price] * number_of_people
  if number_of_people >= DISCOUNT_STANDARD_MEMBER
    puts "#{DISCOUNT_STANDARD_MEMBER}名以上ですので#{(DISCOUNT_RATE * 100).floor}%割引となります。"
    total_price *= AFTER_DISCOUNT_RATE
  end
  puts "合計料金は#{total_price.floor}円になります。"
end