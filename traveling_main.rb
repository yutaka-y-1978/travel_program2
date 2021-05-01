require "./traveling_method.rb"

plans = [
  {destination: "沖縄旅行", price: 10000},
  {destination: "北海道旅行", price: 20000},
  {destination: "九州旅行", price: 15000}
]

# 定数枠（より柔軟性を持たせられるように）
FIRST_NUM = 1 # 最初の番号（変更可）
LAST_NUM = (FIRST_NUM + plans.size) - 1 # 最後の番号（『最初の番号』に依存）
DISCOUNT_STANDARD_MEMBER = 5 # 割引適用人数（変更可）
DISCOUNT_RATE = 0.1 # 割引率（変更可）
AFTER_DISCOUNT_RATE = 1 - DISCOUNT_RATE # 割引率適用後の料金の割合（『割引率』に依存）

show(plans) # 旅行プランを表示する
chosen_plan = select_plan(plans) # 旅行プランを選択し、入力する
number_of_people = reserve_member_count(chosen_plan) # プランを確認し、予約人数を入力する
travel_expenses_calculate(chosen_plan, number_of_people) # 料金の計算を行う。人数によっては割引した料金になる