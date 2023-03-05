package com.devcolibri.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

@WebServlet("/download")
public class DownloadServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads"; // директория, где хранятся файлы для скачивания
    private static final int BUFFER_SIZE = 4096; // размер буфера для чтения файла

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = request.getParameter("fileName");
        if (fileName == null || fileName.equals("")) {
            response.sendRedirect(request.getContextPath() + "/files");
            return;
        }
    }
}
