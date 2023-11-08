window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const Tax = inputValue*0.1;
  const roundedTax = Math.floor(Tax); // 小数点以下を切り捨てる
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = roundedTax;

    
    const addProfit = document.getElementById("profit");
    // addProfit.innerHTML = inputValue-Tax;
    const profit = inputValue - roundedTax;
    const roundedProfit = profit;// 小数点以下を切り捨てる
    addProfit.innerHTML = roundedProfit;
  });
});
