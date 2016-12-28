<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <!-- /.col -->
${followerList} 
        <div class="modal fade" id="followerList" >
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"> x</button>
                        <h4 class="modal-title">나를 추가한 사람들</h4>
                    </div>
                    <div class="modal-body">
                            ${followerList} 
                       <!--  body -->
                    </div>
                    <div class="modal-footer">
                        <!-- Footer -->
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        
        