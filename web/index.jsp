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

                                    ResultSet rs = stmt.executeQuery("SELECT ID, textToDo, cat, dato FROM ToDo where userOwner = '" + session.getAttribute("LoggedInID") + "';");
                                   
                                    String colour = "white";
                                    int id;
                                    
                                    while (rs.next()) {
                                         id = rs.getInt("ID");
                                        switch(rs.getInt("cat")){
                                        case 1:
                                            colour = "red";
                                            break;
                                        case 2:
                                            colour = "green";
                                            break;
                                        case 3:
                                            colour = "blue";
                                            break;
                                        default:
                                            colour = "black";
                                            break;
                                    }
                                        out.println("<tr className=\"" + colour + "\"><td><h4>" + rs.getString("textToDo") + "</h4><br/><p fontSize='3' style={{color: 'lightgrey'}}>" + rs.getDate("dato") + "</p></td>"
                                                + "<td><form method='post' action='deleteToDo.jsp'><button name='ID' value='"+ id +"' id='delTodo' className='btn btn-warning btn-lg'>Delete</button></form></td></tr>");
                       
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
                    <button type="button" className="btn btn-primary navbar-left btn-lg" data-toggle="modal" data-target="#myModal">
                        Add New Todo  <span className="glyphicon glyphicon-plus"></span>
                    </button>
                    <div className="modal fade" id="myModal" tabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div className="modal-dialog">
                        <div className="modal-content">
                          <div className="modal-header">
                            <h4 className="modal-title" id="myModalLabel">Add New Todo</h4>
                          </div>
                          <div className="modal-body">
                            <form method="post" action="newToDo.jsp">
                              <input name="ToDoText" type="text" id="inputText" className="form-control" placeholder="Your text here" required="" autofocus="" />
                              <br />
                              <input name="remind" type="checkbox" value="reminder" /><span> Remind me about this.</span>
                                <br />
                                <select name="colour">
                                      <option value="dropdown">Category</option>
                                      <option value="apple">Birthday</option>
                                      <option value="orange">Work</option>
                                      <option value="grapes">Hobby</option>
                                </select>
                                <div className="modal-footer">
                                    <button type="button" className="btn btn-danger" data-dismiss="modal">Close</button>
                                    <button type="submit" className="btn btn-primary">Save</button>
                                </div>
                            </form>
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
                        
                        <%
                            if(session.getAttribute("LoggedIn") == null) { 
                                out.print("<form method=\"post\" action=\"login.jsp\">"
                                        + "<button className=\"btn btn-primary btn-lg navbar-left btn-login\" type=\"submit\" data-toggle=\"modal\" data-target=\"#addNewModal\">Login"
                                        + "<span className=\"fa fa-user fa-fw\" aria-hidden=\"true\"></span></button>"
                                        + "</form>");
                            }
                            else {
                                out.print("<AddNewModal/>  <form method=\"post\" action=\"logginout.jsp\">"
                                        + "<button className=\"btn btn-primary btn-lg navbar-left btn-login\" type=\"submit\" data-toggle=\"modal\" data-target=\"#addNewModal\">Logout"
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
