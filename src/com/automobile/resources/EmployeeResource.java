package com.automobile.resources;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.automobile.beans.Employee;
import com.automobile.daoImpl.EmployeeDAOImpl;

@Path("/emp")
public class EmployeeResource {
	private EmployeeDAOImpl empDao;

	public EmployeeResource() {
		super();
		this.empDao = new EmployeeDAOImpl();
	}

	@POST
	@Path("add")
	public String addEmployee(@FormParam("empId") String empId, @FormParam("empPassword") String empPassword,
			@FormParam("empName") String empName,@FormParam("userName") String userName, @Context HttpServletRequest request,
			@Context HttpServletResponse response) {
		System.out.println("add");
		String status = "Not Added";
		int result = 0;
		try {
			result = empDao.add(new Employee(empName, Long.parseLong(empId), empPassword,userName));

			if (result > 0) {
				status = result + " Added";
				System.out.println(status);
				response.sendRedirect("/AutomobileServiceCompany/index.jsp");

			}
			else {
				response.sendRedirect("/AutomobileServiceCompany/register.jsp");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return status;
	}

	@POST
	@Path("update")
	public Response updateDetails(@FormParam("empId") long empId, @FormParam("property") String property,
			@FormParam("newValue") String newValue) {
		Response result = null;
		try {
			result = Response.status(200).entity(empDao.modify(empId, property, newValue)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@DELETE
	@Path("remove")
	public Response deleteEmp(@QueryParam("empId") long empId) {
		Response result = null;
		try {
			result = Response.status(200).entity(empDao.remove(empId)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@GET
	@Path("getEmp")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getEmp(@QueryParam("empId") long empId) {
		Response result = null;
		try {
			result = Response.status(200).entity(empDao.get(empId)).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@GET
	@Path("getAllEmp")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAllEmps() {
		Response result = null;
		try {
			result = Response.status(200).entity(empDao.getAll()).build();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@POST
	@Path("login")
	public void getEmp(@FormParam("empId") String empId, @FormParam("empPassword") String empPassword,
			@Context HttpServletRequest request, @Context HttpServletResponse response) {

		boolean sts = false;
		try {
			sts = empDao.validateEmp(Long.parseLong(empId), empPassword);
		} catch (NumberFormatException | SQLException e) {
			e.printStackTrace();
		}

		if (sts) {
			request.getSession().setAttribute("isValidEmp", true);
			try {
				response.sendRedirect("/AutomobileServiceCompany/home.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			request.getSession().setAttribute("isValidEmp", false);
			try {
				response.sendRedirect("/AutomobileServiceCompany/index.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
