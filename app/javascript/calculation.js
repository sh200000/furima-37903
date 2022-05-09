function calculation (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const ratio = 0.1;
    const commission = Math.floor(itemPrice.value * ratio);
    const profitCalc = itemPrice.value - commission
    const addTaxPrice  = document.getElementById("add-tax-price");
    const profit  = document.getElementById("profit");

    addTaxPrice.innerHTML = commission;
    profit.innerHTML = profitCalc;
  });
};
window.addEventListener('load', calculation);