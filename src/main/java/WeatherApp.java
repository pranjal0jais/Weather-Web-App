import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

@WebServlet("/MyServer")
public class WeatherApp extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String city = req.getParameter("city");
        String apiKey = ""; // Use a secure method for storing API keys in production

        String apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + apiKey;

        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        try (InputStream inputStream = connection.getInputStream();
             InputStreamReader reader = new InputStreamReader(inputStream);
             Scanner sc = new Scanner(reader)) {

            StringBuilder content = new StringBuilder();
            while (sc.hasNext()) {
                content.append(sc.nextLine());
            }

            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(content.toString(), JsonObject.class);

            double tempK = jsonObject.getAsJsonObject("main").get("temp").getAsDouble();
            int tempC = (int) (tempK - 273.15);

            String weather = jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("main").getAsString();
            String description = jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("description").getAsString();

            int humidity = jsonObject.getAsJsonObject("main").get("humidity").getAsInt();
            double windSpeed = jsonObject.getAsJsonObject("wind").get("speed").getAsDouble();

            req.setAttribute("temp", tempC);
            req.setAttribute("wind", windSpeed);
            req.setAttribute("humidity", humidity);
            req.setAttribute("weather", weather);
            req.setAttribute("weatherDesc", description);
            req.setAttribute("city", city);
            RequestDispatcher rd = req.getRequestDispatcher("/main.jsp");
            rd.forward(req,resp);
        } finally {
            connection.disconnect();
        }
    }
}
