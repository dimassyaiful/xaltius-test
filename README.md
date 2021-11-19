# Xaltius React & Flutter Test

## Intro
Hello, my name is Dimas Syaiful. and this is the react & flutter apps for Xaltius Frontend Recruitment Skill Test


## React Apps
- My React application is in folder kanban-react-app
- for live testing you can access it here http://testing-kanban.surge.sh/
 
## Flutter Apps
- My React application is in folder kanban-react-app
- for apps testing you can download it [here](/kanban_flutter_app/build/app/outputs/flutter-apk/app-release.apk)  


## Notes
- Im having some CORS issue when developing, so i cannot hit the API directly. so I created a simple proxy on my live hosting to set the header. 
- link API https://intonasikopi.com/xaltius-api.php
- here's the code in PHP
```
<?php 
    header('Access-Control-Allow-Origin: *'); 
    header('Access-Control-Allow-Methods: GET, POST');
    header("Access-Control-Allow-Headers: X-Requested-With"); 

    $ch = curl_init();  
    curl_setopt($ch, CURLOPT_URL, "http://52.221.251.68:8084/kanban/list");
 
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);  
    $output = curl_exec($ch);  
    curl_close($ch);       
    echo $output;
?>
```