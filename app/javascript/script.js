function price() {

  const price = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  let tax_num = ""
  let profit_num = ""
  tax.innerHTML = tax_num
  profit.innerHTML = profit_num

  price.addEventListener('input', function(){
  tax_num = price.value * 0.1
  tax.innerHTML = Math.floor(tax_num)
  profit_num = price.value - tax_num
  profit.innerHTML = Math.floor(profit_num)
  })
}
window.addEventListener('load', price)
document.addEventListener("turbolinks:load", price)
