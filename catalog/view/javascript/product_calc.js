var calcPause;

		function calcOfBoxes(){
			clearTimeout(calcPause);
			calcPause = setTimeout(calcPriceBoxes, 500);
		}

		function calcOfQMeter(){
			clearTimeout(calcPause);
			calcPause = setTimeout(calcPriceMeters, 500);
		}

		function calcPriceBoxes(){
			var quantity = document.getElementById("quantity").value;
			var price_box = parseFloat(document.getElementById("price_box").value);
			var count_m2 = document.getElementById("count_m2").value;
			count_m2 = count_m2.replace(",",".");
		    /*$('totalPrice').val("quantity*price_box*qtySQM");*/
    var qtySQM2 = quantity*count_m2;
    var ttp = quantity*price_box;
	var $input = $(this).parent().find('input');
				var count = parseInt($input.val());
				qtySQM = qtySQM < 1 ? 1 : qtySQM;
				$input.val(qtySQM);
			
			



		    
 

		    var ttp_str = ttp.toFixed(2);
  var rounded = parseFloat(qtySQM2.toFixed(1));

		    document.getElementById('qtySQM').value ;
  document.getElementById('qtySQM2').innerHTML = rounded;
		    document.getElementById('totalPrice').innerHTML = 'Цена <span>' + ttp.toFixed(2) + '</span> грн.';
			document.getElementById('totalPrice2').innerHTML = 'Цена <span>' + ttp.toFixed(2) + '</span> грн.';

		}

		function calcPriceMeters(){
			var price_box = document.getElementById("price_box").value;
			var count_m2 = document.getElementById("count_m2").value;
			var qtySQM = document.getElementById("qtySQM").value;

			count_m2 = count_m2.replace(",",".");

			var quantity = Math.ceil(qtySQM/count_m2);

		    document.getElementById('quantity').value = quantity;
			document.getElementById('qty-re').innerHTML = quantity;

		    calcPriceBoxes();

		}

