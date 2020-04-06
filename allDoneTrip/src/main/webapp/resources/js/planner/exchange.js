$(document).ready(function(){

		var exchange_Country = $("select.exchange_Country");
		var exchange_Result_Country = $("select.exchange_Result_Country");
		
		var InputMoney = $("input[name='InputMoney']");
		var ResultMoney = $("input[name='ResultMoney']");
		var currency1 = $("label.currency1");
		var currency2 = $("label.currency2");
	

		//환율계산기
		InputMoney.on("keyup", function(){
        	var country = exchange_Country.val() + exchange_Result_Country.val();
        	var money = InputMoney.val()
        	
        	$.ajax({
                url:'https://earthquake.kr:23490/query/'+country,
                dataType:'JSON',
                type:'GET',   
                success:function(data){
                	var strCountry = "data."+country+"[0]";
                	var exchangeRate = eval(strCountry);
                	var result = Math.round(money * exchangeRate * 100) / 100.0;
                	ResultMoney.val(result);
                }
        	});//end of Ajax
        }); //end of 환율계산기
         
		
		
		//단위 바꾸기_조회 국가
		exchange_Country.on("change", function(){
			var currency2_val;
			
			switch(exchange_Country.val()){
				case 'USD' :
					currency1_val = "달러";
					break;
				case 'HKD' :
					currency1_val = "홍콩달러";
					break;
				case 'EUR' :
					currency1_val = "유로";
					break;
				case 'JPY' :
					currency1_val = "엔";
					break;
				case 'KRW' :
					currency1_val = "원";
					break;
			}
			
			currency1.html(currency1_val);
		});
		
		
		//단위 바꾸기_결과 국가
		exchange_Result_Country.on("change", function(){
			var currency2_val;
			
			switch(exchange_Result_Country.val()){
				case 'USD' :
					currency2_val = "달러";
					break;
				case 'HKD' :
					currency2_val = "홍콩달러";
					break;
				case 'EUR' :
					currency2_val = "유로";
					break;
				case 'JPY' :
					currency2_val = "엔";
					break;
				case 'KRW' :
					currency2_val = "원";
					break;
			}
			
			currency2.html(currency2_val);
		});
		
		
      });