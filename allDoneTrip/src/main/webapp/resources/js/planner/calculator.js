	$(document).ready(function() {

			var calulator = $("button.calculator");
			var plus = $("button.plus");
			var minus = $("button.minus");
			var multiple = $("button.multiple");
			var devide = $("button.devide");
			var openBracket = $("button.openBracket");
			var closeBracket = $("button.closeBracket");
			var back = $("button.back");
			var clear = $("button.clear");
			var showProcess = $("input.showProcess");
			var showResult = $("div.showResult");

			var status = false;
			var process = "";
			var result = "";

			
			// 계산
			calulator.on("click", function() {
				var inputNum = $("input[name='inputNum']").val();
				process = showProcess.val();

				if (inputNum == "") {
					if (isNaN(process.charAt(process.length - 1))) {
						if (process.charAt(process.length - 1) != ")") {
							process = process.slice(0, -1);
							showProcess.val(process);
						}
					}
				} else {
					process += inputNum;
					showProcess.val(process);
				}

				try {
					result = eval(showProcess.val());
					if (!isNaN(result)) {
						showResult.html(process + " = " + result);
						$("input[name='inputNum']").val(null);
						showProcess.val(result);
					}
				} catch (Exception) {
					alert("잘못된 수식입니다");
				}
			}); // end of 계산
			

			// 리셋
			clear.on("click", function() {
				$("input[name='inputNum']").val(null);
				showProcess.val(null);
				process = "";
				status = false;
			}); // end of 리셋
			

			// 더하기
			plus.on("click", function() {
				var inputNum = $("input[name='inputNum']").val();
				process = showProcess.val();

				if (inputNum != "") {
					$("input[name='inputNum']").val(null);
					process += (inputNum + "+");
				} else {
					if (isNaN(process.charAt(process.length - 1))) {
						process = process.replace(process
								.charAt(process.length - 1), "+");
					}
				}
				if (status) {
					process += (inputNum + "+");
					$("input[name='inputNum']").removeAttr("readOnly");
					$("input[name='inputNum']").attr("placeholder", "0");
					status = false;
				}
				showProcess.val(process);
			});// end of 더하기
			

			// 빼기
			minus.on("click", function() {
				var inputNum = $("input[name='inputNum']").val();
				process = showProcess.val();

				if (inputNum != "") {
					$("input[name='inputNum']").val(null);
					process += (inputNum + "-");
				} else {
					if (isNaN(process.charAt(process.length - 1))) {
						process = process.replace(process
								.charAt(process.length - 1), "-");
					}
				}

				if (status) {
					process += (inputNum + "-");
					$("input[name='inputNum']").removeAttr("readOnly");
					$("input[name='inputNum']").attr("placeholder", "0");
					status = false;
				}
				showProcess.val(process);
			}); // end of 빼기
			

			// 곱하기
			multiple.on("click", function() {
				var inputNum = $("input[name='inputNum']").val();
				process = showProcess.val();

				if (inputNum != "") {
					$("input[name='inputNum']").val(null);
					process += (inputNum + "*");
				} else {
					if (isNaN(process.charAt(process.length - 1))) {
						process = process.replace(process
								.charAt(process.length - 1), "*");
					}
				}

				if (status) {
					process += (inputNum + "*");
					$("input[name='inputNum']").removeAttr("readOnly");
					$("input[name='inputNum']").attr("placeholder", "0");
					status = false;
				}
				showProcess.val(process);
			}); // end of 곱하기

			
			// 나누기
			devide.on("click", function() {
				var inputNum = $("input[name='inputNum']").val();
				process = showProcess.val();

				if (inputNum != "") {
					$("input[name='inputNum']").val(null);
					process += (inputNum + "/");
				} else {
					if (isNaN(process.charAt(process.length - 1))) {
						process = process.replace(process
								.charAt(process.length - 1), "/");
					}
				}
				if (status) {
					process += (inputNum + "/");
					$("input[name='inputNum']").removeAttr("readOnly");
					$("input[name='inputNum']").attr("placeholder", "0");
					status = false;
				}
				showProcess.val(process);
			});// end of 나누기

			// 열린 괄호
			openBracket.on("click", function() {
				process = showProcess.val();

				if (!isNaN(process.charAt(process.length - 1))) {
					if (process != "") {
						alert("연산자를 먼저 입력하세요");
					} else {
						process += "(";
						showProcess.val(process);
					}
				} else {
					process += "(";
					showProcess.val(process);
				}
			});// end of 열린 괄호

			
			// 닫힌 괄호
			closeBracket.on("click", function() {
				var inputNum = $("input[name='inputNum']").val();
				process = showProcess.val();

				var count1 = 0;
				var count2 = 0;

				for (var i = 0; i < process.length; i++) {
					if (process.charAt(i) == "(") {
						count1 = Number(count1) + 1;
					} else if (process.charAt(i) == ")") {
						count2 = Number(count2) + 1;
					}
				}

				if (count1 > count2) {
					if (inputNum != "") {
						process += (inputNum + ")");
					} else {
						process += ")";
					}
					showProcess.val(process);
					$("input[name='inputNum']").val(null);
				} else {
					alert("열린 괄호 '" + "(" + "를 먼저 입력해주세요");

				}
			});// end of 닫힌 괄호

			
			// 이전
			back.on("click", function() {
				process = process.slice(0, -1);
				showProcess.val(process);

				if (isNaN(process.charAt(process.length - 1))) {
					$("input[name='inputNum']").removeAttr("readOnly");
					$("input[name='inputNum']").attr("placeholder", "0");
				} else {
					$("input[name='inputNum']").attr("readOnly", "readOnly");
					$("input[name='inputNum']").attr("placeholder", "연산자를 먼저 선택하세요");
					status = true;
				}
			});// end of 이전

		});// end of Ajax
