<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>      
</head>
  
<style>
    .wrap{
        width: 100%;
        height: 100%;
        position:relative;
        box-sizing: border-box;
        margin: 0px;
    }
    
     .wrap>div{
        box-sizing: border-box;
        margin: 0px;
        display: inline-block;
    }
    
    #header{
        height: 10%;
        width: 100%;
    }    
    
    #body{
        height: 90%;
        width: 100%;
    }
    
    #aside{
        width: 15%;
        height: 100%;
        float: left;
    }
    
    .contents{
        width: 85%;
        height: 100%;
        float: left;
        text-align: center;
    }
    
    .search {
        height: 30%;
        float: left;
        margin:5px;
    }  

	.badge{
		cursor:pointer;
	}
        
</style>
          
<body>
   
   <div class="wrap"> 
   
   	
      <div id="header">  <%@ include file="/WEB-INF/views/adminView/adminHeader.jsp" %> </div>
       
       <div id="body">
          
         <div id="aside">  <%@ include file="/WEB-INF/views/adminView/adminAside.jsp" %>  </div>
           
         <div class="contents">
            
            <div class="search">
              <form action="/admin/memberSearch.do" method="get">	
                <select name="tag"> 
                    <option disabled selected>검색</option>
                    <option value="memberId">ID</option>
                    <option value="nickname">닉네임</option>
                    <option value="all">ID+이름</option>
                </select>
                <input type="text" name="keyword">
                <input type="submit" value="검색">                
              </form> 
            </div>
            
        	<div class="table">
                <table class="table table-hover" >        	 
                    <thead>
                        <tr style="text-align:center;">
                            <th>회원 번호</th>                            
                            <th>회원 ID</th>
                            <th>관리자 이름</th>
                            <th>반려동물 등록</th>
                            <th>가입일시</th>
                            <th>회원상태                             	 
                            </th>
                            <th>선택</th>                            
                        </tr>
                    </thead>
                    <tbody>
                   <c:choose>
                   
                   	<c:when test="${requestScope.map.list != null}">
                   		
                      <c:forEach items="${requestScope.map.list}" var="a">	
                        <tr>
                            <td> ${a.memberNo} </td>
                            <td> ${a.memberId} </td>
                            <td> ${a.nickname} </td>
                            <td> ${a.dogYN} </td>
                            <td> ${a.enrollDate} </td>
                            <td> ${a.memberStatus} </td>
                            <td> <input type="checkbox" value="${a.memberNo}"> </td>
                        </tr>                                                                 
                      </c:forEach>
                      
                    </c:when>
                    
                    	<c:otherwise>
                    		<tr> <td colspan="7"> 저장된 회원이 없습니다 </td>  </tr>
                    	</c:otherwise>
                    	
                   </c:choose>                                              
                    </tbody>
                    <tfoot style="text-align: center;">                            
    
                      	  <tr>
                        	   <td colspan="3"></td>
                           	   <td colspan="1">
                            	<nav aria-label="...">
									  <ul class="pagination">
								  			<li class="page-item"><a class="page-link" href="/admin/memberManage.do?currentPage=${requestScope.map.start}">처음</a></li>
    									  							
      										 ${requestScope.map.pageNavi}
									    
									    	<li class="page-item"><a class="page-link" href="/admin/memberManage.do?currentPage=${requestScope.map.end}">끝</a> </li>									    
 								  	</ul>
								</nav>
                           		</td>
                           		<td colspan="3"></td>
                        	</tr>                    	
              
                        <tr>
                            <td colspan="5"> 
                            	<button type="button" class="btn btn-success" onclick="pageRefresh();" style="float:left;">
                            		새로고침	
                            	</button>
                            </td>
                            
                            <td> 
                            	<button type="button" class="btn btn-secondary" onclick="allSelect();">
                            		전체선택	
                            	</button>
                            </td>
                            
                            <td>                                    
                                <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#gradeForm" onclick="printData();">
                                 	 변경
                                </button>
                                
                                <div class="modal fade" id="gradeForm" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-sm">
                                    <div class="modal-content">                                     
                                          <div class="modal-body">
                                            <br>
                                            	변경할 대상: <span id="selectMsg"> </span> 
                                            <br>	
                                              <select id="gradeValue"> 
                                                <option disabled selected> 상태 변경 </option>
                                                                                                                                        
                                                <option value="0">활성화</option>
                                                <option value="1">휴면</option>
                                                <option value="2">탈퇴</option>
                                              </select>                                                                                            
                                              
                                          </div>
                                      <div class="modal-footer">
                                      <button type="button" class="btn btn-outline-danger" onclick="statusChange();">실행</button>
                                      <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                            
                            </td>
                        </tr>                        
                    </tfoot>
                  </table>
             </div>   
               
           </div>
           
       </div>

   </div>

	<script>
		function printData(){		
			var dataArray = new Array();				
			$('input:checked').each(function(){
				dataArray.push( this.value );
			});
			if (dataArray != 0){
				$('#selectMsg').text(dataArray);
			}else{
				$('#selectMsg').text('선택된 대상이 없음');	
			}
	}	
	</script>
	
   <script>
		function statusChange(){
			var dataArray = new Array();
			var status = $('#gradeValue>option:selected').val();
			
			$('input:checked').each(function(){
				dataArray.push( this.value );
			})
			
			if( dataArray == 0 ){
				return false;
			}else{					
				$.ajax({
			    	url : "/admin/memberStatusChange.do",
			        type : "post",            
			        data : {"dataArray":dataArray,"status":status},			        
			        success : function(data) {           
			      if (data == 'pass') {            				          
			    	 alert('변경 성공');
			    	  $('#gradeForm').modal('hide');
			          location.reload();
			        }else{
			          $('#selectMsg').text('변경 실패');			        				     
			         }
			        },
			        error : function(data) {
			            alert("ajax error");
			        }			        
			    })
			}
		};   	
   </script>
      
   <script>  
   		
        $("tbody>tr").click(function(){        	           
        	// 1단계 행을 선택하면, 그 행이 속한 체크박스를 체크
        	var $test = $(this).children().eq(6);        	        	

        	// 2단계 다시 누르면 체크 해제           	
        	console.log($test.children().prop('checked'));
        	if ($test.children().prop('checked') == true) {
        		$test.children().prop('checked',false);
        		$test.parent().removeAttr("style");
        	}else{
        		$test.children().prop('checked',true);        		
        		$test.parent().css('background','grey');
        	}
        });       
   </script> 
   
   <script>
   		function pageRefresh(){
   			location.replace("/admin/memberManage.do");
   		};
   </script>
   
   <script>
   		function allSelect(){
   			if ($('input[type=checkbox]').prop('checked') == false ){
   				$('input[type=checkbox]').prop('checked',true);	
   			}else{
   				$('input[type=checkbox]').prop('checked',false);
   			}
   			
   		}
   </script>
   
</body>
</html>