<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.io.StringReader, java.io.StringWriter, javax.xml.transform.OutputKeys, javax.xml.transform.Source, javax.xml.transform.Transformer, javax.xml.transform.TransformerFactory, javax.xml.transform.stream.StreamResult, javax.xml.transform.stream.StreamSource" %>

<%
String xml = (String) request.getAttribute("xml");
System.out.println(xml);
Source source = new StreamSource(new StringReader(xml));
TransformerFactory transformerFactory = TransformerFactory.newInstance();
System.out.println(source);
Transformer transformer = transformerFactory.newTransformer();
transformer.setOutputProperty(OutputKeys.INDENT, "yes");

StringWriter writer = new StringWriter();
transformer.transform(source, new StreamResult(writer));
String formattedXml = writer.toString();
%>
<html>
<head>
    <title>Results</title>
</head>
<body>
    <h1>Results</h1>
    <pre><%= formattedXml %></pre>
</body>
</html>
