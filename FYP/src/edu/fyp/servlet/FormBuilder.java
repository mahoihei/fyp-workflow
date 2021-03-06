package edu.fyp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.google.appengine.api.datastore.Text;

import edu.fyp.bean.Employee;
import edu.fyp.bean.Form;
import edu.fyp.bean.User;
import edu.fyp.manager.FormManager;

public class FormBuilder extends HttpServlet {
	
	@Autowired
	private FormManager formManager;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
				config.getServletContext());
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/plain");
		PrintWriter out = resp.getWriter();
		if(req.getParameter("FormID").equalsIgnoreCase("")||
				req.getParameter("Version").equalsIgnoreCase("")){
			out.print("Form ID and Version can not be empty.");
			out.close();
			return ;
		}
		Employee emp = (Employee) req.getSession().getAttribute("BUILDEREMP");
		Form form = new Form();
		form.setFormHtml(new Text(req.getParameter("FormHtml")));
		form.setConstraint(req.getParameter("Constraint"));
		form.setDescription(req.getParameter("Description"));
		form.setTitle(req.getParameter("Title"));
		form.setCreatedDate(new Date());		
		form.setCreatedBy(emp.getEmpId());
//		form.setCreatedBy(req.getSession().getAttribute("EMPID").toString());
		form.setFormID(req.getParameter("FormID"));
		form.setVersion(req.getParameter("Version"));
		form.setPath(new Text(""));
		try{
			formManager.addForm(form);		
			out.println("Success.");
		}catch(Exception ex){
			Logger.getAnonymousLogger().warning(ex.getMessage());
			out.println("Error! Form design NOT saved!");
		}
		out.close();
	}
}
