<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR&display=swap');  
    
    * {
        font-family: 'noto sans kr'; 
    }
    
    .asideWrap{
        width: 100%;
        height: 100%;   
        
        box-sizing: border-box;
        margin: 0px;
        position: relative;        
    }


    .highlight:hover {     
     transition-property: transform;
     transition-duration: 0.2s;
     transform:translateX(20px);
        
	}
    
    ul>li:hover .highlight:after{
  width:100%;
    }
    
.highlight{
  display: inline-block; 
  position: relative;
}
.highlight:after{
  content:"";
  width: 0;
  height: 10px;
  display: inline-block;
  background: #ff8a40;
  opacity:0.7;
  position: absolute;
  bottom:0;
  left:0;
  z-index:-1;
  transition: 0.2s all;
}
    
    .category{
    cursor:pointer;
    padding: 3px;    
    }

    li>span{
        cursor: pointer;
        font-size: 20px;
    }
    ul {
        display: none;
    }    

</style>        
</head>


<body>
    
 <div id="asideWrap"> 
   
       <div style="border-right: 2px solid black;">
       
        <H2 class="category"> 회원 관리 </H2>       
        <ul>
            <li> <span class="highlight" onclick="memberManage();">  사용자 상태 변경 </span>  </li>            
            <%-- <li> <span class="highlight" onclick="tempManage();"> 임시조치  </span> </li> --%>     
        </ul>
        
       <H2 class="category"> 커뮤니티 게시판 </H2>       
        <ul>
          <li> <span class="highlight" onclick="noticeWrite()"> 공지사항 작성  </span> </li>
          <li> <span class="highlight" onclick="noticeManage()"> 공지사항 수정/삭제 </span> </li>
          <li> <span class="highlight" onclick="boardManage();"> 게시물 삭제  </span>  </li>
        </ul>
       
        <H2 class="category"> 관리자 계정 </H2>       
        <ul>
            <li> <span class="highlight" onclick="adminAccount();"> 추가  </span> </li>  
            <li> <span class="highlight" onclick="adminManage()" > 권한 조정 / 삭제 </span> </li>
            <li> <span class="highlight" onclick="adminInfo()" > 나의 정보 확인 / 변경 </span> </li>
        </ul>
       
        <H2 class="category"> 친구찾기 게시판 </H2>       
        <ul>
            <li> <span class="highlight" onclick="neighborManage();"> 신고처리 </span> </li>
        </ul>

        <H2 class="category"> 사용자 문의 </H2>       
        <ul>
            <li> <span class="highlight" onclick="cs();"> 준비중 </span> </li>   
        </ul>            
        
      </div>
        
</div>
    
    <script>
            $(".category").click(function(){
            	 $(this).next().slideToggle(500);
            });    
        
    </script>
    
    <script>
        function memberManage(){
           location.replace("/admin/memberManage.do");  
        }
        
        function tempManage(){
            alert('준비중인 기능');
        }
        
        function noticeWrite(){
           location.replace("/admin/noticeWrite.do");  
        }
        
        function noticeManage(){
           location.replace("/admin/noticeManage.do");  
        }
        
        function boardManage(){
            location.replace("/admin/boardManage.do")
        }
        
        function adminAccount(){
           location.replace("/admin/adminAccount.do");  
        }
        
        function adminManage(){
           location.replace("/admin/adminManage.do");  
        }
        
        function neighborManage(){
           location.replace("/admin/neighborManage.do");  
        }
        
        function adminInfo(){
            location.replace("/admin/adminInfo.do");  
         }
        
        function cs(){
           alert('준비중인 기능');
        }
        
        
    </script>
    
</body>
</html>