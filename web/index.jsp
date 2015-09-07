<%@page import="java.sql.*"%>
<%@page import="dk.ToDoList.*"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/react.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/JSXTransformer.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="react-bs/react-bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> <!-- Font awesome! -->
    <link rel="stylesheet" href="css/bootstrap.css"/>
	<link rel="stylesheet" href="css/style.css"/>
    <title>ToDoList</title>
</head>
<body>
<div id="container"></div>

<script type="text/jsx">
    var React = require('react');
    var ReactBootstrap = require('react-bootstrap');
    var Button = ReactBootstrap.Button;
    var Modal = ReactBootstrap.Modal;
    
    
    
    /** @jsx React.DOM */
    var TodoItems = React.createClass({
        render: function() {
            return <table className="table">
                        <tbody>
                            <% 
							if(session.getAttribute("LoggedIn") != null) { 
								Connection con = DriverManager.getConnection(
									DatabaseString.Driver + ":" +
										DatabaseString.Protocol + ":" +
										DatabaseString.serverURL,
									DatabaseString.username,
									DatabaseString.password);
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT textToDo, cat FROM ToDo where userOwner = '" + session.getAttribute("LoggedInID") + "';");
								
								while (rs.next()) {
									out.println("<tr><td><h4>" + rs.getString("textToDo") + "</h4></td></tr>");
								}
							}
							else {
								out.println("<p><a href=\"login.jsp\">Login</a> or <a href=\"signup.jsp\">register</a></p>");
							}
						%>
                        </tbody>
                    </table>;
       }
    });
       
    const ModalTrigger = React.createClass({
        
         

         getInitialState(){
            return { showModal:false };
        },
        
        close(){
            this.setState({ showModal:false });
        },
        
        open(){
            this.setState({ showModal:true });
        },
        
        render() {
            return (
                <div>
               
                    <Button bsStyle='primary' onClick={this.state.open}>Add New</Button>
                    
                    <Modal show={this.state.showModal} onHide={this.close}>
                        <Modal.Header>
                           <Modal.Title>Add New Todo</Modal.Title>
                        </Modal.Header>
                        <Modal.Body>
                            <form>
                              <div className="form-group">
                                <input type="text" className="form-control" placeholder="Todo..."/>
                              </div>
                              <div className="checkbox">
                                <label>
                                  <input type="checkbox"/>
                                </label>
                              </div>
                            </form>
                        </Modal.Body>
                    </Modal>
                </div>
            );
        }
    });

						
    
//    var ModalAddNewControl = React.createClass({
//        getInitialState(){
//            return { showModal:false};
//        },
//        
//        close(){
//            this.setState({showModal:false});
//        },
//       
//       
//        open(){
//            this.setState({showModal:true});
//        },
//        render() {
//            return (
//                <div>
//                   <Button bsStyle='primary' onClick={this.state.open}>
//                       Add New  <span className="glyphicon glyphicon-plus" aria-hidden="true">
//                        </span>
//                    </Button>
//                    
//                    <Modal show={this.state.showModal} onHide={this.close}>
//                        <Modal.Header closeButton>
//                           <Modal.Title>Add New Todo</Modal.Title>
//                        </Modal.Header>
//                        <Modal.Body>
//                            
//                
//            );
//        }
//    });
    
    var ToolBar = React.createClass({
       render: function() {
           return <div className={this.props.navClass}>
                        <a href="index.jsp" className={this.props.brand}>Todo List</a>
                        <ModalAddNewControl btnClass="btn btn-primary"/>
						<div class="navbar-collapse collapse">
							<button className="btn btn-primary navbar-btn navbar-left" type="button" data-toggle="modal" data-target="#addNewModal">Add New    <span className="glyphicon glyphicon-plus" aria-hidden="true">
							</span></button>
							<%
								if(session.getAttribute("LoggedIn") == null){ 
									out.print("<form method=\"post\" action=\"login.jsp\">"
											+ "<button className=\"btn btn-primary navbar-btn navbar-left btn-login\" type=\"submit\" data-toggle=\"modal\" data-target=\"#addNewModal\">"
											+ "Login"
											+ "<span className=\"fa fa-user fa-fw\" aria-hidden=\"true\"></span></button>"
											+ "</form>");
								}
								else{
									out.print("<form method=\"post\" action=\"logginout.jsp\">"
											+ "<button className=\"btn btn-primary navbar-btn navbar-left btn-login\" type=\"submit\" data-toggle=\"modal\" data-target=\"#addNewModal\">"
											+ "Logout"
											+ "<span className=\"fa fa-user fa-fw\" aria-hidden=\"true\"></span></button>"
											+ "</form>");
								}
							%>
						</div>
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
    //DBTools db = new DBTools();
    //List ls = db.getToDoById(1);
%>

</body>
</html>
