<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather Search</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .weather-card {
            padding: 20px;
            border-radius: 10px;
            color: #fff;
            transition: background-color 0.3s;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Weather App</h2>
        <form action="<%= application.getContextPath() %>/MyServer" method="post" class="search-form">
            <input type="text" id="city-input" name="city" placeholder="Enter city name" required>
            <button type="submit">Search</button>
        </form>
        <div class="weather-card" id="weather-card">
            <div class="weather-icon">
                <img src="" alt="Weather Icon" id="weather-icon">
            </div>
            <div class="weather-info">
                <h2 class="city" id="city-name"><%= request.getAttribute("city") %></h2>
                <p class="temperature" id="temperature"><%= request.getAttribute("temp") %>°C</p>
                <p class="condition" id="condition"><%= request.getAttribute("weather") %></p>
                <p class="wind-speed" id="wind-speed">
                    <i class="material-icons">air</i> <%= request.getAttribute("wind") %> km/h
                </p>
                <p class="humidity" id="humidity">
                    <i class="material-icons">opacity</i> Humidity: <%= request.getAttribute("humidity") %>%
                </p>
            </div>
        </div>
    </div>

    <script>
        var weatherIcon = document.getElementById("weather-icon");
        var weatherCard = document.getElementById("weather-card");
        var conditionElement = document.getElementById("condition");
        var conditionText = conditionElement.textContent.trim(); // Extract and trim the condition text

        switch (conditionText) {
            case 'Clouds':
                weatherIcon.src = "https://cdn-icons-png.flaticon.com/512/1146/1146869.png";
                weatherCard.style.backgroundColor = "#BDC3C7";
                break;
            case 'Clear':
                weatherIcon.src = "https://cdn-icons-png.flaticon.com/512/6974/6974833.png";
                weatherCard.style.backgroundColor = "#75afd6";
                break;
            case 'Rain':
                weatherIcon.src = "https://cdn-icons-png.flaticon.com/512/1163/1163657.png";
                weatherCard.style.backgroundColor = "#1E90FF";
                break;
            case 'Mist':
                weatherIcon.src = "https://cdn-icons-png.flaticon.com/512/3313/3313998.png";
                weatherCard.style.backgroundColor = "#52a9ff";
                break;
            case 'Snow':
                weatherIcon.src = "https://cdn-icons-png.flaticon.com/512/2315/2315309.png";
                weatherCard.style.backgroundColor = "#F0F8FF";
                break;
            case 'Haze':
                weatherIcon.src = "https://cdn-icons-png.flaticon.com/512/8691/8691507.png";
                weatherCard.style.backgroundColor = "#D3D3D3";
                break;
            case 'Thunderstorm':
                weatherIcon.src = "https://cdn-icons-png.flaticon.com/512/1146/1146860.png";
                weatherCard.style.backgroundColor = "#9979bc";
                break;
            default:
                weatherIcon.src = "default-image-url.png";
                weatherCard.style.backgroundColor = "#BDC3C7";
                break;
        }
    </script>
</body>
</html>
