package com.project.civic.controller;

import com.project.civic.model.Complaint;
import com.project.civic.model.User;
import com.project.civic.repository.ComplaintRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/addComplaint")
public class ComplaintServlet extends HttpServlet {

    private final ComplaintRepository repository = new ComplaintRepository();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect("jsp/login.jsp");
            return;
        }

        String title = request.getParameter("title");
        String description = request.getParameter("description");

        if(title == null || title.isEmpty()) {
            request.setAttribute("error", "Title is required");
            request.getRequestDispatcher("jsp/add-complaint.jsp").forward(request, response);
            return;
        }

        repository.save(new Complaint(title, description, "Pending", user.getId()));
        response.sendRedirect("jsp/complaint-list.jsp");
    }
}