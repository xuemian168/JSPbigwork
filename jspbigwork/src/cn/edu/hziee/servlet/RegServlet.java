package cn.edu.hziee.servlet;

import cn.edu.hziee.model.User;
import cn.edu.hziee.utils.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class RegServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tablename = "user01";
        request.setCharacterEncoding("utf-8");
        String userName = (String) request.getParameter("userName");
        String pwd = (String) request.getParameter("pwd");
        String repwd = (String) request.getParameter("repwd");
        if (pwd == repwd && pwd!=null) {
            User user = new User(userName, pwd);
            System.out.println(user);
            DBUtils db = null;
            try {
                db = new DBUtils();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
            String[] field = {"username", "password"};
            String[] value = {user.getUserName(), user.getPwd() + ""};
            boolean checkexsist = db.checkedLogin(tablename, "username='" + userName + "'");
            if (!checkexsist) {
                db.insertData(tablename, field, value);
                boolean checkLogin = db.checkedLogin(tablename, "username='" + userName + "'");
                if (checkLogin) {
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("admin/index.jsp").forward(request, response);
                } else
                    request.getRequestDispatcher("error.jsp?id=222").forward(request, response);
            } else {
                request.getSession().setAttribute("msg", "333");
                request.getRequestDispatcher("error.jsp?id=333").forward(request, response);
            }
        }else{
            request.getSession().setAttribute("msg", "601");
            request.getRequestDispatcher("error.jsp?id=601").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
