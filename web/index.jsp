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
     /** @jsx React.DOM */
    var Button = ReactBootstrap.Button;
    var ModalTrigger = ReactBootstrap.ModalTrigger;
    var Modal = ReactBootstrap.Modal;

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
    
    const AddNewModal = React.createClass({

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
                    <Modal show={this.state.showModal} onHide={this.close}>
                        <Modal.Header>
                           <Modal.Title>Add New Todo</Modal.Title>
                        </Modal.Header>
                        <Modal.Body>
                           hej
                        </Modal.Body>
                      <Modal.Footer>
                        <Button onClick={this.close}>Close</Button>
                      </Modal.Footer>
                    </Modal>
                </div>
            );
        }
    });
    
    var ToolBar = React.createClass({
       render: function() {
           return <div className={this.props.navClass}>
                        <a href="index.jsp" className={this.props.brand}>Todo List</a>
						<div class="navbar-collapse collapse">
							<ModalTrigger modal={<AddNewModal/>}>
								<Button bsStyle='primary' className="btn btn-primary navbar-left">Add New<span className="glyphicon glyphicon-plus"></span></Button>
							</ModalTrigger>
							<%
								if(session.getAttribute("LoggedIn") == null) { 
									out.print("<form method=\"post\" action=\"login.jsp\">"
											+ "<button className=\"btn btn-primary navbar-left btn-login\" type=\"submit\" data-toggle=\"modal\" data-target=\"#addNewModal\">Login"
											+ "<span className=\"fa fa-user fa-fw\" aria-hidden=\"true\"></span></button>"
											+ "</form>");
								}
								else {
									out.print("<form method=\"post\" action=\"logginout.jsp\">"
											+ "<button className=\"btn btn-primary navbar-left btn-login\" type=\"submit\" data-toggle=\"modal\" data-target=\"#addNewModal\">Logout"
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
</body>
</html>
