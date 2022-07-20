  // 달력 생성
  const makeCalendar = (date) => {

    // 현재의 년도와 월 받아오기
    const nowYear = new Date(date).getFullYear();
    const nowMonth = new Date(date).getMonth() + 1;

    // 지난달의 마지막 요일
    const prevDay = new Date(nowYear, nowMonth - 1, 1).getDay();

    // 현재 월의 마지막 날 구하기
    const lastDay = new Date(nowYear, nowMonth, 0).getDate();
    
    // 남은 박스만큼 다음달 날짜 표시
    let nextDay = (prevDay + lastDay) % 7;
    
    if (nextDay == 0) nextDay = 7;

    let htmlDummy = '';

    // 전달 날짜 표시하기
    for (let i = 0; i < prevDay; i++) {
      htmlDummy += `<div class="noColor"></div>`;
    }

    // 현재 날짜 표시하기
    for (let i = 1; i <= lastDay; i++) {
      if (
        i === new Date().getDate() &&
        date.getMonth() === new Date().getMonth()
      ) {
        htmlDummy += `<div class="today">${i}</div>`;
      } else {
        htmlDummy += `<div>${i}</div>`;
      }
    }

    // 다음달 날짜 표시하기
    for (let i = nextDay; i < 7; i++) {
      htmlDummy += `<div class="noColor"></div>`;
    }


    document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
    document.querySelector(`.dateTitle`).innerText = `${nowYear}년 ${nowMonth}월`;

    // 날짜 클릭
    $(document).on('click', '.grid.dateBoard>div', function(){
      let i = $(this).text()

      console.log(i)
      const modal = document.getElementById('modal');
      // id값이 modal인 속성을 찾아서 modal변수에 할당

      const button = document.getElementById('btn');
      // id값이 btn인 속성을 찾아서 button변수에 할당

      const span = document.querySelector('.close');
      // class값이 close인 속성을 찾아 span변수에 할당


      //날짜를 클릭했을때 modal창을 보여준다.
      modal.style.display = 'block';
      

      //X버튼을 클릭했을때 modal창을 닫는다.(안보이게 한다.)
      span.onclick = function() {
          modal.style.display = 'none';
      }

      //사용자가 모달창 외부의 아무 곳이나 클릭하면 모달창을 닫는다.(안보이게 한다.)
      window.onclick = function(event) {
          if(event.target == modal) {
              modal.style.display = 'none';
          }
      }

    })





    //탭 메뉴
    $(document).ready(function(){
   
      $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');
    
        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');
    
        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
      })
    
    });
    

  }
   


window.onload = () => {
  const date = new Date();
 
  makeCalendar(date);
  
  // 이전달 이동
  document.querySelector(`.prevDay`).onclick = () => {
    makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
  }
  
  // 다음달 이동
  document.querySelector(`.nextDay`).onclick = () => {
    makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
  }

  // 오늘 날짜로 이동
  document.querySelector('.today_btn').onclick = () => {
    makeCalendar(new Date());
  }
};