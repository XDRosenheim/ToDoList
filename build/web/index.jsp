<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dk.ToDoList.DBTools" %>
<%@ page import="dk.ToDoList.List" %>

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
    var TodoItems = React.createClass({
       render: function() {
           return <div>
                    <ul className={this.props.group}>
                        <li className={this.props.item}>sdfd</li>
                        <li className={this.props.item}>sfdd</li>
                    </ul>
                   <div>;
       } 
    });

    var TodoPanel = React.createClass({
        render: function() {
            return <div className={this.props.panelClass}>{this.props.text}</div>
                           <TodoItems group="list-group" item="list-group-item" />;
        }
    });


    var Main = React.createClass({
        render: function() {
            return <div id="main">
                     <ToolBar navClass="navbar navbar-default"/>
                        <div className={this.props.divClass}>
                            <TodoPanel panelClass="panel-heading" text="My Todo's"/>
                        </div>
                    </div>;
        }
    });

    var ToolBar = React.createClass({
        render: function() {
            return <div className={this.props.navClass}>
                    <a className={this.props.brand}>Todo List</a>
                    <button type="button" className="btn btn" aria-label="Left Align">
                      <span className="glyphicon glyphicon-align-plus" aria-hidden="true"></span>
                     </button>       
                   </div>;
        }
    });

    React.render(<Main divClass="table-responsive" />, 
    document.getElementById('container')
    );
    </script>

	<% 
		DBTools dbTools = new DBTools();
		List list = dbTools.getToDoById(1);
	%>
	<form>
		ToDo: <input type="text" name="textToDo" value="<% list.getTextToDo(); %>" />
	</form>

</body>
</html>
