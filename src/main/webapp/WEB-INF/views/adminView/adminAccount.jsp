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
                      <H2> 관리자를 등록합니다 </H2>
                      </tr>
                      <th> <span> 등록시 안내사항: &nbsp; </span> <span style="color: red" id="msg"> </span> </th>
                   </thead>
                   
                    <tbody>   
                        <tr>
                          <td>
                           ID 입력: <input type="text" id="adminId" maxlength="15" />
                          </td>     
                        </tr>
                        <tr>   
                          <td>
                           암호 입력: <input type="password" id="adminPwd" maxlength="20" />
                          </td>     
                        </tr>                                                
                        <tr>   
                          <td>
                           암호 재입력: <input type="password" id="adminPwdRe" maxlength="20" />
                          </td>     
                        </tr>
                        <tr>   
                          <td>
                           이름 입력: <input type="text" id="adminName" maxlength="4" />
                          </td>     
                        </tr>
                        <tr>   
                          <td>
                           이메일 입력: <input type="text" id="adminEmail" maxlength="30" />
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
								  <button class="btn btn-outline-warning me-md-2" type="submit" onclick="return join();" style="float: left;">생성</button>									  	  
								</div>								                      	
				            </td>														
                        </tr>
                    </tfoot>   
                                    
                 </table>    
                </div>                	         	                 
                
            </div>
            
 <div class="modal fade" id="idChkForm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="adminIDCheck">ID 중복을 확인하세요</h5>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="inputID" class="col-form-label">ID 중복검색:</label>
            <input type="text" class="form-control" id="inputID" maxlength="15" placeholder="확인할 ID를 입력해주세요" >
          </div>
          
          <div class="mb-3">
            <label for="chkResult" class="col-form-label">검색결과:</label>
            <span id="chkResult" style="color: red"> </span>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-outline-danger" onclick="return idCheck();">검사</button>
      </div>
    </div>
  </div>
</div>
               
         </div>

 </div>        
 
   <script>   
    $('#adminId').focusin(function() {
    	var myModal = new bootstrap.Modal(document.getElementById('idChkForm'), focus);
    	myModal.show()
	});    
   </script>
   
   <script>
   		function idCheck(){
   		 var idCheck = /^[a-z]{6,15}$/;
   		 var spaceCheck = /\s/g;   		 
   		 var chkData = $('#inputID').val();
   		 
   		 if (!idCheck.test( chkData ) ) {
             alert("ID는 6~15자 이내의 영문 소문자만 허용됩니다");
             return false;
         } else if (spaceCheck.test( chkData ) ) {
             alert("입력값에 공백이 있습니다");                                      
             return false; 
             
         } else {        	 
			    $.ajax({
			    	url : "/admin/adminIDCheck.do",
			        type : "post",            
			        data : {"chkID":chkData},
			        
			        success : function(data) {           
			      if (data == 'pass') {            				          
			    	  $('#adminId').val(chkData);
			    	  $('#idChkForm').modal('hide');
			          
			        }else if (data == 'false') {
			        	$('#chkResult').text(" 중복 ID");
			        
			        }else if (data == 'invalid') {
			        	$('#chkResult').text(" 유효하지 않은 값");		 
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
        function join(){
        var idCheck = /^[a-z]{6,15}$/;
        var pwdCheck =  /^(?=.*[a-z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,20}$/; 
        var nameCheck = /^[가-힣]{2,4}$/;
        var emailCheck=  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		var spaceCheck = /\s/g;        
        
            if (!idCheck.test( $('#adminId').val() ) ) {
                alert("ID는 6~15자 이내의 영문 소문자만 허용됩니다");
                return false;
            } else if (spaceCheck.test($('#adminId').val() ) ) {
                alert("입력값에 공백이 있습니다");                                      
                return false;   
            
            } else if (!pwdCheck.test($('#adminPwd').val() )) {
                alert("암호는 10~20자의 영문 소문자와 숫자,특수문자로 구성해야 합니다");       
                return false;
            }else if (spaceCheck.test($('#adminPwd').val() )) {
                alert("입력값에 공백이 있습니다");                                      
                return false;       
            }else if ( $('#adminPwdRe').val() != $('#adminPwd').val()  ) {
                alert("재입력한 암호가 불일치 합니다");     
                return false;
            }else if ( !nameCheck.test($('#adminName').val() )) {
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
                var adminID = $('#adminId').val();
				var adminPWD = $('#adminPwd').val();
				var adminName = $('#adminName').val();
				var adminEmail = $('#adminEmail').val();				
				
				var adminData = {"adminID":adminID,"adminPWD":adminPWD,"adminName":adminName,"adminEmail":adminEmail};
				
			    $.ajax({
			    	url : "/admin/insertAdminAccount.do",
			        type : "post",            
			        data : adminData,
			        
			        success : function(data) {           
			      if (data == 'pass')	{            	
			          alert('계정 추가 완료');
			          location.reload();
			        }else if (data == 'invalid'){
			        	alert('유효하지 않은 값 입력');
			        }else{
			        	alert('추가 실패');
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
        $("tr>td").click(function(){
            $(this).children().focus();
        });       
   </script>   

   <script>
    $('#adminId').on('keyup' ,function(event) { 
        var idCheck = /^[a-z]{6,15}$/;       
		var spaceCheck = /\s/g;
        var $msg = $('#msg');
        
         if (!idCheck.test(adminId.value)) {
                $msg.html("ID는 공백을 제외한 6~15자 이내의 영문 소문자만 허용됩니다");                                      
            }else if (spaceCheck.test(adminId.value) ) {
                $msg.html("입력값에 공백은 포함불가");                                      
            }else{
                $msg.html("");                                      
            }    
    }); 
       
    $('#adminPwd').on('keyup' ,function(event) {     
        var pwdCheck =  /^(?=.*[a-z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,20}$/;
        var spaceCheck = /\s/g;
        var $msg = $('#msg');
       
           if (!pwdCheck.test(adminPwd.value)) {
                $msg.html("암호는 공백을 제외한 10~20자 이내의 영문 소문자와 숫자,특수문자로 구성되어야합니다");    
            }else if (spaceCheck.test(adminId.value) ) {
                $msg.html("입력값에 공백은 포함불가입니다");  
            }else{
                $msg.html("");                                      
            }  
     }); 
       
    $('#adminPwdRe').on('keyup' ,function(event) {  
        var $msg = $('#msg');
         if ( $('#adminPwdRe').val() != $('#adminPwd').val()  ) {
                $msg.html("재입력한 암호가 불일치 합니다");                
            }else{
                $msg.html("");                                      
            }          
    });
          
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