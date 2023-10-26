<%@page import="com.file.entities.user"%>
<%@page import="com.file.entities.bookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.file.DB.DBconnect"%>
<%@page import="com.files.dao.bookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All recent book</title>
<%@include file="allComponent/AllCss.jsp" %>

<style type="text/css">

.crd-ho:hover
{
background-color: #f8bbd0;
}
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */


</style>
</head>
<body>

<c:if test="${not empty addcart }">
	<div id="toast">${addcart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
<c:remove var="addcart" scope="session"/>

</c:if>

<%@include file="allComponent/navbar.jsp" %>

<% 

user u=(user) session.getAttribute("userobj");
System.out.println(u);
%>

<div class="container-fluid">
<div class="row p-3">
	<%
			bookDaoImpl dao=new bookDaoImpl(DBconnect.getCon());
			List<bookDetails> list= dao.getAllNewBook();
					
	
			for(bookDetails b:list)
			{%>
				<div class="col-md-3">
			<div class="card crd-ho">
		       <div class="card-body text-center">
			      <img alt="" src="bookname/<%=b.getPhoto() %>" style="width:150px;height:100px "class="img-thumblin">
			       <p> <%=b.getBookname() %></p>
			       <p><%=b.getAuthor() %></p>
			       <p> Categories:<%=b.getBookCategory() %></p>
		            <div class="row">
		            
		            <%
		            if(u==null)
		            {%>
		            	<a href="login.jsp" class="btn btn-danger btn-sm ml-2">
		            	<i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
		           <% }else
		           {%>
		        	   <a href="cartServlet?bid=<%=b.getBookid() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2">
		        	   <i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
		          <% }
		            %>
			          
		              <a href="viewBook.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-1">View Details</a>
		              <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-rupee-sign"></i> <%=b.getPrice() %></a>
			       </div>
		         </div>
		      </div>
		</div>	
				
			<% }
		%>
		

</div>
</div>


</body>
</html>