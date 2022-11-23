package cn.edu.hziee.servlet;

import cn.edu.hziee.utils.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class EditpostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String thenew = request.getParameter("new");
        String id = request.getParameter("id");
        DBUtils db = null;
        try {
            db = new DBUtils();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String[] field = {"id", "username", "contents"};
        String[] value = {id, thenew};
        db.editpost(id, thenew);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
