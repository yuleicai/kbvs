<!DOCTYPE html>
<html> 
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>在线浏览 ${attachmentDto.name }</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
	</head>

	<body>
		<c:set var="response_success" value="<%=com.ghs.kbvs.constants.KbvsConstant.RESPONSE_SUCCES %>"/>
		<c:set var="file_type_pdf" value="<%=com.ghs.kbvs.upload.constants.DocFileTypeEnum.PDF.getType() %>"/>
		<c:set var="file_type_mp3" value="<%=com.ghs.kbvs.upload.constants.AudioFileTypeEnum.MP3.getType() %>"/>
		<c:set var="file_type_mp4" value="<%=com.ghs.kbvs.upload.constants.VideoFileTypeEnum.MP4.getType() %>"/>
		<div class="container">
			<div class="row logorow">
				<div class="col-xs-3 col-sm-4 col-md-4 col-lg-4"><a href="/"><img class="logoimg" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/images/zsk-logo.png" /></a></div>
			</div>
		</div>
		<div class="rowline"></div>	
		<div class="container">
			<div class="syswhite yigebiao text-center ">
				<c:choose>
					<c:when test="${response_success == response }">
						<p class="h2 text-center">${attachmentDto.name }</p>
						<c:if test="${attachmentDto.fileType == file_type_pdf }">
							<embed height="1000px" width="100%" src="${attachmentDto.previewUrl }" />
						</c:if>
						<c:if test="${attachmentDto.fileType == file_type_mp3 }">
							<div class="text-center">
								<audio controls="controls">
									<source src="song.ogg" type="audio/ogg">
									<source src="${attachmentDto.previewUrl }" type="audio/mpeg">
								</audio>
							</div>
						</c:if>
						<c:if test="${attachmentDto.fileType == file_type_mp4 }">
							<video  width="auto" height="auto"  controls="controls">
								<source src="${attachmentDto.previewUrl }" type="video/mp4"></source> 
							</video>
						</c:if>
					</c:when>
					<c:otherwise>
						<p class="h3 text-center">${response }</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</body>
</html>