<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Query result</title>
    <style>
        table {
            width: 50%;
            margin: 0 auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: center;
            border: 1px solid black;
             background-color: #ffea00;
        }

        th {
            font-weight: bold;
        }

        tr:nth-child(even) td {
            background-color: #ffffff;
        }

        tr:nth-child(odd) td {
            background-color: #e6e6e6;
        }
    </style>
</head>
<body>
    <h1>Query result</h1>

    <%
    Document document = (Document) request.getAttribute("xml");
    if (document != null) {
    %>

    <table>
        <thead>
            <tr>
                <%
                // Retrieve the header names from the XML response
                NodeList headerNodes = document.getElementsByTagName("variable");
                for (int i = 0; i < headerNodes.getLength(); i++) {
                    Element headerElement = (Element) headerNodes.item(i);
                    String headerName = headerElement.getAttribute("name");
                %>
                <th><%= headerName %></th>
                <% } %>
            </tr>
        </thead>
        <tbody>
            <%
            // Retrieve the data rows from the XML response
            NodeList rowNodes = document.getElementsByTagName("result");
            for (int i = 0; i < rowNodes.getLength(); i++) {
                Element rowElement = (Element) rowNodes.item(i);
            %>
            <tr>
                <%
                // Retrieve the values for each column in the current row
                NodeList bindingNodes = rowElement.getElementsByTagName("binding");
                for (int j = 0; j < bindingNodes.getLength(); j++) {
                    Element bindingElement = (Element) bindingNodes.item(j);
                    String columnName = bindingElement.getAttribute("name");
                    String columnValue = bindingElement.getElementsByTagName("literal").item(0).getTextContent();
                %>
                <td><%= columnValue %></td>
                <% } %>
            </tr>
            <% } %>
        </tbody>
    </table>

    <% } else { %>

    <p>No XML response available.</p>

    <% } %>

</body>
</html>

