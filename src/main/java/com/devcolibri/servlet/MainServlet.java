package com.devcolibri.servlet;

import javax.naming.spi.DirectoryManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = "path";
        if (request.getParameter(path) == null) {
            request.setAttribute("path", Paths.get("").toAbsolutePath().toString());
        }
        else {
            request.setAttribute("path", request.getParameter(path));

        }
        File dir = new File(request.getAttribute(path).toString());
        File[] arrFiles = dir.listFiles();
        Arrays.sort(arrFiles);
        request.setAttribute("parent", Paths.get(request.getParameter(path)).getParent().toAbsolutePath().toString()
                .replace("\\", "/"));
        request.setAttribute("date", new Date(System.currentTimeMillis()));
        request.setAttribute("list", Arrays.asList(arrFiles));
        request.setAttribute("url", request.getRequestURI());
        getServletContext().getRequestDispatcher("/mypage.jsp").forward(request, response);
    }

}