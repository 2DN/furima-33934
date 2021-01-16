function calculation(){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("input", function(){
    const price = itemPrice.value
    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML = Math.trunc(price * 0.1)
    const profit = document.getElementById("profit")
    profit.innerHTML = Math.trunc(price - price * 0.1)
  });
}

window.addEventListener("load", calculation);