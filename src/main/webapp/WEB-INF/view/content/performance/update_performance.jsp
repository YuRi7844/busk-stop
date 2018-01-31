<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript" src="${initParam.rootPath }/resource/jquery/jquery.timepicker.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#regBtn").on("click", function(){
		$("#performanceDate").val($("#performanceDay").val() + " " + $("#performanceTime").val());
		$("#stageRegForm").submit();
	});
	
	$("#selectStage").on("click", function(){
		
	});
	
	$("#searchStage").on("click", function(){
		var address = "${initParam.rootPath}/searchStageByAddress.do"; //doGet()방식으로 요청
		left1 = (screen.availWidth - 600) / 2;
		top1 = (screen.availHeight - 500) / 2;
		window.open(address, "newWin", 'width=600 ,height=500 ,top=' + top1 + ',left=' + left1 + ',resizable=no');
	});
	
	$('input.timepicker').timepicker({
		
	});
	
	$("#performanceTime").timepicker({
		timeFormat: 'HH:mm',
	    interval: 60,
	    minTime: '00',
	    maxTime: '23:00',
	    defaultTime: '11',
	    startTime: '00:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
});
</script>
<link rel="stylesheet" href="${initParam.rootPath }/resource/css/jquery.timepicker.min.css">
	<h4 style="margin-left: 20px;"><b>공연정보 수정</b></h4>
	<hr>
	<form action="${initParam.rootPath }/performanceUpdate2.do"
		method="post" enctype="multipart/form-data" id="stageRegForm"
		style="width: 60%;" class="performance_register_form center-block">
	
 		<div class="form-group" style="display: none;">
			<label for="no">공연 번호 </label> <input type="text"
				name="performanceNo" id="no" class="form-control"
				value="${param.performanceNo}" readonly>
				
		</div>
		<div class="form-group">
			<label for="id">수정할 공연 이름 </label> <input type="text"
				name="performanceName" id="name" class="form-control"
				value="${requestScope.Performance.performanceName }">
		</div>
		<div class="form-group">
			<label for="title">수정할 게시글 제목 </label> <input type="text"
				name="performanceTitle" id="title" class="form-control"
				value="${requestScope.Performance.performanceTitle }">
		</div>
		<div class="form-group">
			<label for="location">수정할 공연 위치 </label> <input type="text"
				name="performanceLocation" id="performanceLocation" class="form-control"
				value="${requestScope.Performance.performanceLocation }"  readonly="readonly" placeholder="버튼을 통해 장소를 검색해 주세요.">
			<input type="button" id="searchStage" value="직접 검색" class="btn btn-default col-sm-2"><br>
		</div>
		<br>
		<div class="form-group col-sm-6">
			<label class="col-sm-6">공연일시</label> 
			<input type="date" name="performanceDay" id="performanceDay" class="form-control">
		</div>
		<div class="form-group col-sm-6">
			<label class="col-sm-6">공연시간</label>
			<input type="timepicker" name="performanceTime" id="performanceTime" class="form-control" required="required" readonly="readonly" style="background-color: #fff;">
		</div>
		<div class="form-group" style="display: none;">
			<input type="datetime" readonly="readonly" name="performanceDate" id="performanceDate" class="form-control" required="required">
		</div>
		
		<label for="content">수정할 공연 내용 </label>
		<div class="form-group">
			<textarea rows="15" class="form-control col-sm-12" style="resize: none;" name="performanceContent" >${requestScope.Performance.performanceContent}</textarea>
		</div>

		<div class="form-group">
			<label for="performanceImage">이미지</label> <input type="file"
				name="multiImage" id="multiImage" class="form-control">
		</div>

		<div class="form-group" style="display: none;">
			 <label for="userId">사용자 id </label> 
			<input type="text"
				name="performanceUserId" id="performanceUserId" class="form-control"
				value="<sec:authentication property="principal.userId"/>" readonly>
		</div>


		<button type="button" class="btn btn-default" id="regBtn">정보수정</button>
		<button type="button" class="btn btn-default" onclick="history.back();">취소</button>

		<sec:csrfInput />
		<%-- csrf 토큰 --%>

	</form>