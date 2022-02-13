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
        display: flex;
    }    
    
    #adminForm{
       margin: 0 auto;
        width: 90%;
    } 
    
</style>
          
<body>
   
<div class="wrap"> 

       <div id="header">  <%@ include file="/WEB-INF/views/adminView/adminHeader.jsp" %> </div>
       
       <div id="body">
          
         <div id="aside">  <%@ include file="/WEB-INF/views/adminView/adminAside.jsp" %>  </div>
           
             <div class="contents">
                       
              <div id="adminForm">
               <table class="table table-hover">    
                  
                   <thead>
                      <tr>
                      <H2 > 사용중인 계정의 정보를 변경합니다 </H2>
                      </tr>
                      <th> <span> 변경시 안내사항: &nbsp; </span> <span style="color: red" id="msg"> </span> </th>
                   </thead>
                   
                    <tbody>   
                        <tr>
                          <td>
							관리자 번호: ${sessionScope.adminVO.adminNo}                           
                          </td>     
                        </tr>
                        <tr>   
                          <td>
							ID: ${sessionScope.adminVO.adminID}
                          </td>     
                        </tr>                                                
                        <tr>   
                          <td>
                           암호 변경: <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#pwdChangeForm">
  							클릭해서 변경
					    </button>
                          </td>     
                        </tr>                                                
                        <tr>   
                          <td>
                           이름 변경: <input type="text" id="adminName" maxlength="4" value="${sessionScope.adminVO.adminName}" />
                          </td>     
                        </tr>
                        <tr>   
                          <td>
                           이메일 변경: <input type="text" id="adminEmail" maxlength="30" value="${sessionScope.adminVO.adminEmail}" />
                          </td>     
                        </tr>
                        <tr>   
                          <td>
							관리자등급: ${sessionScope.adminVO.adminGrade}
                          </td>     
                        </tr>
                        <tr>   
                          <td>
							계정생성일: ${sessionScope.adminVO.adminDate}
                          </td>     
                        </tr>
                    </tbody> 
                    
                    <tfoot>
                            <tr>
                        	 <td> 
                        	     <button class="btn btn-secondary" type="button" onclick="refresh();" style="float: left;">새로고침</button>                                	                        	          
                            </td>
                            <td> 
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">              
								  <button class="btn btn-warning me-md-2" type="submit" onclick="return info();" style="float: left;">수정</button>									  	  
								</div>								                      	
				            </td>														
                        </tr>
                    </tfoot>   
                                    
                 </table>    
                </div>                	         	                 
                
            </div>
            
 <div class="modal fade" id="emailChkForm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="adminEmailCheck">Email 입력칸입니다</h5>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="inputID" class="col-form-label">Email 입력:</label>
            <input type="text" class="form-control" id="inputEmail" maxlength="30" >
          </div>
                    
          <div class="mb-3">
            <label for="chkResult" class="col-form-label">변경 여부:</label>
            <span id="chkResult" style="color: red"> </span>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-outline-danger" onclick="return emailCheck();">사용</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="pwdChangeForm" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="pwdChangeLabel">암호를 변경합니다</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form>
          <div class="mb-3">
            <label for="originalPWD" class="col-form-label">기존 암호 입력:</label>
            <input type="password" class="form-control" id="oldPWD" maxlength="20" >
          </div>
          
          <div class="mb-3">
            <label for="newPWD" class="col-form-label">변경할 암호 입력:</label>
            <input type="password" class="form-control" id="newPWD" maxlength="20" >
          </div>
          
          <div class="mb-3">
            <label for="newPWD_Re" class="col-form-label">변경할 암호 재입력:</label>
            <input type="password" class="form-control" id="pwdRe" maxlength="20" >
          </div>
                    
          <div class="mb-3">
            <label for="chkResult" class="col-form-label">알림:</label>
            <span id="chkMsg" style="color: red"> </span>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-outline-danger" onclick="return pwdChange();">변경</button>
      </div>
    </div>
  </div>
</div>
               
         </div>  
           
 </div>        
 
	<script>
		function pwdChange(){
			var pwdCheck =  /^(?=.*[a-z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,20}$/;			
			var aID = '<c:out value="${sessionScope.adminVO.adminID}" />';
			var oldPWD = $('#oldPWD').val();
			var newPWD = $('#newPWD').val();
			var pwdRe = $('#pwdRe').val();
			var msg = $('#chkMsg');
			
			 if ( oldPWD.length == 0 ) {
					msg.text("사용중인 암호를 입력하세요");			
					return false;
				} else if (!pwdCheck.test(newPWD) ) {
					msg.text("10~20자의 영문 소문자와 숫자,특수문자로 구성해야 합니다");			
					return false;	
				} else if (newPWD.length == 0 ) {
						msg.text("변경할 암호를 입력하세요");			
						return false;								 
				} else if (newPWD != pwdRe ) {
						msg.text('입력한 암호가 불일치 합니다');			
					return false;
				}else{					
					 $.ajax({
					    	url : "/admin/updatePWDChange.do",
					        type : "post",            
					        data : {"adminID":aID, "oldPWD":oldPWD, "newPWD":newPWD },
					        
					        success : function(data) {           
					      if (data == 'true')	{            	
					          alert('변경완료');
					          location.reload();
					      }else if (data == 'invalid') {
					    	  msg.text('사용중인 암호를 확인하세요'); 
					      }else{
					         msg.text('변경실패');
					         }			        
					        },
					        error : function(data) {
					            alert("ajax error");
					        }
					    });
					}		
		}	
	</script>
    
   <script>   
    $('#adminEmail').focusin(function() {
    	var myModal = new bootstrap.Modal(document.getElementById('emailChkForm'), focus);
    	myModal.show()
	});    
   </script>
   
   <script>
   		function emailCheck(){
   	     var emailCheck=  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
   		 var spaceCheck = /\s/g;   		 
   		 var chkData = $('#inputEmail').val();
   		 
   		 if (chkData.length > 30 ) {
   			$('#chkResult').text("email은 30자 이내로 허용됩니다");
             return false;
         } else if (!emailCheck.test( chkData ) ) {
        	 $('#chkResult').text("유효한 형식이 아닙니다");                                      
             return false;              
         } else if (spaceCheck.test( chkData ) ) {
        	 $('#chkResult').text("입력값에 공백이 있습니다");                                      
             return false; 
             
         } else {        	 
			    $.ajax({
			    	url : "/admin/adminEmailCheck.do",
			        type : "post",            
			        data : {"chkMail":chkData},
			        
			        success : function(data) {           
			      if (data == 'pass') {            				          
			    	  $('#adminEmail').val(chkData);
			    	  $('#emailChkForm').modal('hide');
			          
			        }else if (data == 'false') {
			        	$('#chkResult').text(" 중복 EMAIL");
			        
			        }else if (data == 'invalid') {
			        	$('#chkResult').text(" email형식을 확인하세요");		 
			         }				      
			        },
			        error : function(data) {
			            alert("ajax error");
			        }
			    })        	 
         	}    		 
   		}   
   </script>
      
   <script>
        function info(){        
        var nameCheck = /^[가-힣]{2,4}$/;
        var emailCheck=  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		var spaceCheck = /\s/g;        
		var msg = $('#msg');
		
		var adminName = $('#adminName').val();
		var adminEmail = $('#adminEmail').val();
        
			if ( !nameCheck.test($('#adminName').val() )) {
                alert("이름은 2~4글자의 한글만 입력 바랍니다");        
                return false;
            }else if (spaceCheck.test($('#adminName').val() )) {
                alert("입력값에 공백이 있습니다");                                      
                return false;
            }else if ( !emailCheck.test($('#adminEmail').val() )) {
                alert("이메일 주소 형식을 확인바랍니다");
                return false;            
            }else if (spaceCheck.test($('#adminEmail').val() )) {
                alert("입력값에 공백이 있습니다");                                      
                return false;
       
            }else{               
                var adminID = '<c:out value="${(sessionScope.adminVO.adminID)}" />';
				var adminData = {"adminID":adminID,"adminName":adminName,"adminEmail":adminEmail};
				
			    $.ajax({
			    	url : "/admin/updateAdminAccount.do",
			        type : "post",            
			        data : adminData,
			        
			        success : function(data) {           
			      if (data == 'pass')	{            	
			          alert('변경 완료');
			          location.reload();
			        }else if (data == 'invalid'){
			        	msg.text('입력한 값을 확인하세요');
			        }else{
			        	msg.text('변경 실패');
			        }			      
			        },
			        error : function(data) {
			            alert("ajax error");
			        }
			    })                
            }      
        }

   </script>

   <script>
        $("tr>td").click(function(){
            $(this).children().focus();
        });       
   </script>   

   <script>

    $('#adminName').on('keyup' ,function(event) { 
        var nameCheck = /^[가-힣]{2,4}$/;
        var spaceCheck = /\s/g;
        var $msg = $('#msg');  
        
           if ( !nameCheck.test(adminName.value) ) {
                $msg.html("이름은 공백을 제외한 2~4글자의 한글만 입력 바랍니다");                                                  
            }else if (spaceCheck.test(adminName.value) ) {
                $msg.html("입력값에 공백은 포함불가입니다");  
            }else{
                $msg.html("");                                      
            } 
     });    

     $('#adminEmail').on('keyup' ,function(event) { 
        var emailCheck=  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
        var spaceCheck = /\s/g;
        var $msg = $('#msg');                
           if ( !emailCheck.test(adminEmail.value) ) {
                $msg.html("이메일 주소 형식을 확인바랍니다");
            }else if (spaceCheck.test(adminEmail.value) ) {
                $msg.html("입력값에 공백은 포함불가입니다"); 
            }else{
                $msg.html("");                                      
            }  
     }); 
    
   </script>
   
   <script>
   	function refresh(){
		location.reload();
	}
    </script>
          
        
</body>
</html>