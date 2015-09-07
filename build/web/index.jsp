<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dk.ToDoList.DBTools"%>
<%@ page import="dk.ToDoList.List" %>

<!DOCTYPE html>
<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/react.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/JSXTransformer.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <title>ToDoList</title>
</head>
<body>
<div id="container"></div>

<script type="text/jsx">
    /** @jsx React.DOM */
    var TodoItems = React.createClass({
        render: function() {
            return <table className="table">
                        <tbody>
                            <tr><td><h4>Text1</h4></td></tr>
                            <tr><td><h4>Text2</h4></td></tr>
                            <tr><td><h4>Text3</h4></td></tr>
                            <tr><td><h4>Text4</h4></td></tr>
                         </tbody>
                    </table>;
       }
    });
    
    var ToolBar = React.createClass({
       render:function() {
           return <div className={this.props.navClass}>
                        <a href="#" className={this.props.brand}>Todo List</a>
                        <input className="btn btn-default navbar-btn" type="button" value="Add New"/>
                   </div>;
       } 
    });
    
    
    var Main = React.createClass({
        render: function() {
            return <div>
                     <ToolBar navClass="navbar navbar-default" brand="navbar-brand"/>
                     <TodoItems/>
                   </div>;
        }
    });
    
    
     React.render(
        <Main/>,
        document.getElementById('container')
      );
    
</script>

<% 
    if (session.getAttribute("LoggedIn") != null){
		out.println("Test");
	}
%>

</body>
</html>
