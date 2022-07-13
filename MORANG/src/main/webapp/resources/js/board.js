// 페이지가 열릴때, 실행
   // $(document).ready(function(){})
   //(x)=> == function(x)
   $(document).ready(()=>{
	// ajax통신, 글데이터 가져오기
	$.ajax({
	   url : 'boardList.do', //어디로 요청을 보낼 것인가?
	   type : 'post',
	   data : {
		  // 'key(name)' : value
	   },
	   //dataType : 'json', //응답받는 데이터가 어떤 형태인지
	   //json java script object natation -> String
	   success : function(res){
		  //요청이 성공했을때 실행되는 Call back 함수
		  // res --> 응답받는 데이터가 담기는 변수
		  console.log(res[0].title);
		  //table에 출력
		  // 출력대상선택
		  // $('선택자').html('코드') : 덮어쓰기
		  // $('선택자').after('코드') : 태그 바로 뒤에(다음줄)
		  // $('선택자').before('코드') : 태그 바로 앞에(이전줄)
		  // $('선택자').append('코드') : 태그 안에(뒤) 누적
		  // $('선택자').prepend('코드') : 태그 안에(앞) 누적
		  $('tbody').html('');
		  for(let i=0; i<res.length; i++){
			 tr = `
				<tr>
				 <td>${res[i].idx}</td>
				 <td><a href='javascript:open(${res[i].idx})'>${res[i].title}</a></td>
				 <td>${res[i].writer}</td>
				 <td>${res[i].indate}</td>
				 <td id="count${res[i].idx}">${res[i].count}</td>
				 </tr>   
				   <tr id="board${res[i].idx}" style = "display:none">
						 <td colspan="5">
						 <textarea rows="5" class = "form-control">${res[i].content}</textarea>
						 </td>
					 </tr>         
			 `;
			 $('tbody').append(tr)
		  }
		  //테스트
	   },
	   error : function(e){
		  // 404, 405, 500 --> 요청 자체가 실패 
		  // exception e --> 어떤 에러인지 담기는 변수
		  alert('error');
	   }
	});
 })

// ======================== ajax =================================


function open(idx){
	// 조회수 업데이트 하기
	// 태그 안에 있는 값??
	// .text()
	// .html() : 닫는 태그가 있는 경우 사용
	// .val() : 닫는 태그가 없는 경우 사용
	
	let count = Number($('#count'+idx).html());
	$.ajax({
		url : 'viewUpdate.do',
		type : 'post',
		data : {
			'idx' : idx,
			'count' : count+1
		},
		success : function(res){
			// 기존에 있던 조회수를 바꿔줘야함
			$('#count'+idx).html(count+1)
		},
		error : function(e){alert('error!')}
	})




	// #board
	// $('선택자').css('스타일이름') : 해당하는 스타일 값을 리턴
	// $('선택자').css('스타일이름','바꿔줄값) : CSS옵션을 수정시켜주는 함수
	 $('#board'+idx).css('display','table-row');
 


}
