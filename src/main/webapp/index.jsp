<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather Search</title>
    <link rel = "stylesheet" href = " <%= application.getContextPath() %>/style.css">
</head>
    <body>
        <div class="container">
            <form action="<%=application.getContextPath()%>/MyServer" method="post" class="search-form">
                <input type="text" id="city-input" name="city" placeholder="Enter city name" required>
                <button type="submit">Search</button>
            </form>
        </div>
    </body>
</html>
