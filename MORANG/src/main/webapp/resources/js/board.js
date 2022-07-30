// 페이지가 열릴때, 실행
   $(document).ready(()=>{
	// ajax통신, 글데이터 가져오기
	$.ajax({
	   url : 'boardList.do', //어디로 요청을 보낼 것인가?
	   type : 'post',
	   data : {
	   },
	   success : function(res){
		  console.log(res[0].title);
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


function open(c_seq){
	
	let c_likes = Number($('#c_likes'+c_seq).html());
	$.ajax({
		url : 'viewUpdate.do',
		type : 'post',
		data : {
			'c_seq' : c_seq,
			'c_likes' : c_likes+1
		},
		success : function(res){
			// 기존에 있던 조회수를 바꿔줘야함
			$('#c_likes'+c_seq).html(c_likes+1)
		},
		error : function(e){alert('error!')}
	})

	 $('#board'+c_seq).css('display','table-row');
 
}
