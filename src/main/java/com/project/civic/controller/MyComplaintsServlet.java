package com.project.civic.controller;

import com.project.civic.model.Complaint;
import com.project.civic.model.User;
import com.project.civic.repository.ComplaintRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/myComplaints")
public class MyComplaintsServlet extends HttpServlet {

    private final ComplaintRepository repository = new ComplaintRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");

        List<Complaint> complaints = repository.findByUserId(user.getId());

        request.setAttribute("complaints", complaints);

        request.getRequestDispatcher("jsp/complaint-list.jsp").forward(request, response);
    }
}