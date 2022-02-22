<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<head>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	list-style: none;
	text-decoration: none;
	font-family: arial
}

body {
	background: #f3f5f9
}

.wrapper {
	position: relative
}

.sidebar {
	position: fixed;
	width: 300px;
	height: 100%;
	background: #000000e0;
	padding: 20px 0
}

.text-muted {
	color: #adb5bd !important
}

ul {
	padding-bottom: 20px
}

ul li a img {
	background: #66BB6A;
	top: 0;
	border: none;
	width: 20px
}

.sidebar ul li {
	padding: 15px
}

.sidebar ul li a {
	color: #fff;
	display: block
}

.sidebar ul li a .fas {
	width: 30px;
	color: #bdb8d7 !important
}

i.fas.fa-home:hover, i.fas.fa-file-invoice:hover, i.fas.fa-video:hover,
	i.fas.fa-id-badge:hover, i.fas.fa-external-link-alt:hover, i.fas.fa-code:hover,
	i.far.fa-calendar-alt:hover, i.far.fa-credit-card:hover {
	color: #304FFE !important
}

.sidebar ul li a .far {
	width: 30px;
	color: #bdb8d7 !important
}

.sidebar ul li:hover {
	background: #000
}

.sidebar ul li a:hover {
	text-decoration: none
}
</style>
</head>
<div class="leftbar col-md-3">
	<div class="wrapper d-flex">
		<div class="sidebar">
			<small class="text-muted pl-3">Chức năng</small>
			<ul>
				<li class="side-bar">
			<a href='<c:url value="/content/exam"/>'>
              <span class="glyphicon glyphicon-tasks">&nbsp;</span>Quản lý Đề thi</a>
			</ul>
		</div>
	</div>
</div>


