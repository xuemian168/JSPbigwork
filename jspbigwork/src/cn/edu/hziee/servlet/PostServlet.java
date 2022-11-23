package cn.edu.hziee.servlet;

import cn.edu.hziee.utils.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class PostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String content = request.getParameter("content");
        String username = request.getParameter("username");
        DBUtils db = null;
        try {
            db = new DBUtils();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String[] field = {"username", "contents"};
        String[] value = {username,content};
        db.insertData("contents", field, value);
        request.getRequestDispatcher("./admin.jsp").forward(request, response);
        PrintWriter out = response.getWriter();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
