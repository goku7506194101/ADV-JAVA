<%@ page import="bean.AccountBean" %>
<jsp:useBean id="acc" class="bean.AccountBean" scope="session" />

<html>
<head>
<title>Bank Account</title>
</head>

<body>

<h2>Bank Account Operations</h2>

<form method="post">

Account No: <input type="text" name="ano"><br><br>

Name: <input type="text" name="name"><br><br>

Amount: <input type="text" name="amount"><br><br>

<input type="submit" name="action" value="Deposit">
<input type="submit" name="action" value="Withdraw">

</form>

<%
String action = request.getParameter("action");

if (action != null) {

    int ano = Integer.parseInt(request.getParameter("ano"));
    String name = request.getParameter("name");
    double amount = Double.parseDouble(request.getParameter("amount"));

    acc.setAccountNo(ano);
    acc.setName(name);

    if (action.equals("Deposit")) {
        acc.deposit(amount);
    } 
    else if (action.equals("Withdraw")) {
        boolean success = acc.withdraw(amount);

        if (!success) {
            out.println("<p style='color:red'>Insufficient Balance</p>");
        }
    }
}
%>

<h3>Account Information</h3>

Account No: <%= acc.getAccountNo() %><br>

Name: <%= acc.getName() %><br>

Balance: <%= acc.getBalance() %><br>

</body>
</html>