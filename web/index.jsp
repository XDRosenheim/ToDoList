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
    
    var ModalAddNew = React.createClass({
        render: function() {
            return <div class="modal fade">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                              <h4 class="modal-title">Modal title</h4>
                            </div>
                            <div class="modal-body">
                              <p>One fine body&hellip;</p>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                          </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                      </div><!-- /.modal -->
        }
    })
    
    var ToolBar = React.createClass({
       render:function() {
           return <div className={this.props.navClass}>
                        <a href="#" className={this.props.brand}>Todo List</a>
                        <button className="btn btn-primary navbar-btn" type="button" data-toggle="modal" data-target="#addNewModal">Add New    <span className="glyphicon glyphicon-plus" aria-hidden="truw">
                        </span></button>
                        
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
