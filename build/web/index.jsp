<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dk.ToDoList.*" %>

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
                        <tr><td><h3>Text1</h3></td></tr>
                        <tr><td><h3>Text2</h3></td></tr>
                        <tr><td><h3>Text3</h3></td></tr>
                        <tr><td><h3>Text4</h3></td></tr>
                     </tbody>
                    </table>
       }
    });
    
    var ToolBar = React.createClass({
       render:function() {
           return <div className={this.props.navClass}>
                        <a href="#" className={this.props.brand}>Todo List</a>
                        <input className="btn" type="button" value="Add ToDo"/>
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
    


//
//    var TodoTabel = React.createClass({
//        render: function() {
//            return <tabel className={this.props.tblClass}>
//                    <thead><tr><th><h3>Todo List</h3><th></tr></thead>
//                        <TodoItems/>
//                    </tabel>;
//
//        }
//    });
//
    
//
//    var ToolBar = React.createClass({
//        render: function() {
//            return <div className={this.props.navClass}>
//                    <a href="#" className={this.props.brand}>Todo List</a>
//                   </div>;
//        }
//    });
//
//    React.render(
//            <Main/>,
//    document.getElementById('container')
//    );
</script>


</body>
</html>
