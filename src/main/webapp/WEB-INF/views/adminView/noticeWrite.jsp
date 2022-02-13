<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

              <div id="writeForm">
               <table class="table table-hover">    
                  
                   <thead>
                      <th><H2 > 공지사항을 작성합니다 </H2> </th>
                   </thead>
                   
                    <tbody>   
                        <tr>
                          <td>
                            <h3> 제목 </h3>   
                          </td>     
                        </tr>
                        <tr>   
                            <td>      
                                <textarea name="title" maxlength="30" style="resize: none; width:100%"; rows="1"; > </textarea>
                        	</td>                        											
                        </tr>
                        
                        <tr>                                                                               
                        	<td>
                        		<h3> 본문 </h3>
                            </td>		
                        </tr>
                        <tr>
                            <td>
              	 	  			<textarea name="content" maxlength="500" placeholder="(500자 입력제한)"  style="resize: none; width:100%"; rows="20";></textarea>
           					</td>	
                        </tr>
                    </tbody> 
                    
                    <tfoot>
                            <tr>
                        	 <td> 
                        	     <button class="btn btn-secondary" type="button" onclick="event();" style="float: left;">초기화</button>                                	                        	          
                            </td>
                            <td> 
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">              
								  <button class="btn btn-outline-warning me-md-2" type="submit" onclick="event();" style="float: left;">작성</button>									  	  
								</div>								                      	
				            </td>														
                        </tr>
                    </tfoot>   
                                    
                 </table>    
                </div>


</body>
</html>