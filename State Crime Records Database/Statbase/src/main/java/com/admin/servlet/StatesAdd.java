package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.StateDAOImpl;
import com.DB.DBConnect;
import com.entity.StateDtls;

@WebServlet("/add_data")
public class StatesAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String statename = req.getParameter("statename");
            int year = Integer.parseInt(req.getParameter("year"));
            Double stolen = Double.parseDouble(req.getParameter("stolen"));
            Double recovered = Double.parseDouble(req.getParameter("recovered"));

            StateDtls s = new StateDtls(statename, year, stolen, recovered);
            //System.out.println(s);
            
            StateDAOImpl dao = new StateDAOImpl(DBConnect.getConn());
            boolean f = dao.addStates(s);
            
            HttpSession session = req.getSession();
            
            if(f) {
            	session.setAttribute("succMsg", "Added Successfully");
            	resp.sendRedirect("Admin/add_data.jsp");
            }else {
            	session.setAttribute("failedMsg", "Something wrong on server");
            	resp.sendRedirect("Admin/add_data.jsp");
            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

