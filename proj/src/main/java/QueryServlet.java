import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

import org.apache.jena.query.*;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.w3c.dom.Document;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.xml.sax.InputSource;
import java.io.ByteArrayOutputStream;
import java.io.StringReader;
import javax.xml.parsers.ParserConfigurationException;
import org.xml.sax.SAXException;
import java.io.IOException;

public class QueryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fileName = "E:\\Ontologies\\Project\\Code\\LibraryOntologiesProject.owl";
        Model model = ModelFactory.createDefaultModel();
        model.read(fileName);
        String queryStr = request.getParameter("query");
        queryStr = "PREFIX uri: <http://www.semanticweb.org/mnouh/ontologies/2023/3/untitled-ontology-3#>\n\n"
                + queryStr;
        Query query = QueryFactory.create(queryStr);
        QueryExecution qe = QueryExecutionFactory.create(query, model);
        ResultSet results = qe.execSelect();
        try {
            ByteArrayOutputStream sw = new ByteArrayOutputStream();
            ResultSetFormatter.outputAsXML(sw, results);
            String xml = sw.toString();

            // Parse the XML string into a Document object
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            InputSource inputSource = new InputSource(new StringReader(xml));
            Document document = builder.parse(inputSource);

            // Store the Document object in the request attribute
            request.setAttribute("xml", document);
        } catch (ParserConfigurationException | SAXException | IOException e) {
            // Handle the exception appropriately (e.g., logging, error response)
            e.printStackTrace();
            // Optionally, redirect or forward to an error page
            // request.getRequestDispatcher("error.jsp").forward(request, response);
        }

        // qe.close();
        RequestDispatcher rd = request.getRequestDispatcher("Results.jsp");

        rd.forward(request, response);
    }
}
