---
---

document.onreadystatechange = ->
  if @readyState == "complete"
    addHandler()

#
# These algorithms were lovingly taken from:
# http://www.daveywaveyfitness.com/nutrition/how-many-calories-should-i-be-eating-harris-benedict-calculator
#

bmrMan = (weight, height, age) ->
  66 + (6.23 * weight) + (12.7 * height) - (6.76 * age)

bmrWoman = (weight, height, age) ->
  655 + (4.35 * weight) + (4.7 * height) - (4.7 * age)

bmr = (sex, weight, height, age) ->
  switch sex
    when "man" then bmrMan(weight, height, age)
    when "woman" then bmrWoman(weight, height, age)

multiplicativeForActivity = (activity) ->
  switch activity
    when "sedentary" then 1.2
    when "light" then 1.375
    when "moderate" then 1.55
    when "very" then 1.725
    when "extra" then 1.9

calculateBMR = () ->
  sex = document.getElementsByName("sex")[0].value
  weight = document.getElementsByName("weight")[0].value
  height = document.getElementsByName("height")[0].value
  age = document.getElementsByName("age")[0].value
  activity = document.getElementsByName("activity")[0].value
  bmr(sex, weight, height, age) * multiplicativeForActivity(activity)

writeResult = (result) ->
  document.getElementById("result").innerText = "Result: #{result} kcal"

addHandler = ->
  submit = document.getElementById "submit"
  submit.onclick = (e) ->
    e.preventDefault();
    writeResult(calculateBMR())
