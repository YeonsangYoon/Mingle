/**
 * 
 */
 
 'use strict'
const number = document.getElementById('snumber');
const arrowLeft = document.getElementById('sarrowLeft');
const arrowRight = document.getElementById('sarrowRight');
let minNumber = 1;
let maxNumber = 10;
number.addEventListener('change', function () {
	if (Number(number.value) < minNumber) {
		number.value = minNumber;
	} else if (Number(number.value) > maxNumber) {
		number.value = maxNumber;
	}
});
arrowLeft.addEventListener('click', function () {
	if (number.value === '' || number.value === null || number.value === undefined) {
		number.value = 0;
	} else if (Number(number.value) <= minNumber) {
		number.value = minNumber;
	} else {
		number.value = Number(number.value) - 1;
	}
});
arrowRight.addEventListener('click', function () {
	if (number.value === '' || number.value === null || number.value === undefined) {
		number.value = 0;
	} else if (Number(number.value) >= maxNumber) {
		number.value = maxNumber;
	} else {
		number.value = Number(number.value) + 1;
	}
});

function requestPay(t) {
	let price = $('#totalAmount').text().replace('원','');
	price = price.replace(',','');
	let sname = $('#sname').text();
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp01661305"); // 예: imp00000000
	// IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({
		pg: 'html5_inicis', // version 1.1.0부터 지원.
		pay_method: 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
		merchant_uid: 'merchant_' + new Date().getTime(),
		name: sname,
		amount: Number(price),
		buyer_email: '1004dustkd@gmail.com',
		buyer_name: '윤연상',
		buyer_tel: '010-1234-5678',
		buyer_addr: '서울특별시 마포구 서교동',
		buyer_postcode: '121-210',
		app_scheme: 'iamporttest' //in app browser결제에서만 사용 
	}, function(rsp) {
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
		} else {
			$('#book-form').submit();
		}
	})
}

