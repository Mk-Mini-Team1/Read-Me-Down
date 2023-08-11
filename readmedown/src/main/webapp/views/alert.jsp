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
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
</head>
<script>
	let msg = "<c:out value='${msg}' />";
	let url = "<c:out value='${url}' />";

	alert(msg);
	location.href = url;
</script>
</html>
