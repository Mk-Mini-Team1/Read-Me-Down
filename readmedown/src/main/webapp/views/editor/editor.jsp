<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="/images/logo-pencil.png" />
<link rel="apple-touch-icon" href="/images/logo-pencil.png" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/editor/editor.css" />
<link rel="stylesheet" href="/css/editor/editorMenu.css" />
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<!-- Toast UI Editor -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<link rel="stylesheet" href="/css/editor/editor-dark.css"/>
<link rel="stylesheet" href="/css/editor/editor-light.css"/>
<!-- Toast UI Editor Color Picker -->
<link rel="stylesheet" href="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.css"/>
<!-- <link rel="stylesheet"href="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.css"/> -->
<link rel="stylesheet" href="/css/editor/toast-color-plugin.css"/>
<script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.js"></script>
<script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>
	<!-- Toast UI Editor Code Highlight -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.23.0/themes/prism.min.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight.min.css"/>
<script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
</head>
<body style="height: 100%;">
	<jsp:include page="../header.jsp" />
	
	<div id="main_box" style="height: 100%;">
		<div id="main_contents" style="height: 100%;">
			<jsp:include page="editorMenu.jsp" />
			<div id="editor"></div>
		</div>
	</div>

	<jsp:include page="badges.jsp" />
	<jsp:include page="activityGraph.jsp" />
	<jsp:include page="readmeStats.jsp" />

	<script src="/js/editor/editor.js"></script>
</body>
</html>
