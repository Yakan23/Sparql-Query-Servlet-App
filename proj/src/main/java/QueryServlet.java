import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

import org.apache.jena.query.*;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;

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
        ByteArrayOutputStream sw = new ByteArrayOutputStream();
        ResultSetFormatter.outputAsXML(sw, results);
        String xml = sw.toString();
        request.setAttribute("xml", xml);
        // qe.close();
        RequestDispatcher rd = request.getRequestDispatcher("Results.jsp");

        rd.forward(request, response);
    }
}