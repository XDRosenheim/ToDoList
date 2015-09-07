<%@page import="java.sql.*"%>
<%@page import="dk.ToDoList.*"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/react.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/JSXTransformer.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <script src="js/bootstrap.js" type="text/javascript"></script>
    <link href="http://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> <!-- Font awesome! -->
    
    <link rel="stylesheet" href="css/style.css"/>
    
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
                                    out.println("<h5><a href=\"login.jsp\">Login</a> or <a href=\"signup.jsp\">register</a></h5>");
                                }
                            %>
                        </tbody>
                    </table>;
       }
    });
    
    var AddNewModal = React.createClass({
        render: function () {
        return  <div>
                    <button type="button" className="btn btn-primary navbar-left" data-toggle="modal" data-target="#myModal" style={{marign:'2em'}}>
                      Add New Todo
                    </button>
                    <div className="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div className="modal-dialog">
                        <div className="modal-content">
                          <div className="modal-header">
                            <h4 className="modal-title" id="myModalLabel">Add New Todo</h4>
                          </div>
                          <div className="modal-body">
                            <form>
                              <input name="ToDoText" type="text" id="inputText" class="form-control" placeholder="Your text here" required="" autofocus="" />
                              <br />
                              <input type="checkbox" value="reminder" /><span> Remind me about this.</span>
                            </form>
                          </div>
                          <div className="modal-footer">
                            <button type="button" className="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" className="btn btn-primary">Save</button>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
    }
    });

    var BrandStyle = {
        color: '#CC423F',
        fontFamily: 'Lobster', // Lobster... That's almost worst than comic-sans. ( And it's done in red :| )
        fontSize: '32px'
    };
    
    var ToolBar = React.createClass({
       render: function() {
           return <div className={this.props.navClass}>
                   <a href="index.jsp" className={this.props.brand} style={BrandStyle}>Todo List</a>
                    <div className="navbar-collapse collapse">
                        <AddNewModal/>  
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
