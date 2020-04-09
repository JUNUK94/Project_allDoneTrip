$(document).ready(
		function() {

			var zero = $("#zero");		//0
			var one = $("#one");		//1
			var two = $("#two");		//2
			var three = $("#three");	//3
			var four = $("#four");		//4
			var five = $("#five");		//5
			var six = $("#six");		//6
			var seven = $("#seven");	//7
			var eight = $("#eight");	//8
			var nine = $("#nine");		//9
			var point = $("#point");	//.
			

			var equal = $("#equal");				//=
			var plus = $("#plus");					//+
			var minus = $("#minus");				//-
			var multiple = $("#multiple");			//x
			var devide = $("#devide");				//'/'
			var openBracket = $("#openBracket");	//(
			var closeBracket = $("#closeBracket");	//)
			var back = $("#back");					//<-
			var clear = $("#clear");				//C
			
			
			var inputNum = $("input[name='inputNum']");
			var showResult = $("#showResult");
			var calculate_Result_List = $("#calculate_Result_List");

			var value;
			var lastChar;
			var length;
			var process;
			var calulate_Result;
			var index = 0;

			
			// 숫자 입력 이벤트
			$("#button-wrapper").on("click",".number", function() {
				
				value = $(this).html();
				process = inputNum.val();
				length = process.length;
				lastChar = process.charAt(length-1);
				
				if(length != 0){
					if(value == '.'){
						if(isNaN(lastChar)){
							value = '';
						}else{
						}
					}else{
						if(lastChar == ')'){
							value = '*' + value;
						}
					}
				}else{
					if(value == '.'){
						value = '';
					}
				}
				process += value;
				inputNum.val(process);
			});
			
			
			
			// 연산자 입력 이벤트
			$("#button-wrapper").on("click",".operator", function() {
				
				value = $(this).html();
				process = inputNum.val();
				length = process.length;
				lastChar = process.charAt(length-1);
				
				if(length == 0){
					if(value != '-'){
						value = '';
					}
				}else{
					if(lastChar != ')'){
						if(isNaN(lastChar)){
							value = '';
						}
					}
				}
				
				process += value;
				inputNum.val(process);
			});
			
			
			
			// 열린 괄호 '(' 입력 이벤트
			openBracket.on("click", function() {
				
				value = $(this).html();
				process = inputNum.val();
				length = process.length;
				lastChar = process.charAt(length-1);
				
				if(length != 0){
					if(lastChar != '.'){
						if(!isNaN(lastChar)){
							value = '*' + value;
						}
					}else{
						value = '0*' + value;
					}
				}
				process += value;
				inputNum.val(process);
			});
			
			
			
			// 닫힌 괄호 ')' 입력 이벤트
			closeBracket.on("click", function() {
				
				value = $(this).html();
				process = inputNum.val();
				length = process.length;
				lastChar = process.charAt(length-1);
				
				var count1 = 0;
				var count2 = 0;

				if(length != 0){
					for(var i=0; i<length; i++) {
						if (process.charAt(i) == "(") {
							count1 = Number(count1) + 1;
						} else if (process.charAt(i) == ")") {
							count2 = Number(count2) + 1;
						}
					}
					
					if (count1 > count2) {
						if(isNaN(lastChar)){
							switch(lastChar){
								case '+' : value = '';
									break;
								case '-' : value = '';
									break;
								case '*' : value = '';
									break;
								case '/' : value = '';
									break;
								case '.' : value = '0'+value;
									break;
							}
						}
					}else{
						value = '';
					}
				}else{
					value = '';
				}
				
				process += value;
				inputNum.val(process);
			});
			
			
			
			// 한칸 지우기
			back.on("click", function() {
				
				process = inputNum.val();
				process = process.slice(0, -1);
				
				inputNum.val(process);
			});
			
			
			// 모두 지우기
			clear.on("click", function() {
				inputNum.val(null);
			});
			
			
			// 계산하기
			equal.on("click", function() {

				process = inputNum.val();
				length = process.length;
				lastChar = process.charAt(length-1);
				
				console.log(process);
				
				if(isNaN(lastChar)){
					if(lastChar != ')'){
						process = process.slice(0, -1);
					}
				}

				try {
					calulate_Result = eval(process);
					showResult.removeAttr("style");
					
					var str = "";
					str += ("<div class='row' id='remove_Cal_Result"+index+"'>");
						str += "<div class='col-md-10'>";
							str += (process+" = ");
							str += ("<label class='text-primary'>"+calulate_Result+"</label>");
						str += "</div>";
						str += ("<div class='col-md-2 remove_Cal_Result' onclick='remove_Cal_Result("+index+")'>x</div>");
					str += "</div>";
					
					index = Number(index)+1;
					
					calculate_Result_List.append(str);
				} catch (Exception) {
					alert("잘못된 수식입니다");
				}
			}); // end of 계산

});// end of Ajax


// 계산결과 리스트 지우기
function remove_Cal_Result(index){
	var x_btn = document.getElementById("remove_Cal_Result"+index);
	var result_List_wrapper = document.getElementById('calculate_Result_List');
	result_List_wrapper.removeChild(x_btn);
	
	var cnt = result_List_wrapper.childElementCount;

	if(cnt == 0){
		showResult.style.display = 'none';
	}
}





